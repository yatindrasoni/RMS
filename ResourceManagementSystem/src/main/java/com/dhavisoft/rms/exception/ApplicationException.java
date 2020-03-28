package com.dhavisoft.rms.exception;

/**
 * ApplicationException is propogated from Service classes when business
 * logic exception occurered
 * 
 * @author soni
 * @version 1.0
 *@Copyright (c) Dhavisoft
 */
public class ApplicationException extends Exception{
	
	/**
	 * @param msg
	 *            : Error message
	 */
	
	private static final long serialVersionUID = 1L;
	
	public ApplicationException (String msg) {
		super(msg);
	}

}
