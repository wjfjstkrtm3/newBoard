package com.movie.dto;

public class CGVInfo {

	private String rank; // NO.1, NO.2, NO.3 .. 
	private String img; // 영화 이미지 주소
	private String title; // 영화 제목
	private String percent; // 영화 예매율
	private String evaluation; // 영화 평가
	private String openingDates; // 영화 개봉일
	private String ages; // 연령 제한
	
	public CGVInfo(String rank, String img, String title, String percent, String evaluation, String openingDates,
			String ages) {
		this.rank = rank;
		this.img = img;
		this.title = title;
		this.percent = percent;
		this.evaluation = evaluation;
		this.openingDates = openingDates;
		this.ages = ages;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPercent() {
		return percent;
	}
	public void setPercent(String percent) {
		this.percent = percent;
	}
	public String getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}
	public String getOpeningDates() {
		return openingDates;
	}
	public void setOpeningDates(String openingDates) {
		this.openingDates = openingDates;
	}
	public String getAges() {
		return ages;
	}
	public void setAges(String ages) {
		this.ages = ages;
	}
	@Override
	public String toString() {
		return "CGVInfo [rank=" + rank + ", img=" + img + ", title=" + title + ", percent=" + percent + ", evaluation="
				+ evaluation + ", openingDates=" + openingDates + ", ages=" + ages + "]";
	}
	
	
}
