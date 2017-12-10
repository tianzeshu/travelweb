package org.icer.ztssh.po;

public class Post {
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
	private int classnum;
	private String text;
	private int zan;
	private int dzan;
	private String time;
	
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
	public int getClassnum() {
		return classnum;
	}
	public void setClassnum(int classnum) {
		this.classnum = classnum;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getZan() {
		return zan;
	}
	public void setZan(int zan) {
		this.zan = zan;
	}
	public int getDzan() {
		return dzan;
	}
	public void setDzan(int dzan) {
		this.dzan = dzan;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}