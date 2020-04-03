package com.example.spring05.model;

import java.util.Date;

public class MemberVO {
	private int rnum;
	private String userid;
	private String passwd;
	private String username;
	private String familyname;
	private String lastname;
	private String useremail;
	private String userphone;
	private String carrier;
	private String fstnum;
	private String sndnum;
	private String thdnum;
	private String postnum;
	private String useraddr1;
	private String useraddr2;
	private String useraddr3;
	private Date reg_date;
	private Date up_data;
	private int useraccess;
	
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFamilyname() {
		return familyname;
	}
	public void setFamilyname(String familyname) {
		this.familyname = familyname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public String getCarrier() {
		return carrier;
	}
	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}
	public String getFstnum() {
		return fstnum;
	}
	public void setFstnum(String fstnum) {
		this.fstnum = fstnum;
	}
	public String getSndnum() {
		return sndnum;
	}
	public void setSndnum(String sndnum) {
		this.sndnum = sndnum;
	}
	public String getThdnum() {
		return thdnum;
	}
	public void setThdnum(String thdnum) {
		this.thdnum = thdnum;
	}
	public String getPostnum() {
		return postnum;
	}
	public void setPostnum(String postnum) {
		this.postnum = postnum;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getUp_data() {
		return up_data;
	}
	public void setUp_data(Date up_data) {
		this.up_data = up_data;
	}
	public int getUseraccess() {
		return useraccess;
	}
	public void setUseraccess(int useraccess) {
		this.useraccess = useraccess;
	}
	
	
	@Override
	public String toString() {
		return "MemberVO [rnum=" + rnum + ", userid=" + userid + ", passwd=" + passwd + ", username=" + username
				+ ", familyname=" + familyname + ", lastname=" + lastname + ", useremail=" + useremail + ", userphone="
				+ userphone + ", carrier=" + carrier + ", fstnum=" + fstnum + ", sndnum=" + sndnum + ", thdnum=" + thdnum
				+ ", postnum=" + postnum + ", useraddr1=" + useraddr1 + ", useraddr2=" + useraddr2 + ", useraddr3="
				+ useraddr3 + ", reg_date=" + reg_date + ", up_data=" + up_data + ", useraccess=" + useraccess + "]";
	}
}
