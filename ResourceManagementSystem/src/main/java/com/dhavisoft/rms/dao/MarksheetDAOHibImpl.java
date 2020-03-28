package com.dhavisoft.rms.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dhavisoft.rms.dto.MarksheetDTO;
import com.dhavisoft.rms.service.CandidateServiceInt;
import com.dhavisoft.rms.service.CollegeServiceInt;
import com.dhavisoft.rms.service.StudentServiceInt;
import com.dhavisoft.rms.util.DataValidator;

/**
 * Hibernate implementation of Marksheet DAO.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
@Repository("marksheetDAO")
public class MarksheetDAOHibImpl implements MarksheetDAOInt{

	private static Logger log = Logger.getLogger(MarksheetDAOHibImpl.class);
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	CandidateServiceInt candidateService;
	
	@Autowired
	CollegeServiceInt collegeService;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	/**
	 * Adds a Marksheet
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public long add(MarksheetDTO dto) {
		
		log.debug("DAO add Started");
		String candidateName = candidateService.findByPK(dto.getCandidateId()).getFirstName()+" "+ candidateService.findByPK(dto.getCandidateId()).getLastName();
		
		dto.setCollegeName(collegeService.findByPK(dto.getCollegeId()).getName());
		dto.setCandidateName(candidateName);
		return (Long) sessionFactory.getCurrentSession().save(dto);
	}

	/**
	 * Updates a Marksheet
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public long update(MarksheetDTO dto) {
		log.debug("Marksheet DAO Update Started");
		String candidateName = candidateService.findByPK(dto.getCandidateId())
				.getFirstName()
				+ " "
				+ candidateService.findByPK(dto.getCandidateId()).getLastName();
		
		dto.setCollegeName(collegeService.findByPK(dto.getCollegeId()).getName());
		
		dto.setCandidateName(candidateName);
		sessionFactory.getCurrentSession().update(dto);
		log.debug("Marksheet DAO Update Ends");
		return dto.getId();
	}

	/**
	 * Deletes a Marksheet
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public void delete(long id) {
		
		log.debug("DAO delete Started");
		MarksheetDTO dto = new MarksheetDTO();
		dto.setId(id);
		sessionFactory.getCurrentSession().delete(dto);
	}

	/**
	 * Finds Marksheet by Name
	 * 
	 * @param rollNo
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public MarksheetDTO findByRollNo(String rollNo) {
		Session session = sessionFactory.getCurrentSession();

		Criteria criteria = session.createCriteria(MarksheetDTO.class);
		criteria.add(Restrictions.eq("rollNo", rollNo));
		List<MarksheetDTO> list = criteria.list();

		MarksheetDTO dto = null;

		if (list.size() == 1) {
			dto = (MarksheetDTO) list.get(0);
			session.evict(dto);
		}
		return dto;
	}

	/**
	 * Finds Marksheet by PK
	 * 
	 * @param pk
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public MarksheetDTO findByPK(long pk) {
		
		Session session = sessionFactory.getCurrentSession();
		MarksheetDTO dto = (MarksheetDTO) session.get(MarksheetDTO.class, pk);
		session.evict(dto);
		return dto;
	}

	/**
	 * Searches Marksheets
	 * 
	 * @return list : List of Marksheets
	 * @param dto
	 *            : Search Parameters
	 * @throws DatabaseException
	 */
	public List search(MarksheetDTO dto) {
		return search(dto, 0, 0);
	}

	/**
	 * Searches Marksheets with pagination
	 * 
	 * @return list : List of Marksheets
	 * @param dto
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 * @throws DatabaseException
	 */
	public List search(MarksheetDTO dto, int pageNo, int pageSize) {
		log.debug("DAO search Started");

		System.out.println("DAO search Started");
		Criteria c = sessionFactory.getCurrentSession().createCriteria(MarksheetDTO.class);

		if (dto != null) {

			if (DataValidator.isNotNull(dto.getRollNo())) {
				c.add(Restrictions.eq("rollNo", dto.getRollNo()));
			}
			if (dto.getCandidateName() != null && dto.getCandidateName().length() > 0) {
				c.add(Restrictions.like("candidateName", dto.getCandidateName() + "%"));
			}
			c.addOrder(Order.desc("id"));

			if (pageSize > 0) {
				c.setFirstResult((pageNo - 1) * pageSize);
				c.setMaxResults(pageSize);
			}
		}
		return c.list();
	}

	public List getMeritList(int pageNo, int pageSize) {
		String hql = "from MarksheetDTO order by (physics + chemistry + maths) desc";
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery(hql);
		q.setMaxResults(5);
		return q.list();

	}

}
