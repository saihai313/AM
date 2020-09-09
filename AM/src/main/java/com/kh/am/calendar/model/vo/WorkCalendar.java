package com.kh.am.calendar.model.vo;

import java.sql.Date;

public class WorkCalendar {
	
	private int workNo;
	private Date workDay;
	private int workStart;
	private int workEnd;
	private int storeNo;
	private int memberNo;
	private String memberName;
	
	public WorkCalendar() {
		// TODO Auto-generated constructor stub
	}

	public WorkCalendar(int workNo, Date workDay, int workStart, int workEnd, int storeNo, int memberNo,
			String memberName) {
		super();
		this.workNo = workNo;
		this.workDay = workDay;
		this.workStart = workStart;
		this.workEnd = workEnd;
		this.storeNo = storeNo;
		this.memberNo = memberNo;
		this.memberName = memberName;
	}

	public int getWorkNo() {
		return workNo;
	}

	public void setWorkNo(int workNo) {
		this.workNo = workNo;
	}

	public Date getWorkDay() {
		return workDay;
	}

	public void setWorkDay(Date workDay) {
		this.workDay = workDay;
	}

	public int getWorkStart() {
		return workStart;
	}

	public void setWorkStart(int workStart) {
		this.workStart = workStart;
	}

	public int getWorkEnd() {
		return workEnd;
	}

	public void setWorkEnd(int workEnd) {
		this.workEnd = workEnd;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "WorkCalendar [workNo=" + workNo + ", workDay=" + workDay + ", workStart=" + workStart + ", workEnd="
				+ workEnd + ", storeNo=" + storeNo + ", memberNo=" + memberNo + ", memberName=" + memberName + "]";
	}

	
	
}
