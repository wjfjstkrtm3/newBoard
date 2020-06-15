package com.board.dto;


public class WriteBoardVO {

	private int num;
	private int bno;
	private String searchType;
	private String keyword;
	private String writer;
	private String content;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "WriteBoardVO [num=" + num + ", bno=" + bno + ", searchType=" + searchType + ", keyword=" + keyword
				+ ", writer=" + writer + ", content=" + content + "]";
	}
	
	
}
