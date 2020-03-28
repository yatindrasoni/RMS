package com.dhavisoft.rms.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.dhavisoft.rms.dto.MarksheetDTO;
import com.dhavisoft.rms.form.MarksheetForm;
import com.dhavisoft.rms.util.DataValidator;

@Component
public class MarksheetValidator implements Validator {

	public boolean supports(Class marksheet) {

		return MarksheetDTO.class.isAssignableFrom(marksheet);
	}

	public void validate(Object target, Errors errors) {

		MarksheetForm marksheet = (MarksheetForm) target;

		if (DataValidator.isNull(marksheet.getRollNo())) {
			/*if (!DataValidator.isAlphaNumeric(marksheet.getRollNo())) {*/

				errors.rejectValue("rollNo", "rollNo.alpha");
			/*}*/
		}
	}
}
