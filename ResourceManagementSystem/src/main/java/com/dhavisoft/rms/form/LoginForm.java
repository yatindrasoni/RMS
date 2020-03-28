package com.dhavisoft.rms.form;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Contains Login form element and their declarative input validations.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 *
 */
public class LoginForm extends BaseForm {

	@NotEmpty
	@Email
	private String emailId;
	
	@NotEmpty
	private String password;

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


}
