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

import com.dhavisoft.rms.dto.CandidateDTO;

/**
 * Hibernate implementation of Candidate DAO.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */

@Repository("candidateDAO")
public class CandidateDAOHibImpl implements CandidateDAOInt {

	private static Logger log = Logger.getLogger(CandidateDAOHibImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	/*
	 * @Autowired CollegeServiceInt collegeService;
	 */

	/**
	 * Adds a Candidate
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public long add(CandidateDTO dto) {
		log.debug("DAO add Started");

		/* dto.setCollegeName(collegeService.findByPK(dto.getCollegeId()).getName()); */
		long pk = (Long) sessionFactory.getCurrentSession().save(dto);
		return pk;
	}

	public void update(CandidateDTO dto) {
		log.debug("DAO update Started");
		/* dto.setCollegeName(collegeService.findByPK(dto.getCollegeId()).getName()); */
		sessionFactory.getCurrentSession().update(dto);

	}

	/**
	 * Deletes a Candidate
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public void delete(long id) {
		log.debug("DAO delete Started");
		/*
		 * CandidateDTO dto = new CandidateDTO(); dto.setId(id);
		 */
		CandidateDTO dto = (CandidateDTO) sessionFactory.getCurrentSession().get(CandidateDTO.class, id);
		sessionFactory.getCurrentSession().delete(dto);

	}

	/**
	 * Finds Candidate by Name
	 * 
	 * @param login : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public CandidateDTO findByLogin(String login) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(CandidateDTO.class).add(Restrictions.eq("email", login));
		List list = criteria.list();

		CandidateDTO dto = null;
		if (list.size() == 1) {
			dto = (CandidateDTO) list.get(0);
			session.evict(dto);
		}

		return dto;
	}

	/**
	 * Finds Candidate by PK
	 * 
	 * @param pk : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public CandidateDTO findByPK(long pk) {
		Session session = sessionFactory.getCurrentSession();
		CandidateDTO dto = (CandidateDTO) session.get(CandidateDTO.class, pk);
		session.evict(dto);
		return dto;
	}

	/**
	 * Searches Candidate
	 * 
	 * @return list : List of Candidate
	 * @param dto : Search Parameters
	 * @throws DatabaseException
	 */
	public List search(CandidateDTO dto) {
		return search(dto, 0, 0);
	}

	/**
	 * Searches Candidate with pagination
	 * 
	 * @return list : List of Candidate
	 * @param dto      : Search Parameters
	 * @param pageNo   : Current Page No.
	 * @param pageSize : Size of Page
	 * @throws DatabaseException
	 */
	public List search(CandidateDTO dto, int pageNo, int pageSize) {
		log.debug("DAO search Started");

		Criteria c = sessionFactory.getCurrentSession().createCriteria(CandidateDTO.class);

		/*
		 * if (dto.getId() > 0) { c.add(Restrictions.eq("id", dto.getId())); }
		 */
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
		if (dto.getContactNo() != null && dto.getContactNo().length() > 0) {
			c.add(Restrictions.like("contactNo", dto.getContactNo() + "%"));
		}
		if (dto.getBranchName() != null && dto.getBranchName().length() > 0) {
			c.add(Restrictions.like("branchName", dto.getBranchName() + "%"));
		}
		if (dto.getGender() != null && dto.getGender().length() > 0) {
			c.add(Restrictions.like("gender", dto.getGender() + "%"));
		}
		if (dto.getAddress() != null && dto.getAddress().length() > 0) {
			c.add(Restrictions.like("address", dto.getAddress() + "%"));
		}
		if (dto.getState() != null && dto.getState().length() > 0) {
			c.add(Restrictions.like("state", dto.getState() + "%"));
		}
		if (dto.getCity() != null && dto.getCity().length() > 0) {
			c.add(Restrictions.like("city", dto.getCity() + "%"));
		}
		if (dto.getCountry() != null && dto.getCountry().length() > 0) {
			c.add(Restrictions.like("country", dto.getCountry() + "%"));
		}
		if (dto.getYear() != null && dto.getYear().length() > 0) {
			c.add(Restrictions.like("year", dto.getYear() + "%"));
		}
		if (dto.getSemester() != null && dto.getSemester().length() > 0) {
			c.add(Restrictions.like("semester", dto.getSemester() + "%"));
		}
		if (dto.getAadharNo() != null && dto.getAadharNo().length() > 0) {
			c.add(Restrictions.like("aadharNo", dto.getAadharNo() + "%"));
		}
		if (dto.getCollegeName() != null && dto.getCollegeName().length() > 0) {
			c.add(Restrictions.like("collegeName", dto.getCollegeName() + "%"));
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
