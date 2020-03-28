package com.dhavisoft.rms.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.dhavisoft.rms.dto.CandidateDTO;
import com.dhavisoft.rms.form.CandidateForm;
import com.dhavisoft.rms.util.DataValidator;

@Component
public class CandidateValidator implements Validator {

	public boolean supports(Class candidate) {
		return CandidateDTO.class.isAssignableFrom(candidate);
	}

	public void validate(Object target, Errors errors) {
		
		CandidateForm candidate = (CandidateForm) target;
		
		
		if (DataValidator.isNull(candidate.getFirstName())) {
			errors.rejectValue("firstName", "NotEmpty.form.firstName");
		}

		else if (!DataValidator.isNull(candidate.getFirstName())) {

			if (DataValidator.isNotAlpha(candidate.getFirstName())) {
				errors.rejectValue("firstName", "firstName.alpha");

			}

		}

		if (DataValidator.isNull(candidate.getLastName())) {
			errors.rejectValue("lastName", "NotEmpty.form.lastName");
		}

		else if (!DataValidator.isNull(candidate.getLastName())) {

			if (DataValidator.isNotAlpha(candidate.getLastName())) {
				errors.rejectValue("lastName", "lastName.alpha");

			} else if (!DataValidator.isAlphabetsOnly(candidate.getLastName())) {
				errors.rejectValue("lastName", "lastName.alphabets");
			}

		}

		if (DataValidator.isNull(candidate.getEmail())) {
			errors.rejectValue("email", "NotEmpty.form.email");
		} else if (!DataValidator.isNull(candidate.getEmail())) {

			if (!DataValidator.isEmail(candidate.getEmail())) {
				errors.rejectValue("email", "Email.invalid");

			}

		}

		if (candidate.getDob() != null) {
			if (!DataValidator.isValidDate((candidate.getDob()))) {

				errors.rejectValue("dob", "dob.pastLimit");

			} else if (DataValidator.isUnderAge(candidate.getDob())) {

				errors.rejectValue("dob", "dob.underAgeLimit");

			} else if (DataValidator.isOverAge(candidate.getDob())) {

				errors.rejectValue("dob", "dob.overAgeLimit");

			}
		}

		if (DataValidator.isNull(candidate.getContactNo())) {
			errors.rejectValue("contactNo", "NotEmpty.form.contactNo");
		}

		else if (!DataValidator.isNull(candidate.getContactNo())) {

			if (DataValidator.isAlpha(candidate.getContactNo())) {
				errors.rejectValue("contactNo", "contact.int");
			}

			else if (candidate.getContactNo().length() != 10) {

				errors.rejectValue("contactNo", "contact.length");
			} else if (DataValidator.isNotMobileNo(candidate.getContactNo())) {

				errors.rejectValue("contact", "contactNo.invalid");

			}
		}
		
		if (DataValidator.isNull(candidate.getBranch())) {
			errors.rejectValue("branch", "NotEmpty.form.branch");
		}
		
		
		if (DataValidator.isNull(candidate.getAddress())) {

			errors.rejectValue("address", "NotEmpty.form.address");
		}
		
		if (DataValidator.isNull(candidate.getCountry())) {
			errors.rejectValue("country", "NotEmpty.form.country");
		}

		else if (!DataValidator.isNull(candidate.getCountry())) {
			if (DataValidator.isNotAlpha(candidate.getCountry())) {
				errors.rejectValue("country", "country.alpha");
			}
		}

		if (DataValidator.isNull(candidate.getState())) {

			errors.rejectValue("state", "NotEmpty.form.state");

		}

		else if (!DataValidator.isNull(candidate.getState())) {

			if (!DataValidator.isState(candidate.getState())) {
				errors.rejectValue("state", "state.spec");

			}

		}

		
		if (DataValidator.isNull(candidate.getCity())) {
			errors.rejectValue("city", "NotEmpty.form.city");
		}

		else if (!DataValidator.isNull(candidate.getCity())) {
			if (DataValidator.isNotAlpha(candidate.getCity())) {
				errors.rejectValue("city", "city.alpha");
			}
		}
		
		
		if (DataValidator.isNull(candidate.getCollegeName())) {
			errors.rejectValue("collegeName", "NotEmpty.form.name");
		}

		else if (!DataValidator.isNull(candidate.getCollegeName())) {
			if (!DataValidator.isCollegeName(candidate.getCollegeName())) {
				errors.rejectValue("collegeName", "college.spec");
			}
		}
		
		
		if (DataValidator.isNull(candidate.getGender())) {
			errors.rejectValue("gender", "NotEmpty.form.gender");
		}
		
		
		if (DataValidator.isNull(candidate.getSemester())) {
			errors.rejectValue("semester", "NotEmpty.form.semester");
		}
		
		
		if (DataValidator.isNull(candidate.getYear())) {
			errors.rejectValue("year", "NotEmpty.form.year");
		}
		
		
		 if (!DataValidator.isNull(candidate.getAadharNo())) {

				if (DataValidator.isAlpha(candidate.getAadharNo())) {
					errors.rejectValue("aadharNo", "aadhar.int");
				}

				else if (candidate.getAadharNo().length() != 12) {

					errors.rejectValue("aadharNo", "aadhar.length");
				}
	       }
		 
   }	 

}
