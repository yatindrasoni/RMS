package com.dhavisoft.rms.service;

import java.util.List;

import javax.mail.MessagingException;

import com.dhavisoft.rms.dto.UserDTO;
import com.dhavisoft.rms.exception.ApplicationException;
import com.dhavisoft.rms.exception.DatabaseException;
import com.dhavisoft.rms.exception.DuplicateRecordException;

/**
 * User Service interface
 * @author soni
 *@version 1.0
 *@Copyright (c) Dhavisoft
 */
public interface UserServiceInt {
	/**
	 * Adds a User
	 * 
	 * @param dto
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when User is already exists
	 */
	public long add(UserDTO dto) throws DuplicateRecordException;

	/**
	 * Updates a User
	 * 
	 * @param dto
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when updated User is already exists
	 */
	public void update(UserDTO dto) throws DuplicateRecordException;

	/**
	 * Deletes a User
	 * 
	 * @param id
	 */
	public void delete(long id);

	/**
	 * Finds User by Name
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 */
	public UserDTO findByName(String name);

	/**
	 * Finds User by primary key
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 */
	public UserDTO findByPK(long id);

	/**
	 * Searches Users
	 * 
	 * @return list : List of Users
	 * @param dto
	 *            : Search Parameters
	 */
	public List search(UserDTO dto);

	/**
	 * Searches Users with pagination
	 * 
	 * @return list : List of Users
	 * @param dto
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 */
	public List search(UserDTO dto, int pageNo, int pageSize);

	/**
	 * Change Password By pk
	 * 
	 * @param pk
	 *            ,oldPassword,newPassword : get parameter
	 * @return dto
	 * @throws ApplicationException
	 */
	public boolean changePassword(Long id, String oldPassword,
			String newPassword) throws ApplicationException;

	public UserDTO authenticate(UserDTO dto);

	public Long registerUser(UserDTO dto) throws DuplicateRecordException,
			ApplicationException;

	public Boolean forgetPassword(String login) throws DatabaseException,
			MessagingException, ApplicationException;

	public UserDTO findByLogin(String login);

}
