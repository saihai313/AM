package com.kh.am.pay.model.vo;


public class Pay {
	
	private int payNo;		 // 급여번호
	private int payTotalNo;  // 총 급여
	private String payTime;  // 근무 시간
	private String payDay;   // 근무 일수
	private int partMoney;   // 시급
	private int vacaMoney;   // 주휴수당
	private int memberNo;    // 회원 번호(사장)
	private int storeNo;     // 가게 번호
	private String memberName; // 회원 이름
	
	public Pay() {
		// TODO Auto-generated constructor stub
	}


	public int getPayNo() {
		return payNo;
	}


	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}


	public int getPayTotalNo() {
		return payTotalNo;
	}


	public void setPayTotalNo(int payTotalNo) {
		this.payTotalNo = payTotalNo;
	}


	public String getPayTime() {
		return payTime;
	}


	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}


	public String getPayDay() {
		return payDay;
	}


	public void setPayDay(String payDay) {
		this.payDay = payDay;
	}


	public int getPartMoney() {
		return partMoney;
	}


	public void setPartMoney(int partMoney) {
		this.partMoney = partMoney;
	}


	public int getVacaMoney() {
		return vacaMoney;
	}


	public void setVacaMoney(int vacaMoney) {
		this.vacaMoney = vacaMoney;
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


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	@Override
	public String toString() {
		return "Pay [payNo=" + payNo + ", payTotalNo=" + payTotalNo + ", payTime=" + payTime + ", payDay=" + payDay
				+ ", partMoney=" + partMoney + ", vacaMoney=" + vacaMoney + ", memberNo=" + memberNo + ", storeNo="
				+ storeNo + ", memberName=" + memberName + "]";
	}
	
	
	
	
}
