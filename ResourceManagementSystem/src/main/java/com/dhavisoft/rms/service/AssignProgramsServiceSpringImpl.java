package com.dhavisoft.rms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dhavisoft.rms.dao.AssignProgramsDAOInt;

import com.dhavisoft.rms.dto.AssignProgramsDTO;

import com.dhavisoft.rms.exception.DatabaseException;
import com.dhavisoft.rms.exception.DuplicateRecordException;

/**
 * Session facade of Student Service. It is transactional, apply delcarative
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
@Service("AssignProgramsService")
public class AssignProgramsServiceSpringImpl implements AssignProgramsServiceInt{

	@Autowired
	private AssignProgramsDAOInt dao;

	/**
	 * Adds a AssignPrograms
	 * 
	 * @param dto
	 * @throws ApplicationException
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public long add(AssignProgramsDTO dto) throws DuplicateRecordException,DatabaseException {

		AssignProgramsDTO duplicateCourse = dao.findByProgram(dto.getProgramId(), dto.getFirstName());
		
		System.out.println("****PROGRAM SUBJECT**** " + dto.getProgramId() + dto.getFirstName());
		
		if (duplicateCourse != null ) {
			throw new DuplicateRecordException("Exam is already been scheduled for this subject in this course");
		}
		return dao.add(dto);
	}
	
	/**
	 * Updates a AssignPrograms
	 * 
	 * @param dto
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when updated Student is already exists
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void update(AssignProgramsDTO dto) throws DuplicateRecordException,DatabaseException {
		
		AssignProgramsDTO duplicateCourse = dao.findByProgram(dto.getProgramId(), dto.getFirstName());
		if (duplicateCourse != null) {
			throw new DuplicateRecordException("Exam is already been scheduled for this subject in this course");
		}
		dao.update(dto);
	}

	/**
	 * Deletes a AssignPrograms
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
	public AssignProgramsDTO findByPK(long id) {
		return dao.findByPK(id);
	}

	/**
	 * Finds AssignPrograms by Name
	 * 
	 * @param name
	 *            : get parameter
	 * @return dto
	 * @throws ApplicationException
	 */
	@Transactional(readOnly = true)
	public AssignProgramsDTO findByLogin(String login) {
		return dao.findByLogin(login);
	}
	
	@Transactional(readOnly = true)
	public AssignProgramsDTO findByProgram(Long programId, String firstName) {
		return dao.findByProgram(programId, firstName);
	}


	/**
	 * Searches AssignPrograms
	 * 
	 * @return list : List of AssignPrograms
	 * @param dto
	 *            : Search Parameters
	 * @throws ApplicationException
	 */
	@Transactional(readOnly = true)
	public List search(AssignProgramsDTO dto) {
		return dao.search(dto);
	}

	/**
	 * Searches AssignPrograms with pagination
	 * 
	 * @return list : List of AssignPrograms
	 * @param dto
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 * @throws ApplicationException
	 */
	@Transactional(readOnly = true)
	public List search(AssignProgramsDTO dto, int pageNo, int pageSize) {
		return dao.search(dto, pageNo, pageSize);
	}


}
