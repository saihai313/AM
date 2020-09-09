package com.kh.am.member.model.vo;

public class Store {
	
	private int storeNo;
	private String storeName;
	private String storePhone;
	private String storeAddress;
	private int storeBizNo;
	private String storeBizCheck;
	private int memberNo;
	
	
	public Store() {
		super();
	}


	public Store(int storeNo, String storeName, String storePhone, String storeAddress, int storeBizNo,
			String storeBizCheck, int memberNo) {
		super();
		this.storeNo = storeNo;
		this.storeName = storeName;
		this.storePhone = storePhone;
		this.storeAddress = storeAddress;
		this.storeBizNo = storeBizNo;
		this.storeBizCheck = storeBizCheck;
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


	public int getStoreBizNo() {
		return storeBizNo;
	}


	public void setStoreBizNo(int storeBizNo) {
		this.storeBizNo = storeBizNo;
	}


	public String getStoreBizCheck() {
		return storeBizCheck;
	}


	public void setStoreBizCheck(String storeBizCheck) {
		this.storeBizCheck = storeBizCheck;
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
				+ ", storeAddress=" + storeAddress + ", storeBizNo=" + storeBizNo + ", storeBizCheck=" + storeBizCheck
				+ ", memberNo=" + memberNo + "]";
	}
	
}
