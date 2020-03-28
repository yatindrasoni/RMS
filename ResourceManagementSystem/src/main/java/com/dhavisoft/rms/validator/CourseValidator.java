package com.dhavisoft.rms.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.dhavisoft.rms.dto.CourseDTO;
import com.dhavisoft.rms.form.CourseForm;
import com.dhavisoft.rms.util.DataValidator;

@Component
public class CourseValidator implements Validator {

	public boolean supports(Class course) {
		return CourseDTO.class.isAssignableFrom(course);
	}

	public void validate(Object target, Errors errors) {
		
		CourseForm course = (CourseForm) target;
		
		if (DataValidator.isNull(course.getCourseName())) {
			errors.rejectValue("courseName", "NotEmpty.form.programName");
		}

		else if (!DataValidator.isNull(course.getCourseName())) {
			if (DataValidator.isNotAlpha(course.getCourseName())) {
				errors.rejectValue("courseName", "programName.alpha");
			}
		}

		if (DataValidator.isNull(course.getDescription())) {
			errors.rejectValue("description", "NotEmpty.form.description");
		}

		else if (!DataValidator.isNull(course.getDescription())) {
			if (DataValidator.isNotAlpha(course.getDescription())) {
				errors.rejectValue("description", "description.alpha");
			}
		}

		if (DataValidator.isNull(course.getDuration())) {
			errors.rejectValue("duration", "NotEmpty.form.duration");
		} else if (!DataValidator.isNull(course.getDuration())) {
			if (DataValidator.isInvalidDuration((course.getDuration()))) {
				errors.rejectValue("duration", "duration.Limit");

			}

		}

	}
	
}
