package com.dhavisoft.rms.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Time Table DTO class encapsulates Time Table attributes
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 * 
 */
@Entity
@Table(name = "timetable")
public class TimeTableDTO extends BaseDTO {

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

	@Column(name = "TRAINER_ID", length = 50)
	private long trainerId;

	@Column(name = "TRAINER_NAME")
	private String trainerName;

	/**
	 * Date of Exam
	 *//*
		 * @Column(name = "EXAMINATION_DATE", length = 50) private Date examinationDate;
		 */
	/**
	 * Time of Exam
	 */
	@Column(name = "TIME", length = 50)
	private String time;

	/**
	 * Day of Exam
	 *//*
		 * @Column(name = "DAY", length = 50) private String day;
		 */

	/**
	 * accessor
	 */

	public long getTrainerId() {
		return trainerId;
	}

	public void setTrainerId(long trainerId) {
		this.trainerId = trainerId;
	}

	public String getTrainerName() {
		return trainerName;
	}

	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}

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

	/*
	 * public Date getExaminationDate() { return examinationDate; }
	 * 
	 * public void setExaminationDate(Date examinationDate) { this.examinationDate =
	 * examinationDate; }
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

	public String getKey() {
		return id + "";
	}

	public String getValue() {
		return trainerName;
	}

}
