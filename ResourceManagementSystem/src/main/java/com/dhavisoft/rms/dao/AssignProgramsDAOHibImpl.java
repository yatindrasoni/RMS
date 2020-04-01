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

import com.dhavisoft.rms.dto.AssignProgramsDTO;

import com.dhavisoft.rms.service.CourseServiceInt;
import com.dhavisoft.rms.service.ProgramServiceInt;

/**
 * Hibernate implementation of AssignPrograms DAO.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */

@Repository("AssignProgramsDAO")
public class AssignProgramsDAOHibImpl implements AssignProgramsDAOInt {

	private static Logger log = Logger.getLogger(AssignProgramsDAOHibImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	ProgramServiceInt programService;

	/**
	 * Adds a AssignPrograms
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public long add(AssignProgramsDTO dto) {

		log.debug("DAO add Started");

		dto.setProgramName(programService.findByPK(dto.getProgramId()).getName());
		;
		long pk = (Long) sessionFactory.getCurrentSession().save(dto);
		return pk;
	}

	public void update(AssignProgramsDTO dto) {
		log.debug("DAO update Started");

		dto.setProgramName(programService.findByPK(dto.getProgramId()).getName());
		sessionFactory.getCurrentSession().update(dto);
	}

	/**
	 * Deletes a AssignPrograms
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */

	public void delete(long id) {
		log.debug("DAO delete Started");
		AssignProgramsDTO dto = new AssignProgramsDTO();
		dto.setId(id);
		sessionFactory.getCurrentSession().delete(dto);
	}

	/**
	 * Finds AssignPrograms by PK
	 * 
	 * @param pk : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */

	public AssignProgramsDTO findByPK(long pk) {

		Session session = sessionFactory.getCurrentSession();
		AssignProgramsDTO dto = (AssignProgramsDTO) session.get(AssignProgramsDTO.class, pk);
		session.evict(dto);
		return dto;
	}

	/**
	 * Finds AssignPrograms by Name
	 * 
	 * @param login : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */

	public AssignProgramsDTO findByLogin(String login) {

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(AssignProgramsDTO.class).add(Restrictions.eq("email", login));
		List list = criteria.list();

		AssignProgramsDTO dto = null;
		if (list.size() == 1) {
			dto = (AssignProgramsDTO) list.get(0);
			session.evict(dto);
		}

		return dto;
	}

	public AssignProgramsDTO findByProgram(long programId, String firstName) {
		log.debug("Model findByProgram Started");

		AssignProgramsDTO dto = null;
		Session session = null;

		try {
			session = sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(AssignProgramsDTO.class);

			criteria.add(Restrictions.eq("programId", programId));
			criteria.add(Restrictions.eq("firstName", firstName));

			List list = criteria.list();

			if (list.size() == 1) {
				dto = (AssignProgramsDTO) list.get(0);
			}
		} catch (HibernateException e) {
			e.printStackTrace();

		} finally {
			System.out.println("FIND BY PROGRAM FINALLY");
		}

		return dto;
	}

	/**
	 * Searches AssignPrograms
	 * 
	 * @return list : List of AssignPrograms
	 * @param dto : Search Parameters
	 * @throws DatabaseException
	 */

	public List search(AssignProgramsDTO dto) {
		return search(dto, 0, 0);
	}

	/**
	 * Searches AssignPrograms with pagination
	 * 
	 * @return list : List of AssignPrograms
	 * @param dto      : Search Parameters
	 * @param pageNo   : Current Page No.
	 * @param pageSize : Size of Page
	 * @throws DatabaseException
	 */

	public List search(AssignProgramsDTO dto, int pageNo, int pageSize) {

		log.debug("DAO search Started");

		Criteria c = sessionFactory.getCurrentSession().createCriteria(AssignProgramsDTO.class);

		/*
		 * if (dto.getId() > 0) { c.add(Restrictions.eq("id", dto.getId())); }
		 */

		if (dto.getFirstName() != null && dto.getFirstName().length() > 0) {
			c.add(Restrictions.like("firstName", dto.getFirstName() + "%"));
		}

		if (dto.getLastName() != null && dto.getLastName().length() > 0) {
			c.add(Restrictions.like("lastName", dto.getLastName() + "%"));
		}

		if (dto.getProgramName() != null && dto.getProgramName().length() > 0) {
			c.add(Restrictions.like("programName", dto.getProgramName() + "%"));
		}
		if (dto.getProgramId() > 0) {
			c.add(Restrictions.eq("programId", dto.getProgramId()));
		}
		if (dto.getFee() != null && dto.getFee().length() > 0) {
			c.add(Restrictions.like("fee", dto.getFee() + "%"));
		}
		if (dto.getPaid() != null && dto.getPaid().length() > 0) {
			c.add(Restrictions.like("paid", dto.getPaid() + "%"));
		}
		if (dto.getDue() != null && dto.getDue().length() > 0) {
			c.add(Restrictions.like("due", dto.getDue() + "%"));
		}
		if (dto.getDiscount() != null && dto.getDiscount().length() > 0) {
			c.add(Restrictions.like("discount", dto.getDiscount() + "%"));
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
