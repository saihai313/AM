package com.kh.am.calendar.model.vo;

import java.sql.Date;

public class NewsBoard {

	private int newsNo;
	private Date createDate;
	private String memberType;
	private String title;
	private String address;
	private int newsType;
	
	public NewsBoard() {
		// TODO Auto-generated constructor stub
	}



	public NewsBoard(int newsNo, Date createDate, String memberType, String title, String address, int newsType) {
		super();
		this.newsNo = newsNo;
		this.createDate = createDate;
		this.memberType = memberType;
		this.title = title;
		this.address = address;
		this.newsType = newsType;
	}



	public int getNewsType() {
		return newsType;
	}



	public void setNewsType(int newsType) {
		this.newsType = newsType;
	}



	public int getNewsNo() {
		return newsNo;
	}

	public void setNewsNo(int newsNo) {
		this.newsNo = newsNo;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}



	@Override
	public String toString() {
		return "NewsBoard [newsNo=" + newsNo + ", createDate=" + createDate + ", memberType=" + memberType + ", title="
				+ title + ", address=" + address + ", newsType=" + newsType + "]";
	}

	
}
