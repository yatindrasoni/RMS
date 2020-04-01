package com.dhavisoft.rms.ctl;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

/**
 * Base Controller class of project. It contain (1) Generic operations (2) Generic constants (3) Generic work flow. 
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public abstract class BaseCtl {
	
	/**
	 * Operation constants
	 */
	protected static final String OP_SAVE = "Save";
	protected static final String OP_NEW = "New";
	protected static final String OP_DELETE = "Delete";
	protected static final String OP_CANCEL = "Cancel";
	protected static final String OP_ERROR = "Error";
	protected static final String OP_NEXT = "Next";
	protected static final String OP_PREVIOUS = "Previous";
	protected static final String OP_LOGOUT = "Logout";
	protected static final String OP_GO = "Go";
	protected static final String OP_GET = "Get";
	protected static final String OP_SEARCH = "Search";
	protected static final String OP_BACK = "Back";

	/**
	 * Loads preloaded data and stores in Model object.
	 * 
	 * @param model
	 */
	@ModelAttribute
	public void preload(Model model) {
		System.out.println("this is preload method");
	}
}
