package com.dhavisoft.rms.form;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.dhavisoft.rms.dto.BaseDTO;
import com.dhavisoft.rms.dto.TimeTableDTO;
import com.dhavisoft.rms.util.Util;

/**
 * Contains Time Table form elements and their declarative input validations.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 * 
 */

public class TimeTableForm extends BaseForm {

	/**
	 * Program ID
	 */
	@NotNull
	private Long programId;

	/**
	 * Program Name
	 */
	private String programName;

	/**
	 * Date of Exam
	 */
	/* @DateTimeFormat(pattern = "MM/dd/yyyy") */

	/*
	 * @NotEmpty
	 * 
	 * @Future private String examinationDate;
	 */
	/**
	 * Time of Exam
	 */
	@NotEmpty
	private String time;

	/**
	 * Day of Exam
	 *//*
		 * private String day;
		 */
	private String trainerName;

	@NotNull
	private Long trainerId;

	/**
	 * Accessor
	 */

	public Long getProgramId() {
		return programId;
	}

	public String getTrainerName() {
		return trainerName;
	}

	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}

	public Long getTrainerId() {
		return trainerId;
	}

	public void setTrainerId(Long trainerId) {
		this.trainerId = trainerId;
	}

	public void setProgramId(Long programId) {
		this.programId = programId;
	}

	public String getProgramName() {
		return programName;
	}

	public void setProgramName(String programName) {
		this.programName = programName;
	}

	/*
	 * public String getExaminationDate() { return examinationDate; }
	 * 
	 * public void setExaminationDate(String examinationDate) { this.examinationDate
	 * = examinationDate; }
	 */

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	/*
	 * public String getDay() { return day; }
	 * 
	 * public void setDay(String day) { this.day = day; }
	 */

	@Override
	public BaseDTO getDto() {
		TimeTableDTO dto = new TimeTableDTO();
		dto.setId(id);
		if (programId != null) {
			dto.setProgramId(programId);
		}
		dto.setProgramName(programName);
		System.out.println("++++++PROGRAM IN TIME TABLE FORM++++++++ " + programName);

		//dto.setExaminationDate(Util.getDate(examinationDate));
		dto.setTime(time);
		//dto.setDay(day);
		if (trainerId != null) {
			dto.setTrainerId(trainerId);
		}
		dto.setTrainerName(trainerName);
		return dto;
	}

	@Override
	public void populate(BaseDTO bDto) {
		TimeTableDTO dto = (TimeTableDTO) bDto;

		id = dto.getId();
		programId = dto.getProgramId();
		programName = dto.getProgramName();
		System.out.println("COURSE IN TIME TABLE " + dto.getProgramName());

		trainerId = dto.getTrainerId();
		trainerName = dto.getTrainerName();
		System.out.println("++++++++++++++++++++++++++++++" + dto.getTrainerName());

		//examinationDate = Util.getDate(dto.getExaminationDate());
		time = dto.getTime();
		//day = dto.getDay();
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
