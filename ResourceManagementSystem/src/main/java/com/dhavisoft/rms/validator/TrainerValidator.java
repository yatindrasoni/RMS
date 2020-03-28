package com.dhavisoft.rms.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import com.dhavisoft.rms.dto.TrainerDTO;
import com.dhavisoft.rms.form.FacultyForm;
import com.dhavisoft.rms.form.TrainerForm;
import com.dhavisoft.rms.util.DataValidator;

@Component
public class TrainerValidator implements Validator{

	public boolean supports(Class<?> trainer) {
		return TrainerDTO.class.isAssignableFrom(trainer);
	}

	public void validate(Object target, Errors errors) {
		TrainerForm trainer = (TrainerForm) target;

		if (DataValidator.isNull(trainer.getFirstName())) {
			errors.rejectValue("firstName", "NotEmpty.form.firstName");
		}

		else if (!DataValidator.isNull(trainer.getFirstName())) {

			if (DataValidator.isNotAlpha(trainer.getFirstName())) {
				errors.rejectValue("firstName", "firstName.alpha");

			}

		}

		if (DataValidator.isNull(trainer.getLastName())) {
			errors.rejectValue("lastName", "NotEmpty.form.lastName");
		}

		else if (!DataValidator.isNull(trainer.getLastName())) {

			if (DataValidator.isNotAlpha(trainer.getLastName())) {
				errors.rejectValue("lastName", "lastName.alpha");

			} else if (!DataValidator.isAlphabetsOnly(trainer.getLastName())) {
				errors.rejectValue("lastName", "lastName.alphabets");
			}

		}

		if (trainer.getDob() != null) {
			if (!DataValidator.isValidDate((trainer.getDob()))) {

				errors.rejectValue("dob", "dob.pastLimit");

			} else if (DataValidator.isUnderAge(trainer.getDob())) {

				errors.rejectValue("dob", "dob.underAgeLimit");

			} else if (DataValidator.isOverAge(trainer.getDob())) {

				errors.rejectValue("dob", "dob.overAgeLimit");

			}
		}

		if (DataValidator.isNull(trainer.getMobileNo())) {
			errors.rejectValue("mobileNo", "NotEmpty.form.mobileNo");
		} else if (!DataValidator.isNull(trainer.getMobileNo())) {

			if (DataValidator.isAlpha(trainer.getMobileNo())) {
				errors.rejectValue("mobileNo", "mobile.int");
			}

			else if (trainer.getMobileNo().length() != 10) {

				errors.rejectValue("mobileNo", "mobile.length");
			} else if (DataValidator.isNotMobileNo(trainer.getMobileNo())) {

				errors.rejectValue("mobileNo", "mobileNo.invalid");

			}
		}
		if (DataValidator.isNull(trainer.getEmail())) {
			errors.rejectValue("email", "NotEmpty.form.email");
		}

		else if (!DataValidator.isNull(trainer.getEmail())) {

			if (!DataValidator.isEmail(trainer.getEmail())) {
				errors.rejectValue("email", "Email.invalid");

			}

		}
		
		/*
		 * if (DataValidator.isNull(trainer.getAddress())) {
		 * 
		 * errors.rejectValue("address", "NotEmpty.form.address"); }
		 */
		
	}

}
