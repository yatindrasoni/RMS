package com.dhavisoft.rms.form;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import com.dhavisoft.rms.dto.BaseDTO;
import com.dhavisoft.rms.dto.CandidateDTO;
import com.dhavisoft.rms.dto.StudentDTO;
import com.dhavisoft.rms.util.Util;

/**
 * Contains Candidate form elements and their declarative input validations.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public class CandidateForm extends BaseForm{

	private String firstName;

	private String lastName;

	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@NotNull
	private Date dob;

	private String contactNo;

	private String email;

	private String branchName;

	private String gender;
	
	private String address;
	
	private String country;
	
	private String state;
	
	private String city;
	
	private String year;
	
	private String semester;
	
	private String collegeName;
	
	private String aadharNo;

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
	
	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public String getAadharNo() {
		return aadharNo;
	}

	public void setAadharNo(String aadharNo) {
		this.aadharNo = aadharNo;
	}

	@Override
	public BaseDTO getDto() {

		CandidateDTO dto = new CandidateDTO();
		dto.setId(id);
		dto.setFirstName(Util.getCapital(firstName));
		dto.setLastName(Util.getCapital(lastName));
		dto.setDob(dob);
		dto.setContactNo(contactNo);
		dto.setEmail(email);
		dto.setBranchName(branchName);
		dto.setGender(gender);
		dto.setAddress(address);
		dto.setCountry(country);
		dto.setState(state);
		dto.setCity(city);	
		dto.setYear(year);
		dto.setSemester(semester);
		dto.setCollegeName(collegeName);
		dto.setAadharNo(aadharNo);
		
		return dto;
	}

	@Override
	public void populate(BaseDTO bDto) {
		
		CandidateDTO dto = (CandidateDTO) bDto;
		id = dto.getId();
		firstName = Util.getCapital(dto.getFirstName());
		lastName = Util.getCapital(dto.getLastName());
		dob = dto.getDob();
		contactNo = dto.getContactNo();
		email = dto.getEmail();
		branchName = dto.getBranchName();
		gender = dto.getGender();
		address = dto.getAddress();
		country = dto.getCountry();
		state = dto.getState();
		city = dto.getCity();
		year = dto.getYear();
		semester = dto.getSemester();
		collegeName = dto.getCollegeName();
		aadharNo = dto.getAadharNo();
	}
}
