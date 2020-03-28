package com.dhavisoft.rms.form;

import org.hibernate.validator.constraints.NotEmpty;


/**
 * Contains ChangePassword form element and their declarative input validations.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 *
 */
public class ChangePasswordForm extends BaseForm {

	@NotEmpty
	private String oldPassword;

	@NotEmpty
	private String newPassword;

	@NotEmpty
	private String confirmPassword;

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

}
