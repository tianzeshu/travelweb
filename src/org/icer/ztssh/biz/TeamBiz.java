package org.icer.ztssh.biz;

import org.icer.ztssh.po.Team;
import java.util.ArrayList;

public interface TeamBiz {
	boolean TeamAdd(Team team);
	ArrayList<Team> show();
	Team findTeam(String teamname);
	void memberAdd(String member,String teamname);
}
