package com.example.spring05.model;

import java.util.Date;

public class ReplyVO {
	private int repno;
	private int bno;
	private String rewiter;
	private String recontent;
	private Date regdate;
	private Date uptodate;
	
	
	public int getRepno() {
		return repno;
	}
	public void setRepno(int repno) {
		this.repno = repno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getRewiter() {
		return rewiter;
	}
	public void setRewiter(String rewiter) {
		this.rewiter = rewiter;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUptodate() {
		return uptodate;
	}
	public void setUptodate(Date uptodate) {
		this.uptodate = uptodate;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [repno=" + repno + ", bno=" + bno + ", rewiter=" + rewiter + ", recontent=" + recontent
				+ ", regdate=" + regdate + ", uptodate=" + uptodate + "]";
	}
}
