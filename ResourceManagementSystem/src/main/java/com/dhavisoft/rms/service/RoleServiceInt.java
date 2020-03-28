package com.dhavisoft.rms.service;

import java.util.List;

import com.dhavisoft.rms.dto.RoleDTO;
import com.dhavisoft.rms.exception.DuplicateRecordException;

/**
 * Role Service interface
 * 
 * @author soni
 *@version 1.0
 *@Copyright (c) Dhavisoft
 */
public interface RoleServiceInt {
	/**
	 * Adds a Role
	 * 
	 * @param dto
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when Role is already exists
	 */
	public long add(RoleDTO dto) throws DuplicateRecordException;

	/**
	 * Updates a Role
	 * 
	 * @param dto
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when updated Role is already exists
	 */
	public void update(RoleDTO dto) throws DuplicateRecordException;

	/**
	 * Deletes a Role
	 * 
	 * @param id
	 */
	public void delete(long id);

	/**
	 * Finds Role by Name
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 */
	public RoleDTO findByName(String name);

	/**
	 * Finds Role by primary key
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 */
	public RoleDTO findByPK(long id);

	/**
	 * Searches Roles
	 * 
	 * @return list : List of Roles
	 * @param dto
	 *            : Search Parameters
	 */
	public List search(RoleDTO dto);

	/**
	 * Searches Roles with pagination
	 * 
	 * @return list : List of Roles
	 * @param dto
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 */
	public List search(RoleDTO dto, int pageNo, int pageSize);

}
