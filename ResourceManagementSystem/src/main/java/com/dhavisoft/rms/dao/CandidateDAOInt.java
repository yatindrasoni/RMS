package com.dhavisoft.rms.dao;

import java.util.List;

import com.dhavisoft.rms.dto.CandidateDTO;


/**
 * Candidate DAO interface.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public interface CandidateDAOInt {

	/**
	 * Adds a Candidate
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public long add(CandidateDTO dto);

	/**
	 * Updates a Candidate
	 * 
	 * @param dto
	 * @throws DatabaseException
	 */
	public void update(CandidateDTO dto);

	/**
	 * Deletes a Candidate
	 * 
	 * @param id
	 * @throws DatabaseException
	 */
	public void delete(long id);

	/**
	 * Finds Candidate by Name
	 * 
	 * @param login
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public CandidateDTO findByLogin(String login);

	/**
	 * Finds Candidate by PK
	 * 
	 * @param pk
	 *            : get parameter
	 * @return dto
	 * @throws DatabaseException
	 */
	public CandidateDTO findByPK(long pk);

	/**
	 * Searches Candidate
	 * 
	 * @return list : List of Students
	 * @param dto
	 *            : Search Parameters
	 * @throws DatabaseException
	 */
	public List search(CandidateDTO dto);

	/**
	 * Searches Candidate with pagination
	 * 
	 * @return list : List of Students
	 * @param dto
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 * @throws DatabaseException
	 */
	public List search(CandidateDTO dto, int pageNo, int pageSize);

}
