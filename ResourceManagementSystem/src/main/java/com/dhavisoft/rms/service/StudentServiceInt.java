package com.dhavisoft.rms.service;

import java.util.List;

import com.dhavisoft.rms.dto.StudentDTO;
import com.dhavisoft.rms.exception.DuplicateRecordException;

/**
 * Student Service interface.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public interface StudentServiceInt {
	
	/**
	 * Adds a Student
	 * 
	 * @param dto
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when Student is already exists
	 */
	public long add(StudentDTO dto) throws DuplicateRecordException;

	/**
	 * Updates a Student
	 * 
	 * @param dto
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when updated Student is already exists
	 */
	public void update(StudentDTO dto) throws DuplicateRecordException;

	/**
	 * Deletes a Student
	 * 
	 * @param id
	 */
	public void delete(long id);

	/**
	 * Finds Student by Name
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 */
	public StudentDTO findByLogin(String login);

	/**
	 * Finds Student by primary key
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 */
	public StudentDTO findByPK(long id);

	/**
	 * Searches Students
	 * 
	 * @return list : List of Students
	 * @param dto
	 *            : Search Parameters
	 */
	public List search(StudentDTO dto);

	/**
	 * Searches Students with pagination
	 * 
	 * @return list : List of Students
	 * @param dto
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 */
	public List search(StudentDTO dto, int pageNo, int pageSize);

}
