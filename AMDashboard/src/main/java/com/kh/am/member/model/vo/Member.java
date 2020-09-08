package com.kh.am.member.model.vo;

import java.sql.Date;

public class Member {
    private int memberNo;
    private String memberEmail;
    private String memberPwd;
    private String memberName;
    private String memberPhone;
    private String memberAddr;
    private Date memberEnrollDate;
    private String memberStatus;
    private String memberGrade;
    private String memberCheck;
    
    public Member() {
    }

    public Member(int memberNo, String memberEmail, String memberPwd, String memberName, String memberPhone,
            String memberAddr, Date memberEnrollDate, String memberStatus, String memberGrade, String memberCheck) {
        super();
        this.memberNo = memberNo;
        this.memberEmail = memberEmail;
        this.memberPwd = memberPwd;
        this.memberName = memberName;
        this.memberPhone = memberPhone;
        this.memberAddr = memberAddr;
        this.memberEnrollDate = memberEnrollDate;
        this.memberStatus = memberStatus;
        this.memberGrade = memberGrade;
        this.memberCheck = memberCheck;
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

    public String getMemberAddr() {
        return memberAddr;
    }

    public void setMemberAddr(String memberAddr) {
        this.memberAddr = memberAddr;
    }

    public Date getMemberEnrollDate() {
        return memberEnrollDate;
    }

    public void setMemberEnrollDate(Date memberEnrollDate) {
        this.memberEnrollDate = memberEnrollDate;
    }

    public String getMemberStatus() {
        return memberStatus;
    }

    public void setMemberStatus(String memberStatus) {
        this.memberStatus = memberStatus;
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

    @Override
    public String toString() {
        return "Member [memberNo=" + memberNo + ", memberEmail=" + memberEmail + ", memberPwd=" + memberPwd
                + ", memberName=" + memberName + ", memberPhone=" + memberPhone + ", memberAddr=" + memberAddr
                + ", memberEnrollDate=" + memberEnrollDate + ", memberStatus=" + memberStatus + ", memberGrade="
                + memberGrade + ", memberCheck=" + memberCheck + "]";
    }

     
    
}
