package com.kh.am_employee.member.model.vo;

public class MemberAuth {
	
	private String authEmail;
	private int storeNo;
	private String authKey;
	private String authCheck;
	
	
	public MemberAuth() {
		super();
	}


	public MemberAuth(String authEmail, int storeNo, String authKey, String authCheck) {
		super();
		this.authEmail = authEmail;
		this.storeNo = storeNo;
		this.authKey = authKey;
		this.authCheck = authCheck;
	}


	public String getAuthEmail() {
		return authEmail;
	}


	public void setAuthEmail(String authEmail) {
		this.authEmail = authEmail;
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
		return "MemberAuth [authEmail=" + authEmail + ", storeNo=" + storeNo + ", authKey=" + authKey + ", authCheck="
				+ authCheck + "]";
	}


}
