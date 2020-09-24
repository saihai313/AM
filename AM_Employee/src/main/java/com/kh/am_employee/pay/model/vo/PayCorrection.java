package com.kh.am_employee.pay.model.vo;

import java.sql.Date;

public class PayCorrection {
	
	private int tempNo;
	
	private int correctionNo;
	private String correctionContent;
	private Date correctionCreateDate;
	private Date correctionModifyDate;
	private String correctionStatus;
	private String correctionResult;
	private String correctionSubmit;
	private int memberNo;
	private int storeNo;
	private int payNo;
	
	private Date corrRejectionDate;
	
	
	public PayCorrection() {
		super();
	}


	public PayCorrection(int tempNo, int correctionNo, String correctionContent, Date correctionCreateDate,
			Date correctionModifyDate, String correctionStatus, String correctionResult, String correctionSubmit,
			int memberNo, int storeNo, int payNo, Date corrRejectionDate) {
		super();
		this.tempNo = tempNo;
		this.correctionNo = correctionNo;
		this.correctionContent = correctionContent;
		this.correctionCreateDate = correctionCreateDate;
		this.correctionModifyDate = correctionModifyDate;
		this.correctionStatus = correctionStatus;
		this.correctionResult = correctionResult;
		this.correctionSubmit = correctionSubmit;
		this.memberNo = memberNo;
		this.storeNo = storeNo;
		this.payNo = payNo;
		this.corrRejectionDate = corrRejectionDate;
	}


	public PayCorrection(String correctionContent, int memberNo, int storeNo, int payNo) {
		super();
		this.correctionContent = correctionContent;
		this.memberNo = memberNo;
		this.storeNo = storeNo;
		this.payNo = payNo;
	}

	
	

	public PayCorrection(int correctionNo, String correctionContent) {
		super();
		this.correctionNo = correctionNo;
		this.correctionContent = correctionContent;
	}


	public int getTempNo() {
		return tempNo;
	}


	public void setTempNo(int tempNo) {
		this.tempNo = tempNo;
	}


	public int getCorrectionNo() {
		return correctionNo;
	}


	public void setCorrectionNo(int correctionNo) {
		this.correctionNo = correctionNo;
	}


	public String getCorrectionContent() {
		return correctionContent;
	}


	public void setCorrectionContent(String correctionContent) {
		this.correctionContent = correctionContent;
	}


	public Date getCorrectionCreateDate() {
		return correctionCreateDate;
	}


	public void setCorrectionCreateDate(Date correctionCreateDate) {
		this.correctionCreateDate = correctionCreateDate;
	}


	public Date getCorrectionModifyDate() {
		return correctionModifyDate;
	}


	public void setCorrectionModifyDate(Date correctionModifyDate) {
		this.correctionModifyDate = correctionModifyDate;
	}


	public String getCorrectionStatus() {
		return correctionStatus;
	}


	public void setCorrectionStatus(String correctionStatus) {
		this.correctionStatus = correctionStatus;
	}


	public String getCorrectionResult() {
		return correctionResult;
	}


	public void setCorrectionResult(String correctionResult) {
		this.correctionResult = correctionResult;
	}


	public String getCorrectionSubmit() {
		return correctionSubmit;
	}


	public void setCorrectionSubmit(String correctionSubmit) {
		this.correctionSubmit = correctionSubmit;
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


	public int getPayNo() {
		return payNo;
	}


	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}


	public Date getCorrRejectionDate() {
		return corrRejectionDate;
	}


	public void setCorrRejectionDate(Date corrRejectionDate) {
		this.corrRejectionDate = corrRejectionDate;
	}


	@Override
	public String toString() {
		return "PayCorrection [tempNo=" + tempNo + ", correctionNo=" + correctionNo + ", correctionContent="
				+ correctionContent + ", correctionCreateDate=" + correctionCreateDate + ", correctionModifyDate="
				+ correctionModifyDate + ", correctionStatus=" + correctionStatus + ", correctionResult="
				+ correctionResult + ", correctionSubmit=" + correctionSubmit + ", memberNo=" + memberNo + ", storeNo="
				+ storeNo + ", payNo=" + payNo + ", corrRejectionDate=" + corrRejectionDate + "]";
	}



	
}
