package com.dhavisoft.rms.dao;

import java.util.List;

import com.dhavisoft.rms.dto.CollegeDTO;

/**
 * College DAO interface.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public interface CollegeDAOInt {

	/**
	 * Adds a College
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public long add(CollegeDTO dto);

	/**
	 * Updates a College 
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public void update(CollegeDTO dto);

	/**
	 * Deletes a College
	 * 
	 * @param id
	 * @throws DatabaseException
	 */
	public void delete(long id);

	/**
	 * Finds College by Name
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public CollegeDTO findByName(String name);

	/**
	 * Finds College by PK
	 * 
	 * @param pk
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public CollegeDTO findByPK(long pk);

	/**
	 * Searches Colleges
	 * 
	 * @return list : List of Colleges
	 * @param dto
	 *            : Search Parameters
	 * @throws DatabaseException
	 */
	public List search(CollegeDTO dto);

	/**
	 * Searches Colleges with pagination
	 * 
	 * @return list : List of Colleges
	 * @param dto
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 * @throws DatabaseException
	 */
	public List search(CollegeDTO dto, int pageNo, int pageSize);
	
}
