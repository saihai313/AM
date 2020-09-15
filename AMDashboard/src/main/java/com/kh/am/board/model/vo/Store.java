package com.kh.am.board.model.vo;

import java.sql.Date;

public class Store {
   
    private int storeNo;
    private int employerNo;
    private String storeName;
    private String storePhone;
    private String storeAddress;
    private String businessNo;
    private char businessStatus;
    private String memberName;
    private String memberEmail;
    private Date memberEnrollDate;
    private String memberStatus;

    public Store() {
}

    public Store(int storeNo, int employerNo, String storeName, String storePhone, String storeAddress,
            String businessNo, char businessStatus, String memberName, String memberEmail, Date memberEnrollDate,
            String memberStatus) {
        super();
        this.storeNo = storeNo;
        this.employerNo = employerNo;
        this.storeName = storeName;
        this.storePhone = storePhone;
        this.storeAddress = storeAddress;
        this.businessNo = businessNo;
        this.businessStatus = businessStatus;
        this.memberName = memberName;
        this.memberEmail = memberEmail;
        this.memberEnrollDate = memberEnrollDate;
        this.memberStatus = memberStatus;
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

    public String getBusinessNo() {
        return businessNo;
    }

    public void setBusinessNo(String businessNo) {
        this.businessNo = businessNo;
    }

    public char getBusinessStatus() {
        return businessStatus;
    }

    public void setBusinessStatus(char businessStatus) {
        this.businessStatus = businessStatus;
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

    @Override
    public String toString() {
        return "Store [storeNo=" + storeNo + ", employerNo=" + employerNo + ", storeName=" + storeName + ", storePhone="
                + storePhone + ", storeAddress=" + storeAddress + ", businessNo=" + businessNo + ", businessStatus="
                + businessStatus + ", memberName=" + memberName + ", memberEmail=" + memberEmail + ", memberEnrollDate="
                + memberEnrollDate + ", memberStatus=" + memberStatus + "]";
    }    

    
    
}
