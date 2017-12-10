package org.icer.ztssh.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.icer.ztssh.biz.UserBiz;
import org.icer.ztssh.biz.impl.UserBizImpl;
import org.icer.ztssh.po.Team;
import org.icer.ztssh.po.User;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class UserAction extends ActionSupport implements SessionAware,
ModelDriven<User>, Preparable{
	private Map<String, Object> session;
	private User user;
	private UserBiz userbiz;
	private String nextpage;
	private String valcode;
	private ArrayList<User> alluserlist;
	// 鐧诲綍
	public String login() {
		// 楠岃瘉鐧诲綍
		System.out.println(">>>"+user.getUsername()+","+user.getPassword()+","+valcode);
		alluserlist=userbiz.showall();
		session.put("alluser", alluserlist);
		if(valcode != null) {
			if(userbiz.UserRegiter(user)) {
				this.nextpage = "success.jsp";
				return SUCCESS + "_blue";
			}
			else {
				this.nextpage = "fail.jsp";
				return SUCCESS + "_yellow";
			}
		}
		if(user.getUsername()==null) {
			user=null;
			session.put("user", user);
		}
		else {
			user = userbiz.UserLogin(user.getUsername(), user.getPassword());
		}
		if (user != null) {
			session.put("user", user);
			this.nextpage = "index.jsp";
			return SUCCESS + "_red";
		}else{
			//this.addActionMessage("注销成功!");
			this.nextpage = "index.jsp";
			return SUCCESS;
		}
	}
	public String change() {
		user = userbiz.userChange(user);
		session.put("user", user);
		this.nextpage = "personal.jsp";
		return SUCCESS;
	}
	public String photo() {
		System.out.println("here！！！");
		user = userbiz.addPhoto(user.getUsername(),user.getPhoto2());
		session.put("user",user);
		System.out.println("here！！！");
		this.nextpage = "success.jsp";
		return SUCCESS;
	}
	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		user = new User();
		userbiz = new UserBizImpl();
	}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
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
}
