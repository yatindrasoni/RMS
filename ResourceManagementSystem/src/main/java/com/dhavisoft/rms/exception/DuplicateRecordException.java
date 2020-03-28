package com.dhavisoft.rms.exception;

/**
 * DuplicateRecordException thrown when a duplicate record occurred
 *
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public class DuplicateRecordException extends Exception {

	/**
	 * @param msg
	 *            error message
	 */
	public DuplicateRecordException(String msg) {
		super(msg);
	}

}