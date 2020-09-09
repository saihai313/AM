package com.kh.am.calendar.model.vo;

public class Employee {

	private int employeeNo;
	private int storeNo;
	private int sal;
	
	public Employee() {
		// TODO Auto-generated constructor stub
	}

	public Employee(int employeeNo, int storeNo, int sal) {
		super();
		this.employeeNo = employeeNo;
		this.storeNo = storeNo;
		this.sal = sal;
	}

	public int getEmployeeNo() {
		return employeeNo;
	}

	public void setEmployeeNo(int employeeNo) {
		this.employeeNo = employeeNo;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	@Override
	public String toString() {
		return "Employee [employeeNo=" + employeeNo + ", storeNo=" + storeNo + ", sal=" + sal + "]";
	}
	
	
}
