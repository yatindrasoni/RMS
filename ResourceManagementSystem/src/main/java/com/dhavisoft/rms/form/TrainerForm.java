package com.dhavisoft.rms.form;


import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import com.dhavisoft.rms.dto.BaseDTO;
import com.dhavisoft.rms.dto.FacultyDTO;
import com.dhavisoft.rms.dto.TrainerDTO;
import com.dhavisoft.rms.util.Util;

/**
 * Contains Trainer form elements and their declarative input validations.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public class TrainerForm extends BaseForm{

	
	/**
	 * First Name of Trainer
	 */
	private String firstName;
	
	/**
	 * Last Name of Trainer
	 */
	private String lastName;
	
	/**
	 * Date of Birth of Trainer
	 */
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@NotNull
	private Date dob;
	
	/**
	 * Email of Trainer
	 */
	private String email;
	
	/**
	 * MobileNo of Trainer
	 */
	private String mobileNo;
	
	/**
	 * Address of Trainer
	 */
	@NotEmpty 
	private String address;
	 
	/**
	 * ProgramId of Trainer
	 */
	@NotNull
	private Long programId = 0L;
	
	/**
	 * Program Name of Trainer
	 */
	private String programName;

	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Long getProgramId() {
		return programId;
	}

	public void setProgramId(Long programId) {
		this.programId = programId;
	}

	public String getProgramName() {
		return programName;
	}

	public void setProgramName(String programName) {
		this.programName = programName;
	}
	
	@Override
	public BaseDTO getDto() {
		TrainerDTO dto = new TrainerDTO();
		
		dto.setId(id);
		if (programId != null) {
			dto.setProgramId(programId);
		}
		dto.setProgramName(programName);
		dto.setFirstName(Util.getCapital(firstName));
		dto.setLastName(Util.getCapital(lastName));
		dto.setMobileNo(mobileNo);
		dto.setEmail(email);
		dto.setDob(dob);
		dto.setAddress(address);
		System.out.println("inside facutly form get dto method");
		return dto;
	}

	@Override
	public void populate(BaseDTO bDto1) {
		TrainerDTO bDto = (TrainerDTO) bDto1;
		
		id = bDto.getId();
		programId = bDto.getProgramId();
		programName = bDto.getProgramName();
		firstName = Util.getCapital(bDto.getFirstName());
		lastName = Util.getCapital(bDto.getLastName());
		mobileNo = bDto.getMobileNo();
		email = bDto.getEmail();
		dob = bDto.getDob();
		address = bDto.getAddress(); 
		
	}

}
