package com.kh.am_employee.pay.model.vo;

import java.sql.Date;

public class PayCorrRejection {
	
	private int corrRejectionNo;
	private String corrRejectionContent;
	private Date corrRejectionDate;
	private int correctionNo;
	private int storeNo;
	
	
	public PayCorrRejection() {
		super();
	}


	public PayCorrRejection(int corrRejectionNo, String corrRejectionContent, Date corrRejectionDate, int correctionNo,
			int storeNo) {
		super();
		this.corrRejectionNo = corrRejectionNo;
		this.corrRejectionContent = corrRejectionContent;
		this.corrRejectionDate = corrRejectionDate;
		this.correctionNo = correctionNo;
		this.storeNo = storeNo;
	}


	public int getCorrRejectionNo() {
		return corrRejectionNo;
	}


	public void setCorrRejectionNo(int corrRejectionNo) {
		this.corrRejectionNo = corrRejectionNo;
	}


	public String getCorrRejectionContent() {
		return corrRejectionContent;
	}


	public void setCorrRejectionContent(String corrRejectionContent) {
		this.corrRejectionContent = corrRejectionContent;
	}


	public Date getCorrRejectionDate() {
		return corrRejectionDate;
	}


	public void setCorrRejectionDate(Date corrRejectionDate) {
		this.corrRejectionDate = corrRejectionDate;
	}


	public int getCorrectionNo() {
		return correctionNo;
	}


	public void setCorrectionNo(int correctionNo) {
		this.correctionNo = correctionNo;
	}


	public int getStoreNo() {
		return storeNo;
	}


	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}


	@Override
	public String toString() {
		return "PayCorrRejection [corrRejectionNo=" + corrRejectionNo + ", corrRejectionContent=" + corrRejectionContent
				+ ", corrRejectionDate=" + corrRejectionDate + ", correctionNo=" + correctionNo + ", storeNo=" + storeNo
				+ "]";
	}
	
}
