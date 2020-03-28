package com.dhavisoft.rms.service;

import java.util.List;

import com.dhavisoft.rms.dto.CandidateDTO;
import com.dhavisoft.rms.dto.StudentDTO;
import com.dhavisoft.rms.exception.DuplicateRecordException;

/**
 * Candidate Service interface.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public interface CandidateServiceInt {

	/**
	 * Adds a Candidate
	 * 
	 * @param dto
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when Candidate is already exists
	 */
	public long add(CandidateDTO dto) throws DuplicateRecordException;

	/**
	 * Updates a Candidate
	 * 
	 * @param dto
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when updated Candidate is already exists
	 */
	public void update(CandidateDTO dto) throws DuplicateRecordException;

	/**
	 * Deletes a Candidate
	 * 
	 * @param id
	 */
	public void delete(long id);

	/**
	 * Finds Candidate by Name
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 */
	public CandidateDTO findByLogin(String login);

	/**
	 * Finds Candidate by primary key
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 */
	public CandidateDTO findByPK(long id);

	/**
	 * Searches Candidate
	 * 
	 * @return list : List of Candidate
	 * @param dto
	 *            : Search Parameters
	 */
	public List search(CandidateDTO dto);

	/**
	 * Searches Candidate with pagination
	 * 
	 * @return list : List of Candidate
	 * @param dto
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 */
	public List search(CandidateDTO  dto, int pageNo, int pageSize);

}
