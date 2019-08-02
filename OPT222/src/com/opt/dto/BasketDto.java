package com.opt.dto;

public class BasketDto {
	private int opt_no_seq;
	private int basket_no_seq;
	private int basket_count;
	private String basket_price;
	public int getOpt_no_seq() {
		return opt_no_seq;
	}
	public void setOpt_no_seq(int opt_no_seq) {
		this.opt_no_seq = opt_no_seq;
	}
	public int getBasket_no_seq() {
		return basket_no_seq;
	}
	public void setBasket_no_seq(int basket_no_seq) {
		this.basket_no_seq = basket_no_seq;
	}
	public int getBasket_count() {
		return basket_count;
	}
	public void setBasket_count(int basket_count) {
		this.basket_count = basket_count;
	}
	public String getBasket_price() {
		return basket_price;
	}
	public void setBasket_price(String basket_price) {
		this.basket_price = basket_price;
	}
	
}
