package com.opt.dto;

import java.util.Date;

public class CustomerServiceDto {
	private int customer_no_seq;
	private int opt_no_seq;
	private String customer_title;
	private String customer_content;
	private Date customer_regdate;
	
	public int getCustomer_no_seq() {
		return customer_no_seq;
	}
	public void setCustomer_no_seq(int customer_no_seq) {
		this.customer_no_seq = customer_no_seq;
	}
	public int getOpt_no_seq() {
		return opt_no_seq;
	}
	public void setOpt_no_seq(int opt_no_seq) {
		this.opt_no_seq = opt_no_seq;
	}
	public String getCustomer_title() {
		return customer_title;
	}
	public void setCustomer_title(String customer_title) {
		this.customer_title = customer_title;
	}
	public String getCustomer_content() {
		return customer_content;
	}
	public void setCustomer_content(String customer_content) {
		this.customer_content = customer_content;
	}
	public Date getCustomer_regdate() {
		return customer_regdate;
	}
	public void setCustomer_regdate(Date customer_regdate) {
		this.customer_regdate = customer_regdate;
	}

}
