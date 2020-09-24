package com.kh.am_employee.member.model.vo;

import java.sql.Date;

public class Member {

	
	private int memberNo;
	private String memberEmail;
	private String memberPwd;
	private String memberName;
	private String memberPhone;
	private Date memberEnrollDate;
	private String memberGrade;
	private String memberCheck;
	private String memberStatus;
	
	public Member() {
	}

	public Member(int memberNo, String memberEmail, String memberPwd, String memberName, String memberPhone,
			Date memberEnrollDate, String memberGrade, String memberCheck, String memberStatus) {
		super();
		this.memberNo = memberNo;
		this.memberEmail = memberEmail;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberEnrollDate = memberEnrollDate;
		this.memberGrade = memberGrade;
		this.memberCheck = memberCheck;
		this.memberStatus = memberStatus;
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

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
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

	public Date getMemberEnrollDate() {
		return memberEnrollDate;
	}

	public void setMemberEnrollDate(Date memberEnrollDate) {
		this.memberEnrollDate = memberEnrollDate;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public String getMemberCheck() {
		return memberCheck;
	}

	public void setMemberCheck(String memberCheck) {
		this.memberCheck = memberCheck;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberEmail=" + memberEmail + ", memberPwd=" + memberPwd
				+ ", memberName=" + memberName + ", memberPhone=" + memberPhone + ", memberEnrollDate="
				+ memberEnrollDate + ", memberGrade=" + memberGrade + ", memberCheck=" + memberCheck + ", memberStatus="
				+ memberStatus + "]";
	}

	
}
