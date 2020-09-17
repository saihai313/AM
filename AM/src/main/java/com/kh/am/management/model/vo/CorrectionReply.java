package com.kh.am.management.model.vo;

import java.sql.Date;

public class CorrectionReply {
	
	private int corrReNo;
	private String corrReContent;
	private Date corrReDate;
	private int corrNo;
	private int storeNo;
	
	public CorrectionReply() {
		// TODO Auto-generated constructor stub
	}

	public int getCorrReNo() {
		return corrReNo;
	}

	public void setCorrReNo(int corrReNo) {
		this.corrReNo = corrReNo;
	}

	public String getCorrReContent() {
		return corrReContent;
	}

	public void setCorrReContent(String corrReContent) {
		this.corrReContent = corrReContent;
	}

	public Date getCorrReDate() {
		return corrReDate;
	}

	public void setCorrReDate(Date corrReDate) {
		this.corrReDate = corrReDate;
	}

	public int getCorrNo() {
		return corrNo;
	}

	public void setCorrNo(int corrNo) {
		this.corrNo = corrNo;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	@Override
	public String toString() {
		return "CorrectionReply [corrReNo=" + corrReNo + ", corrReContent=" + corrReContent + ", corrReDate="
				+ corrReDate + ", corrNo=" + corrNo + ", storeNo=" + storeNo + "]";
	}
	
	
	

}
