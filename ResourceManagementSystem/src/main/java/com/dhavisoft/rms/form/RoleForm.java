package com.dhavisoft.rms.form;

import java.sql.Timestamp;
import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.dhavisoft.rms.dto.BaseDTO;
import com.dhavisoft.rms.dto.RoleDTO;
import com.dhavisoft.rms.util.Util;

/**
 * Contains Role form element and their declaractive input validations.
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 *
 */
public class RoleForm extends BaseForm {
 
	/* @Pattern(regexp = "[a-zA-Z][a-zA-Z]+") */
	/* @NotEmpty */
	private String roleName;

	/* @NotEmpty */
	private String roleDescription;

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDescription() {
		return roleDescription;
	}

	public void setRoleDescription(String roleDescription) {
		this.roleDescription = roleDescription;
	}

	@Override
	public BaseDTO getDto() {

		RoleDTO dto = new RoleDTO();
		dto.setId(id);
		dto.setName(roleName);
		dto.setDescription(roleDescription);
		dto.setCreatedBy(createdBy);
		dto.setModifiedBy(modifiedBy);
		dto.setCreatedDatetime(new Timestamp(new Date().getTime()));
		dto.setModifiedDatetime(new Timestamp(new Date().getTime()));

		return dto;
	}

	@Override
	public void populate(BaseDTO bDto) {

		if (bDto == null) {
			return;
		}

		RoleDTO dto = (RoleDTO) bDto;

		id = dto.getId();
		roleName = Util.getCapital(dto.getName());
		roleDescription = Util.getCapital(dto.getDescription());
		createdBy = dto.getCreatedBy();
		modifiedBy = dto.getModifiedBy();
		createdDatetime = dto.getCreatedDatetime().getTime();
		modifiedDatetime = dto.getModifiedDatetime().getTime();

		super.populate(bDto);
	}
}
