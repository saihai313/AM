package com.kh.am.management.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Paystubplus {
	private int corrNo; //급여정정신청 글벊
	private String corrContent; //급여 정정신청 이유
	private Date corrCreateDt;//급여정정신청 작성일
	private Timestamp corrModifyDt;//급여정정신청 수정일
	private String corrStatus;//급여정정신청상태
	private String corrResult;//급여정정신청결과
	private int memberNo;//회원번호
	private int StoreNo;//가게번호
	private int payNo;//급여번호
	private String memberName;
	
	
	public Paystubplus() {
		// TODO Auto-generated constructor stub
	}



	public String getMemberName() {
		return memberName;
	}



	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}



	public int getCorrNo() {
		return corrNo;
	}



	public void setCorrNo(int corrNo) {
		this.corrNo = corrNo;
	}



	public String getCorrContent() {
		return corrContent;
	}



	public void setCorrContent(String corrContent) {
		this.corrContent = corrContent;
	}



	public Date getCorrCreateDt() {
		return corrCreateDt;
	}



	public void setCorrCreateDt(Date corrCreateDt) {
		this.corrCreateDt = corrCreateDt;
	}



	public Timestamp getCorrModifyDt() {
		return corrModifyDt;
	}



	public void setCorrModifyDt(Timestamp corrModifyDt) {
		this.corrModifyDt = corrModifyDt;
	}



	public String getCorrStatus() {
		return corrStatus;
	}



	public void setCorrStatus(String corrStatus) {
		this.corrStatus = corrStatus;
	}



	public String getCorrResult() {
		return corrResult;
	}



	public void setCorrResult(String corrResult) {
		this.corrResult = corrResult;
	}



	public int getMemberNo() {
		return memberNo;
	}



	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}



	public int getStoreNo() {
		return StoreNo;
	}



	public void setStoreNo(int storeNo) {
		StoreNo = storeNo;
	}



	public int getPayNo() {
		return payNo;
	}



	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}



	@Override
	public String toString() {
		return "Paystubplus [corrNo=" + corrNo + ", corrContent=" + corrContent + ", corrCreateDt=" + corrCreateDt
				+ ", corrModifyDt=" + corrModifyDt + ", corrStatus=" + corrStatus + ", corrResult=" + corrResult
				+ ", memberNo=" + memberNo + ", StoreNo=" + StoreNo + ", payNo=" + payNo + ", memberName=" + memberName
				+ "]";
	}






	
	
	
	
}
