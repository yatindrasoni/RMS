package com.dhavisoft.rms.dao;

import java.util.List;

import com.dhavisoft.rms.dto.FacultyDTO;

/**
 * Faculty DAO interface
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */

public interface FacultyDAOInt {
	
	/**
	 * Adds a Faculty
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public long add(FacultyDTO dto);

	/**
	 * Updates a Faculty
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public void update(FacultyDTO dto);

	/**
	 * Deletes a Faculty
	 * 
	 * @param id
	 * @throws DatabaseException
	 */
	public void delete(long id);

	/**
	 * Finds Faculty by Name
	 * 
	 * @param login
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public FacultyDTO findByLogin(String login);

	/**
	 * Finds Faculty by PK
	 * 
	 * @param pk
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public FacultyDTO findByPK(long pk);

	/**
	 * Searches Faculty
	 * 
	 * @return list : List of Faculty
	 * @param dto
	 *            : Search Parameters
	 * @throws DatabaseException
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
	 * @throws DatabaseException
	 */
	public List search(FacultyDTO dto, int pageNo, int pageSize);

}
