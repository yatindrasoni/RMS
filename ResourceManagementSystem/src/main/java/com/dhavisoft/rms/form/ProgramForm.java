package com.dhavisoft.rms.form;

import java.sql.Timestamp;
import java.util.Date;

import com.dhavisoft.rms.dto.BaseDTO;
import com.dhavisoft.rms.dto.CourseDTO;
import com.dhavisoft.rms.dto.ProgramDTO;

/**
 * Contain Program form element and their daclarative input validatiion.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 *
 */
public class ProgramForm extends BaseForm {

    private String programName;
	
	private String description;
	
	private String duration;

	

	public String getProgramName() {
		return programName;
	}

	public void setProgramName(String programName) {
		this.programName = programName;
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
		
		ProgramDTO dto = new ProgramDTO();
		dto.setId(id);
		dto.setName(programName);
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
		ProgramDTO dto = (ProgramDTO) bDto;
		
		id = dto.getId();
		programName = dto.getName();
		description = dto.getDescription();
		duration = dto.getDuration();
		createdBy = dto.getCreatedBy();
		modifiedBy = dto.getModifiedBy();
		createdDatetime = dto.getCreatedDatetime().getTime();
		modifiedDatetime = dto.getModifiedDatetime().getTime();

		super.populate(bDto);
	}

}
