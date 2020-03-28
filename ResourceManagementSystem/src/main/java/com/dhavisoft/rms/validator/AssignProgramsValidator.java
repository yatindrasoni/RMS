package com.dhavisoft.rms.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.dhavisoft.rms.dto.AssignProgramsDTO;
import com.dhavisoft.rms.dto.CandidateDTO;
import com.dhavisoft.rms.form.AssignProgramsForm;
import com.dhavisoft.rms.form.CandidateForm;
import com.dhavisoft.rms.util.DataValidator;

@Component
public class AssignProgramsValidator implements Validator {

	
	public boolean supports(Class assignPrograms) {
		return AssignProgramsDTO.class.isAssignableFrom(assignPrograms);
	}

	public void validate(Object target, Errors errors) {
		
		AssignProgramsForm assignPrograms = (AssignProgramsForm) target;
		
		if (DataValidator.isNull(assignPrograms.getFirstName())) {
			errors.rejectValue("firstName", "NotEmpty.form.firstName");
		}

		else if (!DataValidator.isNull(assignPrograms.getFirstName())) {

			if (DataValidator.isNotAlpha(assignPrograms.getFirstName())) {
				errors.rejectValue("firstName", "firstName.alpha");

			}

		}

		if (DataValidator.isNull(assignPrograms.getLastName())) {
			errors.rejectValue("lastName", "NotEmpty.form.lastName");
		}

		else if (!DataValidator.isNull(assignPrograms.getLastName())) {

			if (DataValidator.isNotAlpha(assignPrograms.getLastName())) {
				errors.rejectValue("lastName", "lastName.alpha");

			} else if (!DataValidator.isAlphabetsOnly(assignPrograms.getLastName())) {
				errors.rejectValue("lastName", "lastName.alphabets");
			}
		}
		
		/*
		 * if (DataValidator.isNull(assignPrograms.getProgram())) {
		 * errors.rejectValue("programName", "NotEmpty.form.programName"); }
		 * 
		 * else if (!DataValidator.isNull(assignPrograms.getProgram())) {
		 * 
		 * if (DataValidator.isNotAlpha(assignPrograms.getLastName())) {
		 * errors.rejectValue("programName", "programName.alpha");
		 * 
		 * } else if (!DataValidator.isAlphabetsOnly(assignPrograms.getLastName())) {
		 * errors.rejectValue("programName", "programName.alphabets"); } }
		 * 
		 */
		if (DataValidator.isNull(assignPrograms.getFee())) {
			errors.rejectValue("fee", "NotEmpty.form.fee");
		}

		else if (!DataValidator.isNull(assignPrograms.getFee())) {

			if (DataValidator.isAlpha(assignPrograms.getFee())) {
				errors.rejectValue("fee", "fee.int");
			}	
	    }
		
		if (DataValidator.isNull(assignPrograms.getPaid())) {
			errors.rejectValue("paid", "NotEmpty.form.paid");
		}

		else if (!DataValidator.isNull(assignPrograms.getPaid())) {

			if (DataValidator.isAlpha(assignPrograms.getPaid())) {
				errors.rejectValue("paid", "paid.int");
			}	
	    }
		
		if (DataValidator.isNull(assignPrograms.getDue())) {
			errors.rejectValue("due", "NotEmpty.form.due");
		}

		else if (!DataValidator.isNull(assignPrograms.getDue())) {

			if (DataValidator.isAlpha(assignPrograms.getDue())) {
				errors.rejectValue("due", "due.int");
			}	
	    }
		
		if (DataValidator.isNull(assignPrograms.getDiscount())) {
			errors.rejectValue("discount", "NotEmpty.form.discount");
		}

		else if (!DataValidator.isNull(assignPrograms.getDiscount())) {

			if (DataValidator.isAlpha(assignPrograms.getDiscount())) {
				errors.rejectValue("discount", "discount.int");
			}	
	    }
	
	}

}
