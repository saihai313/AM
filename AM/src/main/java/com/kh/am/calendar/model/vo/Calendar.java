package com.kh.am.calendar.model.vo;

import java.sql.Date;

public class Calendar {
	
	private int workingNo;
	private int eStoreNo;
	private int employeeNo;
	private Date workingDay;
	private int startTime;
	private int endTime;
	private String memberName;
	
	public Calendar() {
		// TODO Auto-generated constructor stub
	}

	public Calendar(int workingNo, int eStoreNo, int employeeNo, Date workingDay, int startTime, int endTime,
			String memberName) {
		super();
		this.workingNo = workingNo;
		this.eStoreNo = eStoreNo;
		this.employeeNo = employeeNo;
		this.workingDay = workingDay;
		this.startTime = startTime;
		this.endTime = endTime;
		this.memberName = memberName;
	}

	public int getWorkingNo() {
		return workingNo;
	}

	public void setWorkingNo(int workingNo) {
		this.workingNo = workingNo;
	}

	public int geteStoreNo() {
		return eStoreNo;
	}

	public void seteStoreNo(int eStoreNo) {
		this.eStoreNo = eStoreNo;
	}

	public int getEmployeeNo() {
		return employeeNo;
	}

	public void setEmployeeNo(int employeeNo) {
		this.employeeNo = employeeNo;
	}

	public Date getWorkingDay() {
		return workingDay;
	}

	public void setWorkingDay(Date workingDay) {
		this.workingDay = workingDay;
	}

	public int getStartTime() {
		return startTime;
	}

	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}

	public int getEndTime() {
		return endTime;
	}

	public void setEndTime(int endTime) {
		this.endTime = endTime;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "Calendar [workingNo=" + workingNo + ", eStoreNo=" + eStoreNo + ", employeeNo=" + employeeNo
				+ ", workingDay=" + workingDay + ", startTime=" + startTime + ", endTime=" + endTime + ", memberName="
				+ memberName + "]";
	}

	


}
