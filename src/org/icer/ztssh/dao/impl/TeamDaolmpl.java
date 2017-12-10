package org.icer.ztssh.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.icer.ztssh.dao.TeamDao;
import org.icer.ztssh.dbutil.DBHelper;
import org.icer.ztssh.po.Team;
import java.util.ArrayList;

public class TeamDaolmpl implements TeamDao {

	@Override
	public int insertTeam(Team team) {
		// TODO Auto-generated method stub
		DBHelper dbh=new DBHelper();
		String str="insert into team(id,teamname,teamleader,member,destination,time,money,teamcreate) values(?,?,?,?,?,?,?,?)";
		System.out.println(team.getId()+" "+team.getTeamname()+" "+team.getTeamleader()+" "+team.getMember()+" "+team.getDestination()+" "+team.getTime()+" "+team.getMoney()+" "+team.getTeamcreate());
		int i=dbh.execOthers(str, team.getId(),team.getTeamname(),team.getTeamleader(),team.getMember(),team.getDestination(),team.getTime(),team.getMoney(),team.getTeamcreate());
		return i;
	}
	
	@Override
	public ArrayList<Team> showAll() {
		// TODO Auto-generated method stub
		ArrayList<Team> list = new ArrayList<Team>();
		DBHelper dbh=new DBHelper();
		//查询语句
		String str="select * from team";
		ResultSet rs=dbh.execQuery(str);
		try {
		while(rs.next()) {
			Team Team=new Team();
			System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+" "+rs.getString(5)+" "+rs.getString(6)+" "+rs.getInt(7)+" "+rs.getString(8));
			Team.setId(rs.getInt(1));
			Team.setTeamname(rs.getString(2));
			Team.setTeamleader(rs.getString(3));
			Team.setMember(rs.getString(4));
			Team.setDestination(rs.getString(5));
			Team.setTime(rs.getString(6));
			Team.setMoney(rs.getInt(7));
			Team.setTeamcreate(rs.getString(8));
			list.add(Team);
		}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			rs.close();
		} catch(SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public Team selectTeam(String teamname) {
		// TODO Auto-generated method stub
		DBHelper dbh=new DBHelper();
		String str="select * from team where teamname=?";
		ResultSet rs=dbh.execQuery(str,teamname);
		Team team=new Team();
		try {
			if(rs.next())
			{
				System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+" "+rs.getString(5)+" "+rs.getString(6)+" "+rs.getInt(7)+" "+rs.getString(8));
				team.setId(rs.getInt(1));
				team.setTeamname(rs.getString(2));
				team.setTeamleader(rs.getString(3));
				team.setMember(rs.getString(4));
				team.setDestination(rs.getString(5));
				team.setTime(rs.getString(6));
				team.setMoney(rs.getInt(7));
				team.setTeamcreate(rs.getString(8));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return team;
	}
	
	@Override
	public void memberAdd(String member,String teamname) {
		// TODO Auto-generated method stub
		DBHelper dbh=new DBHelper();
		String newmember = new String();
		String str="select * from team where teamname=?";
		ResultSet rs=dbh.execQuery(str,teamname);
		Team team=new Team();
		try {
			if(rs.next())
			{
				System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+" "+rs.getString(5)+" "+rs.getString(6)+" "+rs.getInt(7)+" "+rs.getString(8));
				team.setId(rs.getInt(1));
				team.setTeamname(rs.getString(2));
				team.setTeamleader(rs.getString(3));
				team.setMember(rs.getString(4));
				team.setDestination(rs.getString(5));
				team.setTime(rs.getString(6));
				team.setMoney(rs.getInt(7));
				team.setTeamcreate(rs.getString(8));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String str2="update team set member=? where teamname=?";
		newmember = team.getMember()+" "+member;
		dbh.execOthers(str2,newmember,teamname);
	}
}