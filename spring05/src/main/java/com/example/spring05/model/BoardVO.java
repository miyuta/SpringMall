package com.example.spring05.model;

import java.util.Date;

public class BoardVO {
	public int bno;
	public String cate_cd;
	public String title;
	public String content;
	public String tag;
	public int view_cnt;
	public String reg_id;
	public Date reg_dt;
	public Date edit_dt;
	public String passwd;
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getCate_cd() {
		return cate_cd;
	}
	public void setCate_cd(String cate_cd) {
		this.cate_cd = cate_cd;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	public Date getEdit_dt() {
		return edit_dt;
	}
	public void setEdit_dt(Date edit_dt) {
		this.edit_dt = edit_dt;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", cate_cd=" + cate_cd + ", title=" + title + ", content=" + content + ", tag="
				+ tag + ", view_cnt=" + view_cnt + ", reg_id=" + reg_id + ", reg_dt=" + reg_dt + ", edit_dt=" + edit_dt
				+ ", passwd=" + passwd + "]";
	}
}
