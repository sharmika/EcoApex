package com.apex.model;

/**
 * User Pojo for obtaining login credentials.
 * 
 * @author Mahesh
 * @version 1.0
 * 
 */
public class User {
	/* userName field */
	private String userName;
	/* Password field */
	private String password;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
