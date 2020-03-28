package com.dhavisoft.rms.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Role DTO class encapsulates Role attributes
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 * 
 */

@Entity
@Table(name = "st_role")
public class RoleDTO extends BaseDTO {

	/**
	 * Predefined Role constants
	 */
	public static final int ADMIN = 1;
	public static final int CANDIDATE = 2;
	public static final int COLLEGE_SCHOOL = 3;
	public static final int AGENT = 4;
	public static final int TRAINER = 5;

	/**
	 * Role Name
	 */
	@Column(name = "NAME", length = 50)
	private String name;

	/**
	 * Role Description
	 */
	@Column(name = "DESCRIPTION", length = 100)
	private String description;

	/**
	 * accessor
	 */

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getKey() {
		return id + "";
	}

	public String getValue() {
		return name + "";
	}

}
