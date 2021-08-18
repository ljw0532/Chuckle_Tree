package com.company.cktree.exception;

public class AlreadyExistingPhoneException extends RuntimeException {
	public AlreadyExistingPhoneException (String message) {
		super(message);
	}
}
