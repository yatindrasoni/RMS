package com.dhavisoft.rms.service;

import java.util.List;

import com.dhavisoft.rms.dto.CourseDTO;
import com.dhavisoft.rms.dto.ProgramDTO;
import com.dhavisoft.rms.exception.DuplicateRecordException;

/**
 * Program Service interface.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public interface ProgramServiceInt {

	/**
	 * Adds a Program
	 * 
	 * @param dto
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when Role is already exists
	 */
	public long add(ProgramDTO dto) throws DuplicateRecordException;

	/**
	 * Updates a Program
	 * 
	 * @param dto
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when updated Role is already exists
	 */
	public void update(ProgramDTO dto) throws DuplicateRecordException;

	/**
	 * Deletes a Program
	 * 
	 * @param id
	 */
	public void delete(long id);

	/**
	 * Finds Program by Name
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 */
	public ProgramDTO findByName(String name);

	/**
	 * Finds Program by primary key
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 */
	public ProgramDTO findByPK(long id);

	/**
	 * Searches Program
	 * 
	 * @return list : List of Program
	 * @param dto
	 *            : Search Parameters
	 */
	public List search(ProgramDTO dto);

	/**
	 * Searches Program with pagination
	 * 
	 * @return list : List of Program
	 * @param dto
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 */
	public List search(ProgramDTO dto, int pageNo, int pageSize);

}
