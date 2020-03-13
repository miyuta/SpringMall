package com.example.spring04.modelVO;

import java.util.Date;

public class BoardVO {
	private int bno;
	private String title;
	private String writer;
	private String passwd;
	private String content;
	private Date regdate;
	private Date modate;
	private int cnt;
	private String option;
	private String keyword;
	private int startRow;
	private int endRow;
	private int repno;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getModate() {
		return modate;
	}
	public void setModate(Date modate) {
		this.modate = modate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getRepno() {
		return repno;
	}
	public void setRepno(int repno) {
		this.repno = repno;
	}
	
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", writer=" + writer + ", passwd=" + passwd + ", content="
				+ content + ", regdate=" + regdate + ", modate=" + modate + ", cnt=" + cnt + ", option=" + option
				+ ", keyword=" + keyword + ", startRow=" + startRow + ", endRow=" + endRow + ", repno=" + repno + "]";
	}
}
