package com.dhavisoft.rms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dhavisoft.rms.dao.TrainerDAOInt;

import com.dhavisoft.rms.dto.TrainerDTO;
import com.dhavisoft.rms.exception.DuplicateRecordException;

/**
 * Session facade of Trainer Service. It is transactional, apply delcarative
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

@Service("trainerService")
public class TrainerServiceSpringImpl implements TrainerServiceInt{
	
	@Autowired
	private TrainerDAOInt dao;
	
	/**
	 * Adds a Trainer
	 * 
	 * @param dto
	 * @throws ApplicationException
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public long add(TrainerDTO dto) throws DuplicateRecordException {
		
		System.out.println("IN TRAINER SERVICE SPRING IMPL");
		System.out.println(dto.getEmail());
		
		TrainerDTO dtoExist = dao.findByEmail(dto.getEmail());
		System.out.println("Do EXISTS" + dtoExist);
		
		if (dtoExist != null) {
			throw new DuplicateRecordException("Trainer Email Already Exists");
		}
		return dao.add(dto);
	}

	/**
	 * Updates a Trainer
	 * 
	 * @param dto
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when updated Trainer is already exists
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void update(TrainerDTO dto) throws DuplicateRecordException {
		
		TrainerDTO dtoExist = dao.findByEmail(dto.getEmail());
		
		// Check if updated Student is already exists
		if (dtoExist != null && dtoExist.getId() != dto.getId()) {
			throw new DuplicateRecordException("Trainer Email Already Exists");
		}
		dao.update(dto);
	}

	/**
	 * Deletes a Trainer
	 * 
	 * @param dto
	 * @throws ApplicationException
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void delete(long id) {
		dao.delete(id);
		
	}

	public TrainerDTO findByEmail(String email) {
		return dao.findByEmail(email);
	}
	
	/**
	 * Finds Trainer by Name
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 * @throws ApplicationException
	 */
	@Transactional(readOnly = true)
	public TrainerDTO findByLogin(String login) {
		return dao.findByLogin(login);
	}

	/**
	 * Finds Trainer by Primary Key
	 */
	@Transactional(readOnly = true)
	public TrainerDTO findByPK(long id) {
	
		return dao.findByPK(id);
	}

	/**
	 * Searches Trainer
	 * 
	 * @return list : List of Trainer
	 * @param dto
	 *            : Search Parameters
	 * @throws ApplicationException
	 */
	@Transactional(readOnly = true)
	public List search(TrainerDTO dto) {
		return dao.search(dto);
	}

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
	 * @throws ApplicationException
	 */
	@Transactional(readOnly = true)
	public List search(TrainerDTO dto, int pageNo, int pageSize) {
		return dao.search(dto, pageNo, pageSize);
	}

}
