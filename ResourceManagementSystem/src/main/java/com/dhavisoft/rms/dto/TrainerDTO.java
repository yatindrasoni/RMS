package com.dhavisoft.rms.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Trainer DTO class encapsulates Trainer attributes
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
@Entity
@Table(name = "trainer")
public class TrainerDTO extends BaseDTO{

	/**
	 * First Name of Trainer
	 */
	@Column(name = "FIRST_NAME", length = 50)
	private String firstName;
	
	/**
	 * Last Name of Trainer
	 */
	@Column(name = "LAST_NAME", length = 50)
	private String lastName;
	
	/**
	 * Date of Birth of Trainer
	 */
	@Column(name = "DOB", length = 50)
	private Date dob;
	
	/**
	 * Email of Trainer
	 */
	@Column(name = "EMAIL", length = 50)
	private String email;
	
	/**
	 * MobileNo of Trainer
	 */
	@Column(name = "MOBILE_NO", length = 50)
	private String mobileNo;
	
	/**
	 * Address of Trainer
	 */
	@Column(name = "ADDRESS", length = 50)
	private String address;
	
	/**
	 * ProgramId of Trainer
	 */
	@Column(name = "PROGRAM_ID", length = 50)
	private long programId;
	/**
	 * Program Name of Trainer
	 */
	@Column(name = "PROGRAM_NAME", length = 50)
	private String programName;
	
	/**
	 * accessor
	 */
	
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
	public long getProgramId() {
		return programId;
	}
	public void setProgramId(long programId) {
		this.programId = programId;
	}
	public String getProgramName() {
		return programName;
	}
	public void setProgramName(String programName) {
		this.programName = programName;
	}
	public String getKey() {
		return id + "";
	}
	public String getValue() {
		return firstName+" "+lastName;
	}


}
