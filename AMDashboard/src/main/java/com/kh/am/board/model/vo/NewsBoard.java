package com.kh.am.board.model.vo;

import java.sql.Date;

public class NewsBoard {
	private int newsNo;
	private Date createDate;
	private char memberType;
	private String title;
	private String address;
	private int newsType;

	
	public NewsBoard() {
	}


	public NewsBoard(int newsNo, Date createDate, char memberType, String title, String address, int newsType) {
		super();
		this.newsNo = newsNo;
		this.createDate = createDate;
		this.memberType = memberType;
		this.title = title;
		this.address = address;
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


	public char getMemberType() {
		return memberType;
	}


	public void setMemberType(char memberType) {
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


	public int getNewsType() {
		return newsType;
	}


	public void setNewsType(int newsType) {
		this.newsType = newsType;
	}


	@Override
	public String toString() {
		return "NewsBoard [newsNo=" + newsNo + ", createDate=" + createDate + ", memberType=" + memberType + ", title="
				+ title + ", address=" + address + ", newsType=" + newsType + "]";
	}

	
	
	
}