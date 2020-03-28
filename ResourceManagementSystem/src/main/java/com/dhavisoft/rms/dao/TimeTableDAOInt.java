package com.dhavisoft.rms.dao;

import java.util.Date;
import java.util.List;

import com.dhavisoft.rms.dto.TimeTableDTO;

/**
 * Time Table DAO interface.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */

public interface TimeTableDAOInt {

	/**
	 * Add a Time Table
	 */
	public long add(TimeTableDTO dto);

	/**
	 * Update a Time Table
	 */
	public void update(TimeTableDTO dto);

	/**
	 * Delete a Time Table
	 */
	public void delete(long id);

	/**
	 * Find Time Table by Course,Subject
	 */
	public TimeTableDTO findByProgram(Long programId, Long trainerId);

	
	public TimeTableDTO findByTime(Long trainerId, String time);
	
	/**
	 * Find Time Table by Examination Date,Course
	 */
	/*
	 * public TimeTableDTO findByExaminationDate(Date examinationDate, Long
	 * programId);
	 */

	/**
	 * Find Time Table by PK
	 */
	public TimeTableDTO findByPK(long pk);

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
