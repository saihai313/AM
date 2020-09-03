package com.kh.am.calendar.model.vo;

public class Employer {

	private int storeNo;
	private int employerNo;
	private int businessNo;
	private String storeName;
	private String storePhone;
	private String storeAddr;
	
	public Employer() {
		// TODO Auto-generated constructor stub
	}

	public Employer(int storeNo, int employerNo, int businessNo, String storeName, String storePhone,
			String storeAddr) {
		super();
		this.storeNo = storeNo;
		this.employerNo = employerNo;
		this.businessNo = businessNo;
		this.storeName = storeName;
		this.storePhone = storePhone;
		this.storeAddr = storeAddr;
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

	public int getBusinessNo() {
		return businessNo;
	}

	public void setBusinessNo(int businessNo) {
		this.businessNo = businessNo;
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

	public String getStoreAddr() {
		return storeAddr;
	}

	public void setStoreAddr(String storeAddr) {
		this.storeAddr = storeAddr;
	}

	@Override
	public String toString() {
		return "Employer [storeNo=" + storeNo + ", employerNo=" + employerNo + ", businessNo=" + businessNo
				+ ", storeName=" + storeName + ", storePhone=" + storePhone + ", storeAddr=" + storeAddr + "]";
	}
	
	
}
