package com.remind.board.dto;

import java.sql.Timestamp;

public class VideoBoardDto {

	private int bno;
	private String title;
	private String writer;
	private Timestamp regDate;
	private int viewCnt;
	private String url;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "VideoBoard [bno=" + bno + ", title=" + title + ", writer=" + writer + ", regDate=" + regDate
				+ ", viewCnt=" + viewCnt + ", url=" + url + "]";
	}
	
	
}
