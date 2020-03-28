package com.dhavisoft.rms.service;

import java.util.List;

import com.dhavisoft.rms.dto.FacultyDTO;
import com.dhavisoft.rms.exception.DuplicateRecordException;

/**
 * Faculty Service interface
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public interface FacultyServiceInt {

	/**
	 * Adds a Faculty
	 * 
	 * @param dto
	 * @throws DuplicateRecordException
	 *             : throws when faculty is already exists
	 */
	public long add(FacultyDTO dto) throws DuplicateRecordException;

	/**
	 * Updates a Faculty
	 * 
	 * @param dto
	 * @throws DuplicateRecordException
	 *             : throws when updated Faculty is already exists
	 */
	public void update(FacultyDTO dto) throws DuplicateRecordException;

	/**
	 * Deletes a Faculty
	 * 
	 * @param id
	 */
	public void delete(long id);

	/**
	 * Finds Faculty by Name
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 */
	public FacultyDTO findByLogin(String login);

	/**
	 * Finds Faculty by primary key
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 */
	public FacultyDTO findByPK(long id);

	/**
	 * Searches Faculty
	 * 
	 * @return list : List of Faculty
	 * @param dto
	 *            : Search Parameters
	 */
	public List search(FacultyDTO dto);

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
	 */
	public List search(FacultyDTO dto, int pageNo, int pageSize);

}
