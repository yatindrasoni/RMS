package com.dhavisoft.rms.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * AssignPrograms DTO class encapsulates AssignPrograms attributes
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 * 
 */
@Entity
@Table(name = "assignPrograms")
public class AssignProgramsDTO extends BaseDTO {

	/**
	 * First Name of AssignPrograms
	 */
	@Column(name = "FIRST_NAME", length = 50)
	private String firstName;

	/**
	 * Last Name of AssignPrograms
	 */
	@Column(name = "LAST_NAME", length = 50)
	private String lastName;

	/**
	 * Fee of AssignPrograms
	 */
	@Column(name = "FEE", length = 50)
	private String fee;

	/**
	 * Paid Fee of AssignPrograms
	 */
	@Column(name = "PAID", length = 50)
	private String paid;

	/**
	 * Due Fee of AssignPrograms
	 */
	@Column(name = "DUE", length = 50)
	private String due;

	/**
	 * Discount Fee of AssignPrograms
	 */
	@Column(name = "DISCOUNT", length = 50)
	private String discount;

	/**
	 * Email of AssignPrograms
	 */
	@Column(name = "EMAIL", length = 50)
	private String email;

	/**
	 * Program ID
	 */
	  @Column(name = "PROGRAM_ID", length = 50) 
	  private long programId;
	 
	/**
	 * Program Name
	 */
	@Column(name = "PROGRAM_NAME", length = 50)
	private String programName;

	

	
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

	public String getPaid() {
		return paid;
	}

	public void setPaid(String paid) {
		this.paid = paid;
	}

	public String getDue() {
		return due;
	}

	public void setDue(String due) {
		this.due = due;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	
	public String getKey() {
		return id + "";
	}

	
	public String getValue() {
		return programName;
	}

}
