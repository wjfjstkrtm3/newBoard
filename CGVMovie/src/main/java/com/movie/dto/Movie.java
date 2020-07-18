package com.movie.dto;

import java.sql.Timestamp;

public class Movie {
	private String id;
	private int reservation_seq;
	private String movie_title;
	private String movie_running_time;
	private String movie_age;
	private String movie_startDate;
	private Timestamp reservation_date;
	private int ticket_number;
	private String selected_seat;
	private String selected_theater;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getReservation_seq() {
		return reservation_seq;
	}
	public void setReservation_seq(int reservation_seq) {
		this.reservation_seq = reservation_seq;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getMovie_running_time() {
		return movie_running_time;
	}
	public void setMovie_running_time(String movie_running_time) {
		this.movie_running_time = movie_running_time;
	}
	public String getMovie_age() {
		return movie_age;
	}
	public void setMovie_age(String movie_age) {
		this.movie_age = movie_age;
	}
	public String getMovie_startDate() {
		return movie_startDate;
	}
	public void setMovie_startDate(String movie_startDate) {
		this.movie_startDate = movie_startDate;
	}
	public Timestamp getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(Timestamp reservation_date) {
		this.reservation_date = reservation_date;
	}
	public int getTicket_number() {
		return ticket_number;
	}
	public void setTicket_number(int ticket_number) {
		this.ticket_number = ticket_number;
	}
	public String getSelected_seat() {
		return selected_seat;
	}
	public void setSelected_seat(String selected_seat) {
		this.selected_seat = selected_seat;
	}
	public String getSelected_theater() {
		return selected_theater;
	}
	public void setSelected_theater(String selected_theater) {
		this.selected_theater = selected_theater;
	}
	@Override
	public String toString() {
		return "Movie [id=" + id + ", reservation_seq=" + reservation_seq + ", movie_title=" + movie_title
				+ ", movie_running_time=" + movie_running_time + ", movie_age=" + movie_age + ", movie_startDate="
				+ movie_startDate + ", reservation_date=" + reservation_date + ", ticket_number=" + ticket_number
				+ ", selected_seat=" + selected_seat + ", selected_theater=" + selected_theater + "]";
	}
	
}
