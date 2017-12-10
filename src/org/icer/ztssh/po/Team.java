package org.icer.ztssh.po;

public class Team {
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
	private int id;
	private String teamname;
	private String teamleader;
	private String member;
	private String destination;
	private String time;
	private int money;
	private String teamcreate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public String getTeamleader() {
		return teamleader;
	}
	public void setTeamleader(String teamleader) {
		this.teamleader = teamleader;
	}
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getTeamcreate() {
		return teamcreate;
	}
	public void setTeamcreate(String teamcreate) {
		this.teamcreate = teamcreate;
	}
}