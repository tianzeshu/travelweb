package org.icer.ztssh.biz.impl;

import org.icer.ztssh.biz.TeamBiz;
import org.icer.ztssh.dao.TeamDao;
import org.icer.ztssh.dao.impl.TeamDaolmpl;
import org.icer.ztssh.po.Team;
import java.util.ArrayList;

public class TeamBizlmpl implements TeamBiz {
	TeamDao Teamdao=new TeamDaolmpl();

	@Override
	public boolean TeamAdd(Team Team) {
		// TODO Auto-generated method stub
	
		int flag=Teamdao.insertTeam(Team);
		if(flag>0)
		{
			System.out.println("true");
			return true;
		}
		System.out.println("false");
		return false;
	}
	public ArrayList<Team> show() {
		return Teamdao.showAll();
	}
	public Team findTeam(String teamname) {
		return Teamdao.selectTeam(teamname);
	}
	
	public void memberAdd(String member,String teamname) {
		Teamdao.memberAdd(member, teamname);
	}
}
