package org.icer.ztssh.action;

import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import org.icer.ztssh.biz.TeamBiz;
import org.icer.ztssh.biz.impl.TeamBizlmpl;
import org.icer.ztssh.po.Team;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import java.util.ArrayList;
import org.icer.ztssh.biz.ReplyBiz;
import org.icer.ztssh.biz.impl.ReplyBizlmpl;
import org.icer.ztssh.po.Reply;

public class TeamAction extends ActionSupport implements SessionAware,
ModelDriven<Team>, Preparable{
	private Map<String, Object> session;
	private Team team;
	private ArrayList<Reply> replylist;
	private TeamBiz teambiz;
	private ReplyBiz replybiz;
	private String nextpage;
	private String valcode;
	private ArrayList<Team> list;
	private String fteamname;
	private String fmember;
	// 鐧诲綍
	public String teamadd() {
		// 楠岃瘉鐧诲綍
		//System.out.println(">>>"+user.getUsername()+","+user.getPassword()+","+valcode);
			if(teambiz.TeamAdd(team)) {
				this.nextpage = "success.jsp";
				return SUCCESS + "_blue";
			}
			else {
				this.nextpage = "fail.jsp";
				return SUCCESS + "_yellow";
			}
	}
	
	public String showAll() {
		list = teambiz.show();
		session.put("teamlist", list);
		this.nextpage = "teamindex.jsp";
		return SUCCESS + "_red";
	}
	public String showOne() {
		System.out.println("到这里了！"+fteamname);
		team = teambiz.findTeam(fteamname);
		replylist = replybiz.show();
		session.put("teamname", team);
		session.put("teamtruename",team.getMember());
		session.put("usertruename",fmember);
		session.put("replylist",replylist);
		this.nextpage = "teamdetail.jsp";
		return SUCCESS + "_purple";
	}
	
	public String memberAdd() {
		System.out.println("here!"+fmember+" "+fteamname);
		teambiz.memberAdd(fmember, fteamname);
		this.nextpage = "success.jsp";
		return SUCCESS + "_purple";
	}
	
	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		team = new Team();
		teambiz = new TeamBizlmpl();
		replybiz= new ReplyBizlmpl();
	}

	@Override
	public Team getModel() {
		// TODO Auto-generated method stub
		return team;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session = arg0;
	}

	public void setValcode(String valcode) {
		this.valcode = valcode;
	}
	
	public String getValcode() {
		return valcode;
	}
	
	public String getNextpage() {
		return nextpage;
	}
	
	public String getFteamname() {
		return fteamname;
	}
	public void setFteamname(String fteamname) {
		this.fteamname = fteamname;
	}
	
	public String getFmember() {
		return fmember;
	}
	public void setFmember(String fmember) {
		this.fmember = fmember;
	}
}
