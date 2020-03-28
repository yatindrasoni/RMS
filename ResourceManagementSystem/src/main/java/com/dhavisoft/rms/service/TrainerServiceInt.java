package com.dhavisoft.rms.service;

import java.util.List;


import com.dhavisoft.rms.dto.TrainerDTO;
import com.dhavisoft.rms.exception.DuplicateRecordException;

/**
 * Trainer Service interface
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public interface TrainerServiceInt {

	/**
	 * Adds a Trainer
	 * 
	 * @param dto
	 * @throws DuplicateRecordException
	 *             : throws when faculty is already exists
	 */
	public long add(TrainerDTO dto) throws DuplicateRecordException;

	/**
	 * Updates a Trainer
	 * 
	 * @param dto
	 * @throws DuplicateRecordException
	 *             : throws when updated Faculty is already exists
	 */
	public void update(TrainerDTO dto) throws DuplicateRecordException;

	/**
	 * Deletes a Trainer
	 * 
	 * @param id
	 */
	public void delete(long id);

	/**
	 * Finds Trainer by Name
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 */
	public TrainerDTO findByLogin(String login);
	
	public TrainerDTO findByEmail(String email);

	/**
	 * Finds Trainer by primary key
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 */
	public TrainerDTO findByPK(long id);

	/**
	 * Searches Trainer
	 * 
	 * @return list : List of Trainer
	 * @param dto
	 *            : Search Parameters
	 */
	public List search(TrainerDTO dto);

	/**
	 * Searches Trainer with pagination
	 * 
	 * @return list : List of Trainer
	 * @param dto
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 */
	public List search(TrainerDTO dto, int pageNo, int pageSize);

}
