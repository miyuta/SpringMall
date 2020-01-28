package com.example.spring03.domain;

public class OrderDetailsVO {
	private int orderdetailsnum;
	private String orderid;
	private int gdsnum;
	private int cartstock;
	
	
	public int getOrderdetailsnum() {
		return orderdetailsnum;
	}
	public void setOrderdetailsnum(int orderdetailsnum) {
		this.orderdetailsnum = orderdetailsnum;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public int getGdsnum() {
		return gdsnum;
	}
	public void setGdsnum(int gdsnum) {
		this.gdsnum = gdsnum;
	}
	public int getCartstock() {
		return cartstock;
	}
	public void setCartstock(int cartstock) {
		this.cartstock = cartstock;
	}
}
