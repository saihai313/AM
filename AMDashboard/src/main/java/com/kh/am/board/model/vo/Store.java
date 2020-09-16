package com.kh.am.board.model.vo;

import java.sql.Date;

public class Store {
   
    private int storeNo;
    private int employerNo;
    private String storeName;
    private String storePhone;
    private String storeAddress;
    private String storeBizNo;
    private char storeBizCheck;
    private String memberName;
    private String memberEmail;
    private Date memberEnrollDate;
    private String memberStatus;
    private String memberPhone;

    public Store() {
}

    public Store(int storeNo, int employerNo, String storeName, String storePhone, String storeAddress,
            String storeBizNo, char storeBizCheck, String memberName, String memberEmail, Date memberEnrollDate,
            String memberStatus, String memberPhone) {
        super();
        this.storeNo = storeNo;
        this.employerNo = employerNo;
        this.storeName = storeName;
        this.storePhone = storePhone;
        this.storeAddress = storeAddress;
        this.storeBizNo = storeBizNo;
        this.storeBizCheck = storeBizCheck;
        this.memberName = memberName;
        this.memberEmail = memberEmail;
        this.memberEnrollDate = memberEnrollDate;
        this.memberStatus = memberStatus;
        this.memberPhone = memberPhone;
    }

    public int getStoreNo() {
        return storeNo;
    }

    public void setStoreNo(int storeNo) {
        this.storeNo = storeNo;
    }

    public int getEmployerNo() {
        return employerNo;
    }

    public void setEmployerNo(int employerNo) {
        this.employerNo = employerNo;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getStorePhone() {
        return storePhone;
    }

    public void setStorePhone(String storePhone) {
        this.storePhone = storePhone;
    }

    public String getStoreAddress() {
        return storeAddress;
    }

    public void setStoreAddress(String storeAddress) {
        this.storeAddress = storeAddress;
    }

    public String getStoreBizNo() {
        return storeBizNo;
    }

    public void setStoreBizNo(String storeBizNo) {
        this.storeBizNo = storeBizNo;
    }

    public char getStoreBizCheck() {
        return storeBizCheck;
    }

    public void setStoreBizCheck(char storeBizCheck) {
        this.storeBizCheck = storeBizCheck;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getMemberEmail() {
        return memberEmail;
    }

    public void setMemberEmail(String memberEmail) {
        this.memberEmail = memberEmail;
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

    public String getMemberPhone() {
        return memberPhone;
    }

    public void setMemberPhone(String memberPhone) {
        this.memberPhone = memberPhone;
    }

    @Override
    public String toString() {
        return "Store [storeNo=" + storeNo + ", employerNo=" + employerNo + ", storeName=" + storeName + ", storePhone="
                + storePhone + ", storeAddress=" + storeAddress + ", storeBizNo=" + storeBizNo + ", storeBizCheck="
                + storeBizCheck + ", memberName=" + memberName + ", memberEmail=" + memberEmail + ", memberEnrollDate="
                + memberEnrollDate + ", memberStatus=" + memberStatus + ", memberPhone=" + memberPhone + "]";
    }

  
    
}
