package com.dhavisoft.rms.form;

import java.sql.Timestamp;
import java.util.Date;

import com.dhavisoft.rms.dto.BaseDTO;
import com.dhavisoft.rms.dto.CourseDTO;

/**
 * Contain Course form element and their daclarative input validatiion.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 *
 */
public class CourseForm extends BaseForm{

	private String courseName;
	
	private String description;
	
	private String duration;

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}
	
	public BaseDTO getDto() {
		
		CourseDTO dto = new CourseDTO();
		dto.setId(id);
		dto.setName(courseName);
		dto.setDescription(description);
		dto.setDuration(duration);
		dto.setCreatedBy(createdBy);
		dto.setModifiedBy(modifiedBy);
		dto.setCreatedDatetime(new Timestamp(new Date().getTime()));
		dto.setModifiedDatetime(new Timestamp(new Date().getTime()));
		return dto;
	}

	@Override
	public void populate(BaseDTO bDto) {
		CourseDTO dto = (CourseDTO) bDto;
		id = dto.getId();
		courseName = dto.getName();
		description = dto.getDescription();
		duration = dto.getDuration();
		createdBy = dto.getCreatedBy();
		modifiedBy = dto.getModifiedBy();
		createdDatetime = dto.getCreatedDatetime().getTime();
		modifiedDatetime = dto.getModifiedDatetime().getTime();

		super.populate(bDto);
	}

}