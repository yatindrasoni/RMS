package com.dhavisoft.rms.service;

import java.util.Date;
import java.util.List;

import com.dhavisoft.rms.dto.TimeTableDTO;
import com.dhavisoft.rms.exception.DatabaseException;
import com.dhavisoft.rms.exception.DuplicateRecordException;

/**
 * Time Table Service interface.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */

public interface TimeTableServiceInt {
	
	/**
	 * Adds a Timetable
	 * 
	 * @param dto
	 * @return
	 * @throws DatabaseException
	 * @throws DuplicateRecordException
	 */
	public long add(TimeTableDTO dto) throws DuplicateRecordException, DatabaseException;

	/**
	 * Update a Time Table
	 * 
	 * @param dto
	 * @throws DatabaseException
	 * @throws DuplicateRecordException
	 *             : if updated user record is already exist
	 */
	public void update(TimeTableDTO dto) throws DuplicateRecordException, DatabaseException;

	/**
	 * Delete a Time Table
	 * 
	 * @param dto
	 * @throws ApplicationException
	 */
	public void delete(long id);

	/**
	 * Find Time Table by Course,Subject
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 * @throws ApplicationException
	 */
	public TimeTableDTO findByProgram(Long programId, Long trainerId);
	
	public TimeTableDTO findByTime(Long trainerId, String time);

	/**
	 * Find Time Table by Examination Date,Course
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 * @throws ApplicationException
	 */
	/*
	 * public TimeTableDTO findByExaminationDate(Date examinationDate, Long
	 * programId);
	 */
	
	/**
	 * Find Time Table by PK
	 * 
	 * @param pk
	 *            : get parameter
	 * @return dto
	 * @throws ApplicationException
	 */
	public TimeTableDTO findByPK(long id);

	/**
	 * Search Role with pagination
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
	public List search(TimeTableDTO dto, int pageNo, int pageSize);

	/**
	 * Search Time Table
	 * 
	 * @return list : List of Time Table
	 * @param dto
	 *            : Search Parameters
	 * @throws ApplicationException
	 */
	public List search(TimeTableDTO dto);


}
