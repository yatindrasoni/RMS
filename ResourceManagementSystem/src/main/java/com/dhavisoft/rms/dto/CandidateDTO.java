package com.dhavisoft.rms.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Candidate DTO class encapsulates Candidate attributes
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 * 
 */
@Entity
@Table(name = "candidate")
public class CandidateDTO extends BaseDTO {

	/**
	 * First Name of Student
	 */
	@Column(name = "FIRST_NAME", length = 50)
	private String firstName;

	/**
	 * Last Name of Student
	 */
	@Column(name = "LAST_NAME", length = 50)
	private String lastName;

	/**
	 * Date of Birth of Student
	 */
   
	@Column(name = "DATE_OF_BIRTH", length = 50)
	private Date dob;

	/**
	 * Mobileno of Student
	 */
	@Column(name = "CONTACT_NO", length = 50)
	private String contactNo;

	/**
	 * Email of Student
	 */
	@Column(name = "EMAIL", length = 50)
	private String email;

	/**
	 * CollegeId of Student
	 *//*
		 * @Column(name = "COLLEGE_ID", length = 50) private Long collegeId = 0L;
		 */

	/**
	 * College name of Student
	 */
	@Column(name = "COLLEGE_NAME", length = 50)
	private String collegeName;

	/**
	 * Branch name of Student
	 */
	@Column(name = "BRANCH_NAME", length = 50)
	private String branchName;

	/**
	 * Gender of Student
	 */
	@Column(name = "GENDER", length = 50)
	private String gender;

	/**
	 * Aadhar Number of Student
	 */
	@Column(name = "Aadhar_NO", length = 50)
	private String aadharNo;

	/**
	 * Address of Student
	 */
	@Column(name = "ADDRESS", length = 50)
	private String address;

	/**
	 * Country name of Student
	 */
	@Column(name = "COUNTRY", length = 50)
	private String country;

	/**
	 * State name of Student
	 */
	@Column(name = "STATE", length = 50)
	private String state;

	/**
	 * City name of Student
	 */
	@Column(name = "CITY", length = 50)
	private String city;

	/**
	 * Year of Student
	 */
	@Column(name = "YEAR", length = 50)
	private String year;

	/**
	 * Semester name of Student
	 */
	@Column(name = "SEMESTER", length = 50)
	private String semester;

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

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	/*
	 * public Long getCollegeId() { return collegeId; }
	 * 
	 * public void setCollegeId(Long collegeId) { this.collegeId = collegeId; }
	 */

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAadharNo() {
		return aadharNo;
	}

	public void setAadharNo(String aadharNo) {
		this.aadharNo = aadharNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getKey() {
		return id + "";
	}

	public String getValue() {
		return firstName + " " + lastName;
	}

	
}
