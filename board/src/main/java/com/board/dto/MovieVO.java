package com.board.dto;

public class MovieVO {

	private String ranks;
	private String imgs;
	private String movieAges;
	private String movieTitles;
	private String movieRates;
	private String movieOpenDates;
	public String getRanks() {
		return ranks;
	}
	
	
	
	public MovieVO(String ranks, String imgs, String movieAges, String movieTitles, String movieRates,
			String movieOpenDates) {
		this.ranks = ranks;
		this.imgs = imgs;
		this.movieAges = movieAges;
		this.movieTitles = movieTitles;
		this.movieRates = movieRates;
		this.movieOpenDates = movieOpenDates;
	}



	public void setRanks(String ranks) {
		this.ranks = ranks;
	}
	public String getImgs() {
		return imgs;
	}
	public void setImgs(String imgs) {
		this.imgs = imgs;
	}
	public String getMovieAges() {
		return movieAges;
	}
	public void setMovieAges(String movieAges) {
		this.movieAges = movieAges;
	}
	public String getMovieTitles() {
		return movieTitles;
	}
	public void setMovieTitles(String movieTitles) {
		this.movieTitles = movieTitles;
	}
	public String getMovieRates() {
		return movieRates;
	}
	public void setMovieRates(String movieRates) {
		this.movieRates = movieRates;
	}
	public String getMovieOpenDates() {
		return movieOpenDates;
	}
	public void setMovieOpenDates(String movieOpenDates) {
		this.movieOpenDates = movieOpenDates;
	}
	@Override
	public String toString() {
		return "MovieVO [ranks=" + ranks + ", imgs=" + imgs + ", movieAges=" + movieAges + ", movieTitles="
				+ movieTitles + ", movieRates=" + movieRates + ", movieOpenDates=" + movieOpenDates + "]";
	}
	
	
	
}
