package com.kh.am.calendar.model.vo;

import java.sql.Date;

public class UpdateWorkCalendar {

	
	private int workNo;
	private Date workDay;
	private int beforeStart;
	private int workStart;
	private int beforeEnd;
	private int workEnd;
	private int storeNo;
	private int beforeMemberNo;
	private int memberNo;
	
	public UpdateWorkCalendar() {
		// TODO Auto-generated constructor stub
	}


	
	public int getBeforeMemberNo() {
		return beforeMemberNo;
	}



	public void setBeforeMemberNo(int beforeMemberNo) {
		this.beforeMemberNo = beforeMemberNo;
	}



	public UpdateWorkCalendar(int workNo, Date workDay, int beforeStart, int workStart, int beforeEnd, int workEnd,
			int storeNo, int beforeMemberNo, int memberNo) {
		super();
		this.workNo = workNo;
		this.workDay = workDay;
		this.beforeStart = beforeStart;
		this.workStart = workStart;
		this.beforeEnd = beforeEnd;
		this.workEnd = workEnd;
		this.storeNo = storeNo;
		this.beforeMemberNo = beforeMemberNo;
		this.memberNo = memberNo;
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

	public int getBeforeStart() {
		return beforeStart;
	}

	public void setBeforeStart(int beforeStart) {
		this.beforeStart = beforeStart;
	}

	public int getWorkStart() {
		return workStart;
	}

	public void setWorkStart(int workStart) {
		this.workStart = workStart;
	}

	public int getBeforeEnd() {
		return beforeEnd;
	}

	public void setBeforeEnd(int beforeEnd) {
		this.beforeEnd = beforeEnd;
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



	@Override
	public String toString() {
		return "UpdateWorkCalendar [workNo=" + workNo + ", workDay=" + workDay + ", beforeStart=" + beforeStart
				+ ", workStart=" + workStart + ", beforeEnd=" + beforeEnd + ", workEnd=" + workEnd + ", storeNo="
				+ storeNo + ", beforeMemberNo=" + beforeMemberNo + ", memberNo=" + memberNo + "]";
	}

	
	
	
	
}
