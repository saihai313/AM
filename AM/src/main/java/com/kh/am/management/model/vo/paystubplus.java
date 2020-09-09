package com.kh.am.management.model.vo;

import java.sql.Timestamp;

public class paystubplus {
	private int paystubNo;
	private String payContent;
	private String payStatus;
	private String payTitle;
	private Timestamp payDate;
	private String payEmployer;
	private int payNo;
	private String payCheck;
	
	
	private int payNO;
	private int payTotalMoney;
	private String patTime;
	private String payDay;
	private int partMoney;
	private int vacaMoney;
	private int memberNo;
	private int storeNo;
	
	
	public paystubplus() {
		// TODO Auto-generated constructor stub
	}


	public int getPaystubNo() {
		return paystubNo;
	}


	public void setPaystubNo(int paystubNo) {
		this.paystubNo = paystubNo;
	}


	public String getPayContent() {
		return payContent;
	}


	public void setPayContent(String payContent) {
		this.payContent = payContent;
	}


	public String getPayStatus() {
		return payStatus;
	}


	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}


	public String getPayTitle() {
		return payTitle;
	}


	public void setPayTitle(String payTitle) {
		this.payTitle = payTitle;
	}


	public Timestamp getPayDate() {
		return payDate;
	}


	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}


	public String getPayEmployer() {
		return payEmployer;
	}


	public void setPayEmployer(String payEmployer) {
		this.payEmployer = payEmployer;
	}


	public int getPayNo() {
		return payNo;
	}


	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}


	public String getPayCheck() {
		return payCheck;
	}


	public void setPayCheck(String payCheck) {
		this.payCheck = payCheck;
	}


	public int getPayNO() {
		return payNO;
	}


	public void setPayNO(int payNO) {
		this.payNO = payNO;
	}


	public int getPayTotalMoney() {
		return payTotalMoney;
	}


	public void setPayTotalMoney(int payTotalMoney) {
		this.payTotalMoney = payTotalMoney;
	}


	public String getPatTime() {
		return patTime;
	}


	public void setPatTime(String patTime) {
		this.patTime = patTime;
	}


	public String getPayDay() {
		return payDay;
	}


	public void setPayDay(String payDay) {
		this.payDay = payDay;
	}


	public int getPartMoney() {
		return partMoney;
	}


	public void setPartMoney(int partMoney) {
		this.partMoney = partMoney;
	}


	public int getVacaMoney() {
		return vacaMoney;
	}


	public void setVacaMoney(int vacaMoney) {
		this.vacaMoney = vacaMoney;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public int getStoreNo() {
		return storeNo;
	}


	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}


	@Override
	public String toString() {
		return "paystubplus [paystubNo=" + paystubNo + ", payContent=" + payContent + ", payStatus=" + payStatus
				+ ", payTitle=" + payTitle + ", payDate=" + payDate + ", payEmployer=" + payEmployer + ", payNo="
				+ payNo + ", payCheck=" + payCheck + ", payNO=" + payNO + ", payTotalMoney=" + payTotalMoney
				+ ", patTime=" + patTime + ", payDay=" + payDay + ", partMoney=" + partMoney + ", vacaMoney="
				+ vacaMoney + ", memberNo=" + memberNo + ", storeNo=" + storeNo + "]";
	}
	
	
	
}
