package com.kh.am.calendar.model.vo;

public class Employee {

	private int memberNo;
	private int storeNo;
	private int employeeSal;
	
	public Employee() {
		// TODO Auto-generated constructor stub
	}

	public Employee(int memberNo, int storeNo, int employeeSal) {
		super();
		this.memberNo = memberNo;
		this.storeNo = storeNo;
		this.employeeSal = employeeSal;
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

	public int getEmployeeSal() {
		return employeeSal;
	}

	public void setEmployeeSal(int employeeSal) {
		this.employeeSal = employeeSal;
	}

	@Override
	public String toString() {
		return "Employee [memberNo=" + memberNo + ", storeNo=" + storeNo + ", employeeSal=" + employeeSal + "]";
	}

	
	
}
