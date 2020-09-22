package com.kh.am.board.model.vo;

public class CurrentSal {

	private int currentYear;
	private int currentMinSal;
	
	public CurrentSal() {
	}

	public CurrentSal(int currentYear, int currentMinSal) {
		super();
		this.currentYear = currentYear;
		this.currentMinSal = currentMinSal;
	}

	public int getCurrentYear() {
		return currentYear;
	}

	public void setCurrentYear(int currentYear) {
		this.currentYear = currentYear;
	}

	public int getCurrentMinSal() {
		return currentMinSal;
	}

	public void setCurrentMinSal(int currentMinSal) {
		this.currentMinSal = currentMinSal;
	}

	@Override
	public String toString() {
		return "CurrentSal [currentYear=" + currentYear + ", currentMinSal=" + currentMinSal + "]";
	}

	
	
}
