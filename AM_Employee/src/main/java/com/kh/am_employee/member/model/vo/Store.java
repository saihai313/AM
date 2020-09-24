package com.kh.am_employee.member.model.vo;

public class Store {
	
	private int storeNo;
	private String storeName;
	private String storePhone;
	private String storeAddress;
	private int memberNo;
	
	
	public Store() {
		super();
	}


	public Store(int storeNo, String storeName, String storePhone, String storeAddress, int memberNo) {
		super();
		this.storeNo = storeNo;
		this.storeName = storeName;
		this.storePhone = storePhone;
		this.storeAddress = storeAddress;
		this.memberNo = memberNo;
	}

	
	

	public int getStoreNo() {
		return storeNo;
	}


	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
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


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	@Override
	public String toString() {
		return "Store [storeNo=" + storeNo + ", storeName=" + storeName + ", storePhone=" + storePhone
				+ ", storeAddress=" + storeAddress + ", memberNo=" + memberNo + "]";
	}

	
	
}
