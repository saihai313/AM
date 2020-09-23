package com.kh.am.personnel.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class EmployeeInfo {
	
	private int memberNo;
	private String memberEmail;
	private String memberName;
	private String memberPhone;
	private String memberStatus; 
	private int sal;
	private int storeNo;
	private Date memberEnrollDate;
	
	public EmployeeInfo() {
		// TODO Auto-generated constructor stub
	}
	
	
	public EmployeeInfo(int memberNo, String memberEmail, String memberName, String memberPhone, String memberStatus,
			int sal, int storeNo, Date memberEnrollDate) {
		super();
		this.memberNo = memberNo;
		this.memberEmail = memberEmail;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberStatus = memberStatus;
		this.sal = sal;
		this.storeNo = storeNo;
		this.memberEnrollDate = memberEnrollDate;
	}

	
	
	public Date getMemberEnrollDate() {
		return memberEnrollDate;
	}


	public void setMemberEnrollDate(Date memberEnrollDate) {
		this.memberEnrollDate = memberEnrollDate;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getMemberEmail() {
		return memberEmail;
	}


	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getMemberPhone() {
		return memberPhone;
	}


	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}


	public String getMemberStatus() {
		return memberStatus;
	}


	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}


	public int getSal() {
		return sal;
	}


	public void setSal(int sal) {
		this.sal = sal;
	}


	public int getStoreNo() {
		return storeNo;
	}


	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}


	@Override
	public String toString() {
		return "EmployeeInfo [memberNo=" + memberNo + ", memberEmail=" + memberEmail + ", memberName=" + memberName
				+ ", memberPhone=" + memberPhone + ", memberStatus=" + memberStatus + ", sal=" + sal
				+ ", storeNo=" + storeNo + ", memberEnrollDate=" + memberEnrollDate + "]";
	}
	
	
}
