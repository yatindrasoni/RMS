package com.dhavisoft.rms.service;

import java.util.List;

import com.dhavisoft.rms.dto.AssignProgramsDTO;
import com.dhavisoft.rms.dto.TimeTableDTO;
import com.dhavisoft.rms.exception.DatabaseException;
import com.dhavisoft.rms.exception.DuplicateRecordException;

/**
 * AssignPrograms Service interface.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public interface AssignProgramsServiceInt {

	/**
	 * Adds a AssignPrograms
	 * 
	 * @param dto
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when Student is already exists
	 */
	public long add(AssignProgramsDTO dto) throws DuplicateRecordException, DatabaseException;

	/**
	 * Updates a AssignPrograms
	 * 
	 * @param dto
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when updated AssignPrograms is already exists
	 */
	public void update(AssignProgramsDTO dto) throws DuplicateRecordException, DatabaseException;

	/**
	 * Deletes a AssignPrograms
	 * 
	 * @param id
	 */
	public void delete(long id);

	/**
	 * Finds AssignPrograms by Name
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 */
	public AssignProgramsDTO findByLogin(String login);

	/**
	 * Finds AssignPrograms by primary key
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 */
	public AssignProgramsDTO findByPK(long id);
	
	/**
	 * Find AssignProgramsDTO by Course,Subject
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 * @throws ApplicationException
	 */
	public AssignProgramsDTO findByProgram(Long programId, String firstName);


	/**
	 * Searches AssignPrograms
	 * 
	 * @return list : List of AssignPrograms
	 * @param dto
	 *            : Search Parameters
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
	 */
	public List search(AssignProgramsDTO dto, int pageNo, int pageSize);

}
