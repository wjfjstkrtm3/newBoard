package com.remind.board.dto;

public class PageDto {

	// 현재 페이지 번호
	private int num;

	// 게시물 총 개수
	private int count;
	
	// 한 페이지에 출력할 게시물 개수
	private int postNum;
	
	// 하단 페이징 번호 [게시물 총개수 / 한 페이지에 출력할 게시물 개수]
	private int pageNum;
	
	// 페이지 번호에 따른 출력할 게시물 (첫번째 index)
	private int displayPost;
	
	// 하단에 표시할 페이지 번호의 개수
	private int pageNum_cnt;
	
	// 표시되는 페이지 번호 중 마지막 번호
	private int endPageNum;
	
	// 표시되는 페이지 번호 중 첫번째 번호
	private int startPageNum;
	
	// 마지막 번호 조건 추가
	private int endPageNum_tmp;
	
	// prev 버튼
	private boolean prev;
	
	// next 버튼
	private boolean next;
	
	
	public PageDto(int num, int count) {
		this.num = num;
		this.count = count;
		
		// 한 페이지에 출력할 게시물 개수
		postNum = 10;
		
		// 페이지 번호에 따른 출력할 게시물 (첫번째 index)
		displayPost = (num - 1) * postNum;
		
		// 하단에 표시할 페이지 번호의 개수
		pageNum_cnt = 10;
		
		// 표시되는 페이지 번호 중 마지막 번호
		endPageNum = (int)Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt;
		
		// 표시되는 페이지 번호 중 첫번째 번호
		startPageNum = endPageNum - (pageNum_cnt - 1);
		// startPageNum = endPageNum - pageNum_cnt + 1;
		
		// 마지막 번호 조건 추가
		endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
		
		if(endPageNum > endPageNum_tmp) {
			this.endPageNum = endPageNum_tmp;
		}
		// 이전 버튼
		prev = (startPageNum ==1) ? false : true;
		
		// 다음 버튼
		next = (endPageNum * pageNum_cnt) >= count ? false : true;
		
	}
	
	
	/*
	// 검색 타입과 검색어
	// Controller에서 searchType, keyword PageDto타입에 넣어두기전
	private String searchWord;
	
	public void setSearchWord(String searchType, String keyword) {
		if(searchType == "" || keyword =="") {
			searchWord = "";
		} else {
			searchWord = "&searchType=" + searchType + "&keyword=" + keyword;
		}
	}
	
	public String getSearchWord() {
		return searchWord;
	}

	*/
	
	// 검색 타입과 검색어 
	// 1페이지는 검색적용이 되지만, 2페이지부터는 url이 /board/listPageSearch?num=2 이렇게 밖에안되기때문에 검색조건이 적용안된 게시물이나옴
	// 그래서 검색이 적용된 게시물을 불러오기위해서 String으로 url뒤에 붙여줄거임
	
	public String getSearchWord() {
		if(searchType.equals("") || keyword == "") {
			return "";
		} else {
			return "&searchType=" + searchType + "&keyword=" + keyword;
		}
	}
	
	private String searchType;
	private String keyword;
	
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public String getSearchType() {
		return searchType;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	
	
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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

	public int getDisplayPost() {
		return displayPost;
	}

	public void setDisplayPost(int displayPost) {
		this.displayPost = displayPost;
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

	public void setEndPageNum_tmp(int endPageNum_tmp) {
		this.endPageNum_tmp = endPageNum_tmp;
	}
	
	public int getEndPageNum_tmp() {
		return endPageNum_tmp;
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
