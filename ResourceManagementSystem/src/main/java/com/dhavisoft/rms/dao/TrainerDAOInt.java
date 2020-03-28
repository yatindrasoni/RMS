package com.dhavisoft.rms.dao;

import java.util.List;

import com.dhavisoft.rms.dto.TrainerDTO;

/**
 * Trainer DAO interface
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public interface TrainerDAOInt {

	/**
	 * Adds a Trainer
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public long add(TrainerDTO dto);

	/**
	 * Updates a Trainer
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public void update(TrainerDTO dto);

	/**
	 * Deletes a Trainer
	 * 
	 * @param id
	 * @throws DatabaseException
	 */
	public void delete(long id);

	/**
	 * Finds Trainer by Name
	 * 
	 * @param login
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public TrainerDTO findByLogin(String login);
	
	public TrainerDTO findByEmail(String email); 

	/**
	 * Finds Trainer by PK
	 * 
	 * @param pk
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public TrainerDTO findByPK(long pk);

	/**
	 * Searches Trainer
	 * 
	 * @return list : List of Trainer
	 * @param dto
	 *            : Search Parameters
	 * @throws DatabaseException
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
	 * @throws DatabaseException
	 */
	public List search(TrainerDTO dto, int pageNo, int pageSize);

}
