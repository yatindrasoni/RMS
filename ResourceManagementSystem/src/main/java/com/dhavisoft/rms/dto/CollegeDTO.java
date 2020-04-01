package com.dhavisoft.rms.dto;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * College DTO class encapsulates College attributes
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 * 
 */

@Entity
@Table(name = "st_college")
public class CollegeDTO extends BaseDTO {

	/**
	 * Name of College
	 */

	@Column(name = "NAME", length = 50)
	private String name;
	/**
	 * Address of College
	 */
	@Column(name = "ADDRESS", length = 100)
	private String address;
	/**
	 * State of College
	 */
	@Column(name = "STATE", length = 50)
	private String state;
	/**
	 * City of College
	 */
	@Column(name = "CITY", length = 50)
	private String city;
	/**
	 * Phoneno of College
	 */
	@Column(name = "MOBILE_NO", length = 50)
	private String mobileNo;

	/**
	 * accessor
	 */
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getKey() {
		return id + "";
	}

	public String getValue() {
		return name;
	}

}
