package com.dhavisoft.rms.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dhavisoft.rms.dto.CourseDTO;
import com.dhavisoft.rms.dto.ProgramDTO;

/**
 * Hibernate implementation of Program DAO.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */

@Repository("programDAO")
public class ProgramDAOHibImpl implements ProgramDAOInt{

private static Logger log = Logger.getLogger(ProgramDAOHibImpl.class);
	
	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Adds a Program
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public long add(ProgramDTO dto) {
		
		log.debug("DAO add Started");
		long pk = (Long) sessionFactory.getCurrentSession().save(dto);
		return pk;	
	}

	/**
	 * Updates a Program
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public void update(ProgramDTO dto) {
		
		log.debug("DAO update Started");
		sessionFactory.getCurrentSession().update(dto);
		
	}

	/**
	 * Deletes a Program
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public void delete(long id) {
		
		log.debug("DAO delete Started");
		ProgramDTO dto = new ProgramDTO();
		dto.setId(id);
		sessionFactory.getCurrentSession().delete(dto);
		
	}

	/**
	 * Finds Program by Name
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public ProgramDTO findByName(String name) {
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(CourseDTO.class).add(Restrictions.eq("name", name));
		List list = criteria.list();

		ProgramDTO dto = null;
		if (list.size() == 1) {
			dto = (ProgramDTO) list.get(0);
			session.evict(dto);
		}

		return dto;
	}

	/**
	 * Finds Program by PK
	 * 
	 * @param pk
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public ProgramDTO findByPK(long pk) {
		
		System.out.println("COURSE ID: " + pk);
		System.out.println("IN COURSE DAO FIND BY PK");

		Session session = sessionFactory.getCurrentSession();
		ProgramDTO dto = (ProgramDTO) session.get(ProgramDTO.class, pk);
		session.evict(dto);
		return dto;
	}

	/**
	 * Searches Program
	 * 
	 * @return list : List of Program
	 * @param dto
	 *            : Search Parameters
	 * @throws DatabaseException
	 */
	public List search(ProgramDTO dto) {
		return search(dto, 0, 0);
	}

	/**
	 * Searches Program with pagination
	 * 
	 * @return list : List of Program
	 * @param dto
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 * @throws DatabaseException
	 */
	public List search(ProgramDTO dto, int pageNo, int pageSize) {
		
		log.debug("DAO search Started");

		Criteria c = sessionFactory.getCurrentSession().createCriteria(ProgramDTO.class);

		if (dto.getName() != null && dto.getName().length() > 0) {
			c.add(Restrictions.like("name", dto.getName() + "%"));
		}
		if (dto.getDescription() != null && dto.getDescription().length() > 0) {
			c.add(Restrictions.like("description", dto.getDescription() + "%"));
		}
		if (dto.getDuration() != null) {
			c.add(Restrictions.like("duration", dto.getDuration() + "%"));
			/* c.add(Restrictions.eq("duration", dto.getDuration())); */
		}
		c.addOrder(Order.desc("id"));

		// if page size is greater than zero then apply pagination
		if (pageSize > 0) {
			c.setFirstResult((pageNo - 1) * pageSize);
			c.setMaxResults(pageSize);
		}
		return c.list();
	}
	

}
