package com.dhavisoft.rms.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Marksheet DTO class encapsulates Marksheet attributes
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 * 
 */
@Entity
@Table(name = "marksheet")
public class MarksheetDTO extends BaseDTO {

	/**
	 * Rollno of Student
	 */
	@Column(name = "ROLL_NO", length = 50)
	private String rollNo;
	/**
	 * ID of Student
	 */
	@Column(name = "CANDIDATE_ID", length = 50)
	private long candidateId;
	/**
	 * Name of Student
	 */
	@Column(name = "CANDIDATE_NAME", length = 50)
	private String candidateName;
	/**
	 * Physics marks of Student
	 */
	@Column(name = "PHYSICS", length = 50)
	private Integer physics;
	/**
	 * Chemistry marks of Student
	 */
	@Column(name = "CHEMISTRY", length = 50)
	private Integer chemistry;
	/**
	 * Mathematics marks of Student
	 */
	@Column(name = "MATHS", length = 50)
	private Integer maths;
	
	@Column(name = "COLLEGE_ID", length = 50)
	private Long collegeId = 0L;
	/**
	 * College name of Student
	 */
	@Column(name = "COLLEGE_NAME", length = 50)
	private String collegeName;
	
	private Integer total;
	

	
	public Long getCollegeId() {
		return collegeId;
	}

	public void setCollegeId(Long collegeId) {
		this.collegeId = collegeId;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	/**
	 * accessor
	 */
	public String getRollNo() {
		return rollNo;
	}

	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}

	

	public long getCandidateId() {
		return candidateId;
	}

	public void setCandidateId(long candidateId) {
		this.candidateId = candidateId;
	}

	public String getCandidateName() {
		return candidateName;
	}

	public void setCandidateName(String candidateName) {
		this.candidateName = candidateName;
	}

	public Integer getPhysics() {
		return physics;
	}

	public void setPhysics(Integer physics) {
		this.physics = physics;
	}

	public Integer getChemistry() {
		return chemistry;
	}

	public void setChemistry(Integer chemistry) {
		this.chemistry = chemistry;
	}

	public Integer getMaths() {
		return maths;
	}

	public void setMaths(Integer maths) {
		this.maths = maths;
	}

	public String getKey() {
		return id + "";
	}

	public String getValue() {
		return rollNo;
	}

}
