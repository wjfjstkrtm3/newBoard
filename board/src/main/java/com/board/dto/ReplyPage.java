package com.board.dto;

public class ReplyPage {

	// 현재 페이지 번호
	private int num = 1;
	
	// 게시물 총 갯수
	private int count;
	
	// 한 페이지에 출력할 게시물 갯수
	private int postNum = 10;
	
	// 하단 페이지 번호 ([게시물 총 개수 / 한 페이지에 출력할 게시물 갯수])
	private int pageNum;
	
	// 페이지 번호에 따른 출력할 게시물
	private int displaypost;
	
	// 한번에 표시할 페이지 번호의 갯수
	private int pageNum_cnt = 10;
	
	// 표시되는 페이지 번호 중 마지막 번호
	private int endPageNum;
	
	// 표시되는 페이지 번호 중 첫번째 번호
	private int startPageNum;
	
	// 다음 / 이전 표시 여부
	private boolean prev;
	private boolean next;
	
	public void dataCalc() {
		// 마지막 번호
		endPageNum = (int)Math.ceil((double)num / pageNum_cnt) * pageNum_cnt;
		
		// 시작 번호
		startPageNum = endPageNum - pageNum_cnt + 1;
		
		// 다시 마지막 번호 계산
		int endPageNum_tmp = (int)Math.ceil((double)count / pageNum_cnt);
	 
		if(endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		
		prev = startPageNum == 1 ? false : true;
		next = endPageNum * pageNum_cnt >= count ? false : true;
		
		displaypost = (num-1) * postNum;
	}
	
	public int getNum() {
		return num;
	}
	@Override
	public String toString() {
		return "ReplyPage [num=" + num + ", count=" + count + ", postNum=" + postNum + ", pageNum=" + pageNum
				+ ", displaypost=" + displaypost + ", pageNum_cnt=" + pageNum_cnt + ", endPageNum=" + endPageNum
				+ ", startPageNum=" + startPageNum + ", prev=" + prev + ", next=" + next + "]";
	}

	public void setNum(int num) {
		this.num = num;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
		dataCalc();
	}
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getDisplaypost() {
		return displaypost;
	}
	public void setDisplaypost(int displaypost) {
		this.displaypost = displaypost;
	}
	public int getPageNum_cnt() {
		return pageNum_cnt;
	}
	public void setPageNum_cnt(int pageNum_cnt) {
		this.pageNum_cnt = pageNum_cnt;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	
	
}
