package org.icer.ztssh.po;

public class Reply {
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
	private int textid;
	private String username;
	private String title;
	private int number;
	private String text;
	private String time;
	private int ispost;
	public int getTextid() {
		return textid;
	}
	public void setTextid(int textid) {
		this.textid = textid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getIspost() {
		return ispost;
	}
	public void setIspost(int ispost) {
		this.ispost = ispost;
	}
}