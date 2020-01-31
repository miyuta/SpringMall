package com.example.spring03.domain;

import java.util.Date;

public class OrderVO {
	private String orderid;
	private String userid;
	private String orderrec;
	private String useraddr1;
	private String useraddr2;
	private String useraddr3;
	private String orderph;
	private int amount;
	private Date orderdate;
	private String delivery;
	

	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getOrderrec() {
		return orderrec;
	}
	public void setOrderrec(String orderrec) {
		this.orderrec = orderrec;
	}
	public String getUseraddr1() {
		return useraddr1;
	}
	public void setUseraddr1(String useraddr1) {
		this.useraddr1 = useraddr1;
	}
	public String getUseraddr2() {
		return useraddr2;
	}
	public void setUseraddr2(String useraddr2) {
		this.useraddr2 = useraddr2;
	}
	public String getUseraddr3() {
		return useraddr3;
	}
	public void setUseraddr3(String useraddr3) {
		this.useraddr3 = useraddr3;
	}
	public String getOrderph() {
		return orderph;
	}
	public void setOrderph(String orderph) {
		this.orderph = orderph;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
}
