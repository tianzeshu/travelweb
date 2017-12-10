package org.icer.ztssh.dao;
import java.util.ArrayList;

import org.icer.ztssh.po.*;
public interface TeamDao {
	int insertTeam(Team team);
	ArrayList<Team> showAll();
	Team selectTeam(String teamname);
	void memberAdd(String member,String teamname);
}
