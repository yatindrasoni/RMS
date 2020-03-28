package com.dhavisoft.rms.dto;

/**
 * DropdownList interface is implemented by DTOs those are used to create drop
 * down list on HTML pages
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 * 
 */

public interface DropdownList {

	/**
	 * Returns key of list element
	 * 
	 * @return key
	 */
	public String getKey();

	/**
	 * Returns display text of list element
	 * 
	 * @return value
	 */
	public String getValue();

}
