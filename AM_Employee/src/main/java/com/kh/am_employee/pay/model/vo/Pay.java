package com.kh.am_employee.pay.model.vo;

import java.sql.Date;

public class Pay {
	
	private int payNo;
	private int payTime;
	private int payDay;
	private int payExtra;
	private int paySalary;
	private Date payCreateDate;
	private String payStatus;
	private int memberNo;
	private int storeNo;
	
	private int paystubNo;
	private String check;
	
	
	public Pay() {
		super();
	}


	public Pay(int payNo, int payTime, int payDay, int payExtra, int paySalary, Date payCreateDate, String payStatus,
			int memberNo, int storeNo, int paystubNo, String check) {
		super();
		this.payNo = payNo;
		this.payTime = payTime;
		this.payDay = payDay;
		this.payExtra = payExtra;
		this.paySalary = paySalary;
		this.payCreateDate = payCreateDate;
		this.payStatus = payStatus;
		this.memberNo = memberNo;
		this.storeNo = storeNo;
		this.paystubNo = paystubNo;
		this.check = check;
	}


	public int getPayNo() {
		return payNo;
	}


	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}


	public int getPayTime() {
		return payTime;
	}


	public void setPayTime(int payTime) {
		this.payTime = payTime;
	}


	public int getPayDay() {
		return payDay;
	}


	public void setPayDay(int payDay) {
		this.payDay = payDay;
	}


	public int getPayExtra() {
		return payExtra;
	}


	public void setPayExtra(int payExtra) {
		this.payExtra = payExtra;
	}


	public int getPaySalary() {
		return paySalary;
	}


	public void setPaySalary(int paySalary) {
		this.paySalary = paySalary;
	}


	public Date getPayCreateDate() {
		return payCreateDate;
	}


	public void setPayCreateDate(Date payCreateDate) {
		this.payCreateDate = payCreateDate;
	}


	public String getPayStatus() {
		return payStatus;
	}


	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
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


	public int getPaystubNo() {
		return paystubNo;
	}


	public void setPaystubNo(int paystubNo) {
		this.paystubNo = paystubNo;
	}


	public String getCheck() {
		return check;
	}


	public void setCheck(String check) {
		this.check = check;
	}


	@Override
	public String toString() {
		return "Pay [payNo=" + payNo + ", payTime=" + payTime + ", payDay=" + payDay + ", payExtra=" + payExtra
				+ ", paySalary=" + paySalary + ", payCreateDate=" + payCreateDate + ", payStatus=" + payStatus
				+ ", memberNo=" + memberNo + ", storeNo=" + storeNo + ", paystubNo=" + paystubNo + ", check=" + check
				+ "]";
	}

}
