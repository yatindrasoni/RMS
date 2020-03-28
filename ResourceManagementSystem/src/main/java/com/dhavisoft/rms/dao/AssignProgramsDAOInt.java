package com.dhavisoft.rms.dao;

import java.util.List;

import com.dhavisoft.rms.dto.AssignProgramsDTO;
import com.dhavisoft.rms.dto.TimeTableDTO;



/**
 * AssignPrograms DAO interface.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public interface AssignProgramsDAOInt {

	/**
	 * Adds a AssignPrograms
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public long add(AssignProgramsDTO dto);

	/**
	 * Updates a AssignPrograms
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public void update(AssignProgramsDTO dto);

	/**
	 * Deletes a AssignPrograms
	 * 
	 * @param id
	 * @throws DatabaseException
	 */
	public void delete(long id);

	/**
	 * Finds AssignPrograms by Name
	 * 
	 * @param login
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public AssignProgramsDTO findByLogin(String login);

	/**
	 * Finds AssignPrograms by PK
	 * 
	 * @param pk
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public AssignProgramsDTO findByPK(long pk);
	
	/**
	 * Find AssignPrograms by Course
	 */
	public AssignProgramsDTO findByProgram(long programId, String firstName);

	/**
	 * Searches AssignPrograms
	 * 
	 * @return list : List of AssignPrograms
	 * @param dto
	 *            : Search Parameters
	 * @throws DatabaseException
	 */
	public List search(AssignProgramsDTO dto);

	/**
	 * Searches AssignPrograms with pagination
	 * 
	 * @return list : List of AssignPrograms
	 * @param dto
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 * @throws DatabaseException
	 */
	public List search(AssignProgramsDTO dto, int pageNo, int pageSize);

}
