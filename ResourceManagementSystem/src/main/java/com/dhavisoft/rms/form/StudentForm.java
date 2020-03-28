package com.dhavisoft.rms.form;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import com.dhavisoft.rms.dto.BaseDTO;
import com.dhavisoft.rms.dto.StudentDTO;
import com.dhavisoft.rms.util.Util;

/**
 * Contains Student form elements and their declarative input validations.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public class StudentForm extends BaseForm {
	
	private String firstName;
	
	private String lastName;
	
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@NotNull
	private Date dob;
	
	private String mobileNo;
	
	private String email;
	
	private String branch;
	
	private String collegeName;
	
	@NotNull
	private Long collegeId;
	

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

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

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public Long getCollegeId() {
		return collegeId;
	}

	public void setCollegeId(Long collegeId) {
		this.collegeId = collegeId;
	}
	
	@Override
	public BaseDTO getDto() {

		StudentDTO dto = new StudentDTO();
		dto.setId(id);
		dto.setFirstName(Util.getCapital(firstName));
		dto.setLastName(Util.getCapital(lastName));
		dto.setDob(dob);
		dto.setMobileNo(mobileNo);
		dto.setEmail(email);
		dto.setCollegeId(collegeId);
		dto.setBranchName(branch);
		return dto;
	}

	@Override
	public void populate(BaseDTO bDto) {
		StudentDTO dto = (StudentDTO) bDto;
		id = dto.getId();
		firstName = Util.getCapital(dto.getFirstName());
		lastName = Util.getCapital(dto.getLastName());
		dob = dto.getDob();
		mobileNo = dto.getMobileNo();
		email = dto.getEmail();
		collegeId = dto.getCollegeId();
		branch = dto.getBranchName();
	}


}
