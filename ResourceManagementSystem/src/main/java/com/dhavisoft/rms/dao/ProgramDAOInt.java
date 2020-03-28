package com.dhavisoft.rms.dao;

import java.util.List;

import com.dhavisoft.rms.dto.CourseDTO;
import com.dhavisoft.rms.dto.ProgramDTO;

/**
 * Program DAO interface.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public interface ProgramDAOInt {

	/**
	 * Adds a Program
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public long add(ProgramDTO dto);

	/**
	 * Updates a Program
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public void update(ProgramDTO dto);

	/**
	 * Deletes a Program
	 * 
	 * @param id
	 * @throws DatabaseException
	 */
	public void delete(long id);

	/**
	 * Finds Program by Name
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public ProgramDTO findByName(String name);

	/**
	 * Finds Program by PK
	 * 
	 * @param pk
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public ProgramDTO findByPK(long pk);

	/**
	 * Searches Program
	 * 
	 * @return list : List of Roles
	 * @param dto
	 *            : Search Parameters
	 * @throws DatabaseException
	 */
	public List search(ProgramDTO dto);

	/**
	 * Searches Program with pagination
	 * 
	 * @return list : List of Roles
	 * @param dto
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 * @throws DatabaseException
	 */
	public List search(ProgramDTO dto, int pageNo, int pageSize);

}
