package com.opt.dto;

public class PostboxDto {
	private int opt_no_seq;
	private int post_no_seq;
	private String post_receive_id;
	private String post_content;
	public int getOpt_no_seq() {
		return opt_no_seq;
	}
	public void setOpt_no_seq(int opt_no_seq) {
		this.opt_no_seq = opt_no_seq;
	}
	public int getPost_no_seq() {
		return post_no_seq;
	}
	public void setPost_no_seq(int post_no_seq) {
		this.post_no_seq = post_no_seq;
	}
	public String getPost_receive_id() {
		return post_receive_id;
	}
	public void setPost_receive_id(String post_receive_id) {
		this.post_receive_id = post_receive_id;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	
}
