package com.dhavisoft.rms.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


import com.dhavisoft.rms.dto.ProgramDTO;

import com.dhavisoft.rms.form.ProgramForm;
import com.dhavisoft.rms.util.DataValidator;

@Component
public class ProgramValidation implements Validator {

	public boolean supports(Class program) {
		return ProgramDTO.class.isAssignableFrom(program);
	}

	public void validate(Object target, Errors errors) {
		
		ProgramForm program = (ProgramForm) target;
		
		if (DataValidator.isNull(program.getProgramName())) {
			errors.rejectValue("programName", "NotEmpty.form.programName");
		}
		if (DataValidator.isNull(program.getDescription())) {
			errors.rejectValue("description", "NotEmpty.form.description");
		}
		if (DataValidator.isNull(program.getDuration())) {
			errors.rejectValue("duration", "NotEmpty.form.duration");
		} 

	}
}
