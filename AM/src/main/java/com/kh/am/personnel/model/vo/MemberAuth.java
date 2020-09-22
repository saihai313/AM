package com.kh.am.personnel.model.vo;

import java.util.Random;

public class MemberAuth {
	
	private String employeeEmail;
	private int storeNo;
	private String authKey;
	private String authCheck;
	
	public MemberAuth() {
		// TODO Auto-generated constructor stub
	}

	public MemberAuth(String employeeEmail, int storeNo, String authKey, String authCheck) {
		super();
		this.employeeEmail = employeeEmail;
		this.storeNo = storeNo;
		this.authKey = authKey;
		this.authCheck = authCheck;
	}
	
	
	public String getEmployeeEmail() {
		return employeeEmail;
	}

	public void setEmployeeEmail(String employeeEmail) {
		this.employeeEmail = employeeEmail;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getAuthKey() {
		return authKey;
	}

	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}

	public String getAuthCheck() {
		return authCheck;
	}

	public void setAuthCheck(String authCheck) {
		this.authCheck = authCheck;
	}

	@Override
	public String toString() {
		return "MemberAuth [employeeEmail=" + employeeEmail + ", storeNo=" + storeNo + ", authKey=" + authKey
				+ ", authCheck=" + authCheck + "]";
	}
	

    

	
	
}