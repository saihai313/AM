package com.kh.am.calendar.model.vo;

public class PartTime {

	private int partNo;
	private String partName;
	private int partStart;
	private int partEnd;
	private int storeNo;
	
	public PartTime() {
		// TODO Auto-generated constructor stub
	}

	public PartTime(int partNo, String partName, int partStart, int partEnd, int storeNo) {
		super();
		this.partNo = partNo;
		this.partName = partName;
		this.partStart = partStart;
		this.partEnd = partEnd;
		this.storeNo = storeNo;
	}

	public int getPartNo() {
		return partNo;
	}

	public void setPartNo(int partNo) {
		this.partNo = partNo;
	}

	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}

	public int getPartStart() {
		return partStart;
	}

	public void setPartStart(int partStart) {
		this.partStart = partStart;
	}

	public int getPartEnd() {
		return partEnd;
	}

	public void setPartEnd(int partEnd) {
		this.partEnd = partEnd;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	@Override
	public String toString() {
		return "PartTime [partNo=" + partNo + ", partName=" + partName + ", partStart=" + partStart + ", partEnd="
				+ partEnd + ", storeNo=" + storeNo + "]";
	}
	
	
	
}
