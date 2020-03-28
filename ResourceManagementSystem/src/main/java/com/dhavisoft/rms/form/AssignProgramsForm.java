package com.dhavisoft.rms.form;

import javax.validation.constraints.NotNull;

import com.dhavisoft.rms.dto.AssignProgramsDTO;
import com.dhavisoft.rms.dto.BaseDTO;
import com.dhavisoft.rms.dto.CandidateDTO;
import com.dhavisoft.rms.util.Util;

/**
 * Contains AssignPrograms form elements and their declarative input
 * validations.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public class AssignProgramsForm extends BaseForm {

	private String firstName;

	private String lastName;

	private String fee;

	private String paid;

	private String due;

	private String discount;

	private String email;

	/**
	 * Program ID
	 */
	@NotNull 
	private Long programId;
	 
	/**
	 * Program Name
	 */
	private String programName;

	public String getEmail() {
		return email;
	}

	  public Long getProgramId() { 
		  return programId; }
	  
	  
	  
	  public void setProgramId(Long programId) { 
		  this.programId = programId; }
	 

	public String getProgramName() {
		return programName;
	}



	public void setProgramName(String programName) {
		this.programName = programName;
	}



	public void setEmail(String email) {
		this.email = email;
	}

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

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

	public String getPaid() {
		return paid;
	}

	public void setPaid(String paid) {
		this.paid = paid;
	}

	public String getDue() {
		return due;
	}

	public void setDue(String due) {
		this.due = due;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public BaseDTO getDto() {

		AssignProgramsDTO dto = new AssignProgramsDTO();

		dto.setId(id);
		dto.setFirstName(Util.getCapital(firstName));
		dto.setLastName(Util.getCapital(lastName));
		
		if (programId != null) { 
			dto.setProgramId(programId); 
			}
		 
		dto.setProgramName(programName);
		System.out.println("--------------COURSE_NAME------------- " + programName);

		dto.setFee(fee);
		dto.setPaid(paid);
		dto.setDue(due);
		dto.setDiscount(discount);
		dto.setEmail(email);

		return dto;
	}

	public void populate(BaseDTO bDto) {

		AssignProgramsDTO dto = (AssignProgramsDTO) bDto;
		id = dto.getId();
		firstName = Util.getCapital(dto.getFirstName());
		lastName = Util.getCapital(dto.getLastName());
		
		programId = dto.getProgramId(); 
		programName = dto.getProgramName();
		System.out.println("-------------PROGRAM-----------------" + dto.getProgramId());
		
		fee = dto.getFee();
		paid = dto.getPaid();
		due = dto.getDue();
		discount = dto.getDiscount();
		email = dto.getEmail();
		

	}
}
