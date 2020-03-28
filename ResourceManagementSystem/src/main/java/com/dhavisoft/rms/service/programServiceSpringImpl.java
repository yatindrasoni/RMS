package com.dhavisoft.rms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import com.dhavisoft.rms.dao.ProgramDAOInt;

import com.dhavisoft.rms.dto.ProgramDTO;
import com.dhavisoft.rms.exception.DuplicateRecordException;

/**
 * Session facade of Program Service. It is transactional, apply delcarative
 * transactions with help of Spring AOP.
 * 
 * If unchecked exception is propagated from a method then transaction will be
 * rolled back.
 * 
 * Default propogation value is Propagation.REQUIRED and readOnly = false
 * 
 * @author Session Facade
 * @version 1.0
 * @Copyright (c) SunilOS
 */

@Service("programService")
public class programServiceSpringImpl implements ProgramServiceInt{

	@Autowired
	private ProgramDAOInt dao;
	
	/**
	 * Adds a Program
	 * 
	 * @param dto
	 * @throws ApplicationException
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public long add(ProgramDTO dto) throws DuplicateRecordException {

		System.out.println("Program NAME" + dto.getName());
		ProgramDTO dtoExist = dao.findByName(dto.getName());
		if (dtoExist != null) {
			throw new DuplicateRecordException("Program Name Already Exists");
		}
		return dao.add(dto);
	}

	/**
	 * Updates a Program
	 * 
	 * @param dto
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when updated Course is already exists
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void update(ProgramDTO dto) throws DuplicateRecordException {
		
		ProgramDTO dtoExist = dao.findByName(dto.getName());
		// Check if updated Course is already exists
		if (dtoExist != null && dtoExist.getId() != dto.getId()) {
			throw new DuplicateRecordException("Program Name Already Exists");
		}
		dao.update(dto);
	}

	/**
	 * Deletes a Program
	 * 
	 * @param dto
	 * @throws ApplicationException
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void delete(long id) {
		dao.delete(id);
	}

	/**
	 * Finds Program by Primary Key
	 */
	@Transactional(readOnly = true)
	public ProgramDTO findByPK(long id) {
		return dao.findByPK(id);
	}

	/**
	 * Finds Program by Name
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 * @throws ApplicationException
	 */
	@Transactional(readOnly = true)
	public ProgramDTO findByName(String name) {
		return dao.findByName(name);
	}

	/**
	 * Searches Program
	 * 
	 * @return list : List of Program
	 * @param dto
	 *            : Search Parameters
	 * @throws ApplicationException
	 */
	@Transactional(readOnly = true)
	public List search(ProgramDTO dto) {
		return dao.search(dto);
	}

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
	 * @throws ApplicationException
	 */

	@Transactional(readOnly = true)
	public List search(ProgramDTO dto, int pageNo, int pageSize) {
		return dao.search(dto, pageNo, pageSize);
	}


}
