package com.dhavisoft.rms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dhavisoft.rms.dao.CandidateDAOInt;
import com.dhavisoft.rms.dto.CandidateDTO;

import com.dhavisoft.rms.exception.DuplicateRecordException;

/**
 * Session facade of Candidate Service. It is transactional, apply delcarative
 * transactions with help of Spring AOP.
 * 
 * If unchecked exception is propagated from a method then transaction will be
 * rolled back.
 * 
 * Default propogation value is Propagation.REQUIRED and readOnly = false
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
@Service("candidateService")
public class CandidateServiceSpringImpl implements CandidateServiceInt{
	
	@Autowired
	private CandidateDAOInt dao;
	
	/**
	 * Adds a Candidate
	 * 
	 * @param dto
	 * @throws ApplicationException
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public long add(CandidateDTO dto) throws DuplicateRecordException {

		CandidateDTO dtoExist = dao.findByLogin(dto.getEmail());
		if (dtoExist != null) {
			throw new DuplicateRecordException("Candidate Name");
		}
		return dao.add(dto);
	}

	/**
	 * Updates a Candidate
	 * 
	 * @param dto
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when updated Candidate is already exists
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void update(CandidateDTO dto) throws DuplicateRecordException {
		CandidateDTO dtoExist = dao.findByLogin(dto.getEmail());
		// Check if updated Student is already exists
		if (dtoExist != null && dtoExist.getId() != dto.getId()) {
			throw new DuplicateRecordException("Duplicate Name");
		}
		dao.update(dto);
	}

	/**
	 * Deletes a Candidate
	 * 
	 * @param dto
	 * @throws ApplicationException
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void delete(long id) {
		dao.delete(id);
	}

	/**
	 * Finds record by Primary Key
	 */
	@Transactional(readOnly = true)
	public CandidateDTO findByPK(long id) {
		return dao.findByPK(id);
	}

	/**
	 * Finds Candidate by Name
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 * @throws ApplicationException
	 */
	@Transactional(readOnly = true)
	public CandidateDTO findByLogin(String login) {
		return dao.findByLogin(login);
	}

	/**
	 * Searches Candidate
	 * 
	 * @return list : List of Candidate
	 * @param dto
	 *            : Search Parameters
	 * @throws ApplicationException
	 */
	@Transactional(readOnly = true)
	public List search(CandidateDTO dto) {
		return dao.search(dto);
	}

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
	 * @throws ApplicationException
	 */
	@Transactional(readOnly = true)
	public List search(CandidateDTO dto, int pageNo, int pageSize) {
		return dao.search(dto, pageNo, pageSize);
	}


}
