package com.kh.am.board.model.vo;

public class Employer {
   
    private int storeNo;
    private int employerNo;
    private String storeName;
    private String storePhone;
    private String storeAddress;
    private String businessNo;
    private char businessStatus;
    
    public Employer() {
    }

    public Employer(int storeNo, int employerNo, String storeName, String storePhone, String storeAddress,
            String businessNo, char businessStatus) {
        super();
        this.storeNo = storeNo;
        this.employerNo = employerNo;
        this.storeName = storeName;
        this.storePhone = storePhone;
        this.storeAddress = storeAddress;
        this.businessNo = businessNo;
        this.businessStatus = businessStatus;
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

    @Override
    public String toString() {
        return "Employer [storeNo=" + storeNo + ", employerNo=" + employerNo + ", storeName=" + storeName
                + ", storePhone=" + storePhone + ", storeAddress=" + storeAddress + ", businessNo=" + businessNo
                + ", businessStatus=" + businessStatus + "]";
    }
    
    
    
}
