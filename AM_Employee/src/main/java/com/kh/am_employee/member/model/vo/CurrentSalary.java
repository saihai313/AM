package com.kh.am_employee.member.model.vo;

public class CurrentSalary {
	
	private int CurrentYear;
	private int CurrentMinSalary;
	
	
	public CurrentSalary() {
		super();
	}


	public CurrentSalary(int currentYear, int currentMinSalary) {
		super();
		CurrentYear = currentYear;
		CurrentMinSalary = currentMinSalary;
	}


	public int getCurrentYear() {
		return CurrentYear;
	}


	public void setCurrentYear(int currentYear) {
		CurrentYear = currentYear;
	}


	public int getCurrentMinSalary() {
		return CurrentMinSalary;
	}


	public void setCurrentMinSalary(int currentMinSalary) {
		CurrentMinSalary = currentMinSalary;
	}


	@Override
	public String toString() {
		return "CurrentSalary [CurrentYear=" + CurrentYear + ", CurrentMinSalary=" + CurrentMinSalary + "]";
	}
	

}
