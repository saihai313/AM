package com.kh.am_employee.pay.model.vo;

import java.sql.Date;

public class PayWork {
	
	private int workNo;
	private Date workDay;
	private int workStart;
	private int workEnd;
	
	public PayWork() {
		super();
	}

	public PayWork(int workNo, Date workDay, int workStart, int workEnd) {
		super();
		this.workNo = workNo;
		this.workDay = workDay;
		this.workStart = workStart;
		this.workEnd = workEnd;
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

	@Override
	public String toString() {
		return "PayWork [workNo=" + workNo + ", workDay=" + workDay + ", workStart=" + workStart + ", workEnd="
				+ workEnd + "]";
	}


	
	
	
}
