package com.kh.am.pay.model.vo;

import java.sql.Date;

public class Pay {
	
	private int payNo; 			// 급여 번호
	private int payTime;		// 총 근무시간
	private int payDay;			// 총 근무일
	private int payExtra;		// 주휴수당
	private int paySal;			// 총 급여
	private int payPayment;		// 급여 지급일
	private Date payCreateDate; // 급여명세서 작성일
	private String payStatus;	// 급여 상태
	private int memberNo;		// 알바생 회원 번호
	private int storeNo;		// 가게 번호
	private String memberName;
	
	public Pay() {
		// TODO Auto-generated constructor stub
	}
	
	

	public String getMemberName() {
		return memberName;
	}



	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}



	public int getPayNo() {
		return payNo;
	}



	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}



	public int getPayTime() {
		return payTime;
	}



	public void setPayTime(int payTime) {
		this.payTime = payTime;
	}



	public int getPayDay() {
		return payDay;
	}



	public void setPayDay(int payDay) {
		this.payDay = payDay;
	}



	public int getPayExtra() {
		return payExtra;
	}



	public void setPayExtra(int payExtra) {
		this.payExtra = payExtra;
	}



	public int getPaySal() {
		return paySal;
	}



	public void setPaySal(int paySal) {
		this.paySal = paySal;
	}



	public int getPayPayment() {
		return payPayment;
	}



	public void setPayPayment(int payPayment) {
		this.payPayment = payPayment;
	}



	public Date getPayCreateDate() {
		return payCreateDate;
	}



	public void setPayCreateDate(Date payCreateDate) {
		this.payCreateDate = payCreateDate;
	}



	public String getPayStatus() {
		return payStatus;
	}



	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
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



	@Override
	public String toString() {
		return "Pay [payNo=" + payNo + ", payTime=" + payTime + ", payDay=" + payDay + ", payExtra=" + payExtra
				+ ", paySal=" + paySal + ", payPayment=" + payPayment + ", payCreateDate=" + payCreateDate
				+ ", payStatus=" + payStatus + ", memberNo=" + memberNo + ", storeNo=" + storeNo + ", memberName="
				+ memberName + "]";
	}




	
	
	
	
}
