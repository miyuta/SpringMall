package com.example.spring03.domain;

import java.util.Date;

public class GoodsViewVO {
	private int gdsnum;
	private String gdsname;
	private String catecode;
	private int gdsprice;
	private int gdsstock;
	private String gdsdes;
	private String gdsimg;
	private Date gdsdate;
	
	private String catecoderef;
	private String catename;
	
	private String gdsthumbimg;
	
	
	public String getGdsthumbimg() {
		return gdsthumbimg;
	}
	public void setGdsthumbimg(String gdsthumbimg) {
		this.gdsthumbimg = gdsthumbimg;
	}
	public int getGdsnum() {
		return gdsnum;
	}
	public void setGdsnum(int gdsnum) {
		this.gdsnum = gdsnum;
	}
	public String getGdsname() {
		return gdsname;
	}
	public void setGdsname(String gdsname) {
		this.gdsname = gdsname;
	}
	public String getCatecode() {
		return catecode;
	}
	public void setCatecode(String catecode) {
		this.catecode = catecode;
	}
	public int getGdsprice() {
		return gdsprice;
	}
	public void setGdsprice(int gdsprice) {
		this.gdsprice = gdsprice;
	}
	public int getGdsstock() {
		return gdsstock;
	}
	public void setGdsstock(int gdsstock) {
		this.gdsstock = gdsstock;
	}
	public String getGdsdes() {
		return gdsdes;
	}
	public void setGdsdes(String gdsdes) {
		this.gdsdes = gdsdes;
	}
	public String getGdsimg() {
		return gdsimg;
	}
	public void setGdsimg(String gdsimg) {
		this.gdsimg = gdsimg;
	}
	public Date getGdsdate() {
		return gdsdate;
	}
	public void setGdsdate(Date gdsdate) {
		this.gdsdate = gdsdate;
	}
	public String getCatecoderef() {
		return catecoderef;
	}
	public void setCatecoderef(String catecoderef) {
		this.catecoderef = catecoderef;
	}
	public String getCatename() {
		return catename;
	}
	public void setCatename(String catename) {
		this.catename = catename;
	}
}