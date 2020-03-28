package com.dhavisoft.rms.exception;

/**
 * RecordNotFoundException thrown when a record not found occurred
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 * 
 */
public class RecordNotFoundException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public RecordNotFoundException(String msg) {
		super(msg);

	}
}
