package com.dhavisoft.rms.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dhavisoft.rms.dto.FacultyDTO;
import com.dhavisoft.rms.dto.TrainerDTO;
import com.dhavisoft.rms.service.ProgramServiceInt;

/**
 * Hibernate implementation of Trainer DAO.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */

@Repository("trainerDAO")
public class TrainerDAOHibImpl implements TrainerDAOInt {

private static Logger log = Logger.getLogger(TrainerDAOHibImpl.class);
	
	@Autowired
	private SessionFactory sessionFactory;

	
	@Autowired
	ProgramServiceInt programService;

	/**
	 * Adds a Trainer
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public long add(TrainerDTO dto) {
		
		log.debug("DAO add Started");
		dto.setProgramName(programService.findByPK(dto.getProgramId()).getName());
		long pk = (Long) sessionFactory.getCurrentSession().save(dto);
		return pk;
	}

	/**
	 * Update a Trainer
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */

	public void update(TrainerDTO dto) {
		log.debug("DAO update Started");
		dto.setProgramName(programService.findByPK(dto.getProgramId()).getName());
		sessionFactory.getCurrentSession().update(dto);
	}

	/**
	 * Deletes a Trainer
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */

	public void delete(long id) {
		log.debug("DAO delete Started");
		TrainerDTO dto = new TrainerDTO();
		dto.setId(id);
		sessionFactory.getCurrentSession().delete(dto);
	}

	/**
	 * Finds Trainer by PK
	 * 
	 * @param pk
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */

	public TrainerDTO findByPK(long pk) {

		Session session = sessionFactory.getCurrentSession();
		TrainerDTO dto = (TrainerDTO) session.get(TrainerDTO.class, pk);
		session.evict(dto);
		return dto;
	}

	/**
	 * Finds Trainer by Name
	 * 
	 * @param login
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */

	public TrainerDTO findByLogin(String login) {
		System.out.println("EMAIL IN FACULTY DAO HIB IMPL" + login);
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(FacultyDTO.class).add(
				Restrictions.eq("emailId", login));
		List list = criteria.list();

		TrainerDTO dto = null;
		if (list.size() == 1) {
			dto = (TrainerDTO) list.get(0);
			session.evict(dto);
		}

		return dto;

	}
	
	public TrainerDTO findByEmail(String email) {
		TrainerDTO dto = null;
		Session session = null;

		try {
			session = sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(TrainerDTO.class);

			criteria.add(Restrictions.eq("email", email));
			
		
			List list = criteria.list();

			if (list.size() == 1) {
				dto = (TrainerDTO) list.get(0);
			}
		} catch (HibernateException e) {
			e.printStackTrace();

		} finally {
			System.out.println("FIND BY EMAIL FINALLY");
		}

		return dto;
	}

	/**
	 * Searches Trainer
	 * 
	 * @return list : List of Trainer
	 * @param dto
	 *            : Search Parameters
	 * @throws DatabaseException
	 */

	public List search(TrainerDTO dto) {
		return search(dto, 0, 0);
	}

	/**
	 * Searches Faculty with pagination
	 * 
	 * @return list : List of Faculty
	 * @param dto
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 * @throws DatabaseException
	 */

	public List search(TrainerDTO dto, int pageNo, int pageSize) {

		log.debug("DAO search Started");

		Criteria c = sessionFactory.getCurrentSession().createCriteria(TrainerDTO.class);

		if (dto.getFirstName() != null && dto.getFirstName().length() > 0) {
			c.add(Restrictions.like("firstName", dto.getFirstName() + "%"));
		}
		if (dto.getLastName() != null && dto.getLastName().length() > 0) {
			c.add(Restrictions.like("lastName", dto.getLastName() + "%"));
		}
		if (dto.getDob() != null && dto.getDob().getDate() > 0) {
			c.add(Restrictions.eq("dob", dto.getDob()));
		}
		if (dto.getEmail() != null && dto.getEmail().length() > 0) {
			c.add(Restrictions.like("email", dto.getEmail() + "%"));
		}
		if (dto.getAddress() != null && dto.getAddress().length() > 0) {
			c.add(Restrictions.like("address", dto.getAddress() + "%"));
		}
		if (dto.getMobileNo() != null && dto.getMobileNo().length() > 0) {
			c.add(Restrictions.like("mobileNo", dto.getMobileNo() + "%"));
		}
		if (dto.getProgramId() > 0) {
			c.add(Restrictions.eq("programId", dto.getProgramId()));
		}
		c.addOrder(Order.desc("id"));

		// if page size is greater than zero the apply pagination
		if (pageSize > 0) {
			c.setFirstResult(((pageNo - 1) * pageSize));
			c.setMaxResults(pageSize);
		}

		return c.list();
	}

	

}
