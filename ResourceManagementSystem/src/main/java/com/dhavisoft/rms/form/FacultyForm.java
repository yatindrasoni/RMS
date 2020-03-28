package com.dhavisoft.rms.form;

import java.sql.Timestamp;
import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import com.dhavisoft.rms.dto.BaseDTO;
import com.dhavisoft.rms.dto.FacultyDTO;
import com.dhavisoft.rms.util.Util;

/**
 * Contains Faculty form elements and their declarative input validations.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public class FacultyForm extends BaseForm {

	/**
	 * First Name of Faculty
	 */
	private String firstName;
	
	/**
	 * Last Name of Faculty
	 */
	private String lastName;
	
	/**
	 * Date of Birth of Faculty
	 */
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@NotNull
	private Date dob;
	
	/**
	 * Qualification of Faculty
	 */
	/*
	 * @NotEmpty private String qualification;
	 */
	/**
	 * Email of Faculty
	 */
	private String email;
	
	/**
	 * MobileNo of Faculty
	 */
	private String mobileNo;
	
	/**
	 * Address of Faculty
	 */
	/*
	 * @NotEmpty private String address;
	 */
	/**
	 * Primary Subject of Faculty
	 */
	@NotEmpty
	private String primarySubject;
	
	/**
	 * Secondary Subject of Faculty
	 */
	@NotEmpty
	private String secondarySubject;
	
	/**
	 * CourseId of Faculty
	 */
	@NotNull
	private Long programId = 0L;
	
	/**
	 * Course Name of Faculty
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

	/*
	 * public String getAddress() { return address; }
	 * 
	 * public void setAddress(String address) { this.address = address; }
	 */

	public String getPrimarySubject() {
		return primarySubject;
	}

	public void setPrimarySubject(String primarySubject) {
		this.primarySubject = primarySubject;
	}

	public String getSecondarySubject() {
		return secondarySubject;
	}

	public void setSecondarySubject(String secondarySubject) {
		this.secondarySubject = secondarySubject;
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
		FacultyDTO dto = new FacultyDTO();
		dto.setId(id);
		
		if (programId != null) {
			dto.setProgramId(programId);
		}
		dto.setProgramName(programName);
		dto.setFirstName(Util.getCapital(firstName));
		dto.setLastName(Util.getCapital(lastName));

		dto.setPrimarySubject(primarySubject);
		dto.setSecondarySubject(secondarySubject);
		dto.setMobileNo(mobileNo);
		dto.setEmail(email);
		/* dto.setQualification(qualification); */
		dto.setDob(dob);
		dto.setCreatedBy(createdBy);
		dto.setModifiedBy(modifiedBy);
		dto.setCreatedDatetime(new Timestamp(new Date().getTime()));
		dto.setModifiedDatetime(new Timestamp(new Date().getTime()));
		System.out.println("inside facutly form get dto method");
		return dto;
	}

	@Override
	public void populate(BaseDTO bDto1) {
		FacultyDTO bDto = (FacultyDTO) bDto1;
		id = bDto.getId();
		
		programId = bDto.getProgramId();
		programName = bDto.getProgramName();
		firstName = Util.getCapital(bDto.getFirstName());
		lastName = Util.getCapital(bDto.getLastName());
		primarySubject = bDto.getPrimarySubject();
		secondarySubject = bDto.getSecondarySubject();
		mobileNo = bDto.getMobileNo();
		email = bDto.getEmail();
		/* qualification = bDto.getQualification(); */
		dob = bDto.getDob();

		/* address = bDto.getAddress(); */
		createdBy = bDto.getCreatedBy();
		modifiedBy = bDto.getModifiedBy();
		if (bDto.getCreatedDatetime() != null) {
			createdDatetime = bDto.getCreatedDatetime().getTime();
		}
		if (bDto.getModifiedDatetime() != null) {
			modifiedDatetime = bDto.getModifiedDatetime().getTime();
		}
	}

}
