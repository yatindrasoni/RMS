package com.dhavisoft.rms.dao;

import java.util.Date;
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

import com.dhavisoft.rms.dto.TimeTableDTO;
import com.dhavisoft.rms.service.CourseServiceInt;
import com.dhavisoft.rms.service.ProgramServiceInt;
import com.dhavisoft.rms.service.TrainerServiceInt;

/**
 * Hibernate implementation of Time Table DAO.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */

@Repository("timetableDAO")
public class TimeTableDAOHibImpl implements TimeTableDAOInt {

	private static Logger log = Logger.getLogger(TimeTableDAOHibImpl.class);

	@Autowired
	ProgramServiceInt programService;
	
	@Autowired
	TrainerServiceInt trainerService;

	@Autowired
	SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public long add(TimeTableDTO dto) {
		log.debug("DAO add Started");
		System.out.println("COURSE NAME IN ADD TIME TABLE DAO "+ dto.getProgramName());

		dto.setProgramName(programService.findByPK(dto.getProgramId()).getName());
		System.out.println("COURSE NAME IN ADD TIME TABLE DAO " + dto.getProgramName());
		
		String trainerName = trainerService.findByPK(dto.getTrainerId()).getFirstName()+" "
				             +trainerService.findByPK(dto.getTrainerId()).getLastName();
		
		dto.setTrainerName(trainerName);

		/*
		 * Session session = sessionFactory.getCurrentSession(); session.save(dto);
		 */
		return (Long) sessionFactory.getCurrentSession().save(dto);
		/*
		 * long pk = (Long) sessionFactory.getCurrentSession().save(dto); return
		 * pk;
		 */
	}

	public void update(TimeTableDTO dto) {
		log.debug("DAO update Started");
		System.out.println("COURSE NAME IN ADD TIME TABLE DAO "+ dto.getProgramName());

		dto.setProgramName(programService.findByPK(dto.getProgramId()).getName());

		System.out.println("COURSE NAME IN ADD TIME TABLE DAO "+ dto.getProgramName());
		
		String trainerName = trainerService.findByPK(dto.getTrainerId()).getFirstName()+" "
	                         +trainerService.findByPK(dto.getTrainerId()).getLastName();
        dto.setTrainerName(trainerName);

		 sessionFactory.getCurrentSession().update(dto); 
		 
		/*
		 * Session session = sessionFactory.getCurrentSession(); session.update(dto);
		 */
		 
	}

	public void delete(long id) {
		log.debug("DAO delete Started");
		/*
		 * TimeTableDTO dto = new TimeTableDTO(); dto.setId(id);
		 * sessionFactory.getCurrentSession().delete(dto);
		 */

		TimeTableDTO dto = new TimeTableDTO();
		dto = findByPK(id);
		Session session = sessionFactory.getCurrentSession();
		session.delete(dto);

	}

	public TimeTableDTO findByProgram(Long programId, Long trainerId) {
		log.debug("Model findByProgram Started");

		TimeTableDTO dto = null;
		Session session = null;

		try {
			session = sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(TimeTableDTO.class);

			criteria.add(Restrictions.eq("programId", programId));
			criteria.add(Restrictions.eq("trainerId", trainerId)); 

			List list = criteria.list();

			if (list.size() == 1) {
				dto = (TimeTableDTO) list.get(0);
			}
		} catch (HibernateException e) {
			e.printStackTrace();

		} finally {
			System.out.println("FIND BY PROGRAM FINALLY");
		}

		return dto;
	}
	
	public TimeTableDTO findByTime(Long trainerId, String time) {
		log.debug("Model findByProgram Started");

		TimeTableDTO dto = null;
		Session session = null;

		try {
			session = sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(TimeTableDTO.class);

			criteria.add(Restrictions.eq("trainerId", trainerId));
			criteria.add(Restrictions.eq("time", time)); 

			List list = criteria.list();

			if (list.size() == 1) {
				dto = (TimeTableDTO) list.get(0);
			}
		} catch (HibernateException e) {
			e.printStackTrace();

		} finally {
			System.out.println("FIND BY TIME FINALLY");
		}

		return dto;
	}

	/*
	 * public TimeTableDTO findByExaminationDate(Date examinationDate,Long
	 * programId) { log.debug("Model findByExaminatinDate Started"); TimeTableDTO
	 * dto = null; Session session = null; try { session =
	 * sessionFactory.getCurrentSession(); Criteria criteria =
	 * session.createCriteria(TimeTableDTO.class);
	 * criteria.add(Restrictions.eq("examinationDate", examinationDate));
	 * criteria.add(Restrictions.eq("programId", programId));
	 * 
	 * List list = criteria.list();
	 * 
	 * if (list.size() == 1) { dto = (TimeTableDTO) list.get(0);
	 * 
	 * } } catch (HibernateException e) { e.printStackTrace(); } finally {
	 * System.out.println("FIND BY PROGRAM FINALLY"); }
	 * log.debug("Model findByExaminationDate End"); return dto; }
	 */
	
	public TimeTableDTO findByPK(long pk) {
		Session session = sessionFactory.getCurrentSession();
		TimeTableDTO dto = (TimeTableDTO) session.get(TimeTableDTO.class, pk);
		/* session.evict(dto); */
		return dto;
	}

	public List search(TimeTableDTO dto) {
		return search(dto, 0, 0);
	}

	public List search(TimeTableDTO dto, int pageNo, int pageSize) {
		log.debug("DAO search Started");

		Criteria c = sessionFactory.getCurrentSession().createCriteria(
				TimeTableDTO.class);

		/*
		 * if (dto.getId() > 0) { c.add(Restrictions.eq("id", dto.getId())); }
		 */
		if (dto.getProgramName() != null && dto.getProgramName().length() > 0) {
			c.add(Restrictions.like("programName", dto.getProgramName() + "%"));
		}
		if (dto.getProgramId() > 0) {
			c.add(Restrictions.eq("programId", dto.getProgramId()));
		}
		if (dto.getTrainerName() != null && dto.getTrainerName().length() > 0) {
			c.add(Restrictions.like("trainerName", dto.getTrainerName() + "%"));
		}
		
		/*
		 * if (dto.getExaminationDate() != null) {
		 * c.add(Restrictions.eq("examinationDate", dto.getExaminationDate())); }
		 */
		c.addOrder(Order.desc("id"));

		// if page size is greater than zero the apply pagination
		if (pageSize > 0) {
			c.setFirstResult(((pageNo - 1) * pageSize));
			c.setMaxResults(pageSize);
		}

		return c.list();
	}

	

}