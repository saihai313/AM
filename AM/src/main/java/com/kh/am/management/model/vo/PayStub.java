package com.kh.am.management.model.vo;

import java.sql.Timestamp;

public class PayStub {
	
	private int paystubNo;
	private String payContent;
	private String payStatus;
	private String payTitle;
	private Timestamp payDate;
	private String payEmployer;
	private int payNo;
	private String payCheck;
	
	public PayStub() {
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

	@Override
	public String toString() {
		return "PayStub [paystubNo=" + paystubNo + ", payContent=" + payContent + ", payStatus=" + payStatus
				+ ", payTitle=" + payTitle + ", payDate=" + payDate + ", payEmployer=" + payEmployer + ", payNo="
				+ payNo + ", payCheck=" + payCheck + "]";
	}
	
	

}
