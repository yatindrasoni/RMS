package com.dhavisoft.rms.exception;

/**
 * DatabaseException is propogated by DAO classes when an unhadled Database
 * exception occurred
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 */
public class DatabaseException extends Exception{
	
	/**
	 * @param msg
	 *            : Error message
	 */
	public DatabaseException(String msg) {
		super(msg);
	}

}
