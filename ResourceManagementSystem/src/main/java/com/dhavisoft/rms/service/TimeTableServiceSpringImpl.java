package com.dhavisoft.rms.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dhavisoft.rms.dao.TimeTableDAOInt;
import com.dhavisoft.rms.dto.TimeTableDTO;
import com.dhavisoft.rms.exception.DatabaseException;
import com.dhavisoft.rms.exception.DuplicateRecordException;

/**
 * Session facade of Time Table Service. It is transactional, apply delcarative
 * transactions with help of Spring AOP.
 * 
 * If unchecked exception is propagated from a method then transaction will be
 * rolled back.
 * 
 * Default propogation value is Propagation.REQUIRED and readOnly = false
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */

@Service("timetableService")
public class TimeTableServiceSpringImpl implements TimeTableServiceInt {

	@Autowired
	private TimeTableDAOInt dao;

	/*
	 * public void setDao(TimeTableDAOInt dao) { this.dao = dao; }
	 */

	/**
	 * Adds a Time Table
	 * 
	 * @param dto
	 * @throws ApplicationException
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public long add(TimeTableDTO dto) throws DuplicateRecordException,
			DatabaseException {

		TimeTableDTO duplicateCourse = dao.findByProgram(dto.getProgramId(), dto.getTrainerId());
		 
		System.out.println("****PROGRAM SUBJECT**** " + dto.getProgramId()+ " "+dto.getTrainerId());
		
		if (duplicateCourse != null) {
			throw new DuplicateRecordException("Session is already been scheduled for this Trainer in this program");
		}

		
		 TimeTableDTO duplicateExamDate = dao.findByTime(dto.getTrainerId(), dto.getTime());
		  
		  System.out.println("****DATE PROGRAM**** " + dto.getTrainerId() +dto.getTime());
		  
		  if (duplicateExamDate != null) { throw new
		  DatabaseException("This time is already been occupied for this program");
		  
		  }
		
		return dao.add(dto);
	}

	/**
	 * Updates a Time Table
	 * 
	 * @param dto
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when updated Faculty is already exists
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void update(TimeTableDTO dto) throws DuplicateRecordException,
			DatabaseException {

		TimeTableDTO duplicateCourse = dao.findByProgram(dto.getProgramId(), dto.getTrainerId());
		if (duplicateCourse != null) {
			throw new DuplicateRecordException("Lecture is already been scheduled for this trainer in this program");
		}
		
		TimeTableDTO duplicateExamDate = dao.findByTime(dto.getTrainerId(), dto.getTime());
		
		  System.out.println("****DATE PROGRAM**** " + dto.getTrainerId() +dto.getTime());
		  
		  if (duplicateExamDate != null) { throw new
		  DatabaseException("This time is already been occupied for this program");
		  
		  }
		dao.update(dto);
	}

	/**
	 * Deletes a Time Table
	 * 
	 * @param dto
	 * @throws ApplicationException
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void delete(long id) {
		dao.delete(id);

	}

	/**
	 * Finds Time Table by Course
	 */
	@Transactional(readOnly = true)
	public TimeTableDTO findByProgram(Long programId, Long trainerId) {
		return dao.findByProgram(programId, trainerId);
	}
	
	@Transactional(readOnly = true)
	public TimeTableDTO findByTime(Long trainerId, String time) {
		return dao.findByTime(trainerId, time);
	}

	/**
	 * Finds Time Table by Examination Date
	 */
	/*
	 * @Transactional(readOnly = true) public TimeTableDTO
	 * findByExaminationDate(Date examinationDate, Long programId) {
	 * 
	 * return dao.findByExaminationDate(examinationDate, programId); }
	 */
	/**
	 * Finds Time Table by Primary Key
	 */
	@Transactional(readOnly = true)
	public TimeTableDTO findByPK(long id) {
		return dao.findByPK(id);
	}

	/**
	 * Searches Time Table with pagination
	 * 
	 * @return list : List of Time Table
	 * @param dto
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 * @throws ApplicationException
	 */
	@Transactional(readOnly = true)
	public List search(TimeTableDTO dto, int pageNo, int pageSize) {
		return dao.search(dto, pageNo, pageSize);
	}

	/**
	 * Searches Time Table
	 * 
	 * @return list : List of Time Table
	 * @param dto
	 *            : Search Parameters
	 * @throws ApplicationException
	 */
	@Transactional(readOnly = true)
	public List search(TimeTableDTO dto) {
		return dao.search(dto);
	}

}
