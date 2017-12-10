package org.icer.ztssh.po;

public class User {
  /*+----------+------------------+------+-----+---------+----------------+
	| Field    | Type             | Null | Key | Default | Extra          |
	+----------+------------------+------+-----+---------+----------------+
	| userid   | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
	| username | varchar(50)      | NO   |     | NULL    |                |
	| password | varchar(20)      | NO   |     | NULL    |                |
	| nickname | varchar(50)      | NO   |     | NULL    |                |
	| gender   | varchar(10)      | NO   |     | NULL    |                |
	| city     | varchar(20)      | NO   |     | NULL    |                |
	| hobby    | varchar(50)      | YES  |     | NULL    |                |
	| photo    | varchar(50)      | YES  |     | NULL    |                |
	| sign     | text             | YES  |     | NULL    |                |
	| moneys   | int(10) unsigned | YES  |     | 0       |                |
	| regdate  | datetime         | NO   |     | NULL    |                |
	| freecode | varchar(50)      | YES  |     | NULL    |                |
	+----------+------------------+------+-----+---------+----------------+*/
	private int userid;
	private String username;
	private String password;
	private String nickname;
	private String gender;
	private String city;
	private String hobby;
	private String photo;
	private String sign;
	private int moneys;
	private String regdate;
	private String freecode;
	private byte photo2;
	public String getFreecode() {
		return freecode;
	}
	public void setFreecode(String freecode) {
		this.freecode = freecode;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public int getMoneys() {
		return moneys;
	}
	public void setMoneys(int moneys) {
		this.moneys = moneys;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public byte getPhoto2() {
		return photo2;
	}
	public void setPhoto2(byte photo2) {
		this.photo2 = photo2;
	}
}
