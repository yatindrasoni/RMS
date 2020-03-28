package com.dhavisoft.rms.form;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.dhavisoft.rms.dto.BaseDTO;
import com.dhavisoft.rms.dto.MarksheetDTO;

/**
 * Contains Marksheet form elements and their declarative input validations.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public class MarksheetForm extends BaseForm {

	protected long id = 0;

	@NotEmpty
	private String rollNo = null;

	private String candidateName;

	@NotNull
	@Min(0)
	@Max(100)
	private Integer physics;

	@NotNull
	@Min(0)
	@Max(100)
	private Integer chemistry;

	@NotNull
	@Min(0)
	@Max(100)
	private Integer maths;

	@NotNull
	private Long candidateId = 0L;

	private String collegeName;

	@NotNull
	private Long collegeId;

	private Integer total;

	
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

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getRollNo() {
		return rollNo;
	}

	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
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

	public Long getCandidateId() {
		return candidateId;
	}

	public void setCandidateId(Long candidateId) {
		this.candidateId = candidateId;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	@Override
	public BaseDTO getDto() {
		MarksheetDTO dto = new MarksheetDTO();
		dto.setId(id);
		dto.setMaths(maths);
		dto.setPhysics(physics);
		dto.setChemistry(chemistry);
		dto.setRollNo(rollNo);
		dto.setCollegeId(collegeId);
		dto.setCollegeName(collegeName);
		if (candidateId != null) {
			dto.setCandidateId(candidateId);
		}
		return dto;
	}

	@Override
	public void populate(BaseDTO bDto) {
		MarksheetDTO dto = (MarksheetDTO) bDto;
		id = dto.getId();
		candidateName = dto.getCandidateName();
		maths = dto.getMaths();
		physics = dto.getPhysics();
		chemistry = dto.getChemistry();
		rollNo = dto.getRollNo();
		candidateId = dto.getCandidateId();
		collegeId = dto.getCollegeId();
		collegeName = dto.getCollegeName();
		createdBy = dto.getCreatedBy();
		modifiedBy = dto.getModifiedBy();
		if (dto.getCreatedDatetime() != null) {
			createdDatetime = dto.getCreatedDatetime().getTime();
		}
		if (dto.getModifiedDatetime() != null) {
			modifiedDatetime = dto.getModifiedDatetime().getTime();
		}

	}

}
