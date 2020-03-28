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

import com.dhavisoft.rms.dto.FacultyDTO;
import com.dhavisoft.rms.service.CollegeServiceInt;
import com.dhavisoft.rms.service.CourseServiceInt;
import com.dhavisoft.rms.service.ProgramServiceInt;

/**
 * Hibernate implementation of Faculty DAO.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */

@Repository("facultyDAO")
public class FacultyDAOHibImpl implements FacultyDAOInt {

	private static Logger log = Logger.getLogger(FacultyDAOHibImpl.class);
	
	@Autowired
	private SessionFactory sessionFactory;

	
	@Autowired
	ProgramServiceInt programService;

	/**
	 * Adds a Faculty
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public long add(FacultyDTO dto) {
		
		log.debug("DAO add Started");
		dto.setProgramName(programService.findByPK(dto.getProgramId()).getName());
		long pk = (Long) sessionFactory.getCurrentSession().save(dto);
		return pk;
	}

	/**
	 * Update a Faculty
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */

	public void update(FacultyDTO dto) {
		log.debug("DAO update Started");
		dto.setProgramName(programService.findByPK(dto.getProgramId()).getName());
		sessionFactory.getCurrentSession().update(dto);
	}

	/**
	 * Deletes a Faculty
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */

	public void delete(long id) {
		log.debug("DAO delete Started");
		FacultyDTO dto = new FacultyDTO();
		dto.setId(id);
		sessionFactory.getCurrentSession().delete(dto);
	}

	/**
	 * Finds Faculty by PK
	 * 
	 * @param pk
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */

	public FacultyDTO findByPK(long pk) {

		Session session = sessionFactory.getCurrentSession();
		FacultyDTO dto = (FacultyDTO) session.get(FacultyDTO.class, pk);
		session.evict(dto);
		return dto;
	}

	/**
	 * Finds Faculty by Name
	 * 
	 * @param login
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */

	public FacultyDTO findByLogin(String login) {
		System.out.println("EMAIL IN FACULTY DAO HIB IMPL" + login);
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(FacultyDTO.class).add(
				Restrictions.eq("email", login));
		List list = criteria.list();

		FacultyDTO dto = null;
		if (list.size() == 1) {
			dto = (FacultyDTO) list.get(0);
			session.evict(dto);
		}

		return dto;

	}

	/**
	 * Searches Faculty
	 * 
	 * @return list : List of Students
	 * @param dto
	 *            : Search Parameters
	 * @throws DatabaseException
	 */

	public List search(FacultyDTO dto) {
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

	public List search(FacultyDTO dto, int pageNo, int pageSize) {

		log.debug("DAO search Started");

		Criteria c = sessionFactory.getCurrentSession().createCriteria(
				FacultyDTO.class);

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
		if (dto.getMobileNo() != null && dto.getMobileNo().length() > 0) {
			c.add(Restrictions.like("mobileNo", dto.getMobileNo() + "%"));
		}
		if (dto.getProgramId() > 0) {
			c.add(Restrictions.eq("programId", dto.getProgramId()));
		}
		if (dto.getEmail() != null) {
			c.add(Restrictions.eq("email", dto.getEmail()));
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
