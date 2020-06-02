package com.board.dto;

import java.util.Date;

public class BoardReplyVO {

	private int bno;
	private int rno;
	private String content;
	private String writer;
	private Date regDate;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "BoardReplyVO [bno=" + bno + ", rno=" + rno + ", content=" + content + ", writer=" + writer
				+ ", regDate=" + regDate + "]";
	}
	
}
