package com.example.spring03.domain;

import java.util.Date;

public class ReplyVO {
	private int gdsnum;
	private String userid;
	private int repnum;
	private String repcon;
	private Date repdate;
	
	
	public int getGdsnum() {
		return gdsnum;
	}
	public void setGdsnum(int gdsnum) {
		this.gdsnum = gdsnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getRepnum() {
		return repnum;
	}
	public void setRepnum(int repnum) {
		this.repnum = repnum;
	}
	public String getRepcon() {
		return repcon;
	}
	public void setRepcon(String repcon) {
		this.repcon = repcon;
	}
	public Date getRepdate() {
		return repdate;
	}
	public void setRepdate(Date repdate) {
		this.repdate = repdate;
	}
	
}
