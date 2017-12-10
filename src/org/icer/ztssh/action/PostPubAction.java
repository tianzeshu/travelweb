package org.icer.ztssh.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.icer.ztssh.biz.PostBiz;
import org.icer.ztssh.biz.impl.PostBizlmpl;
import org.icer.ztssh.po.Post;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import java.util.ArrayList;

public class PostPubAction extends ActionSupport implements SessionAware,
ModelDriven<Post>, Preparable{
	private Map<String, Object> session;
	private Post post;
	private PostBiz postbiz;
	private String nextpage;
	private String valcode;
	private ArrayList<Post> list;
	private String titlename;
	// 登录
	public String postadd() {
		// 验证登录
		//System.out.println(">>>"+user.getUsername()+","+user.getPassword()+","+valcode);
			if(postbiz.PostAdd(post)) {
				this.nextpage = "success.jsp";
				return SUCCESS + "_blue";
			}
			else {
				this.nextpage = "fail.jsp";
				return SUCCESS + "_yellow";
			}
	}
	
	public String showAll() {
		list = postbiz.show();
		session.put("list", list);
		this.nextpage = "subindex.jsp";
		return SUCCESS + "_red";
	}
	
	public String showOne() {
		session.put("titlename",titlename);
		this.nextpage = "postdetail.jsp";
		return SUCCESS + "_red";
	}
	
	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		post = new Post();
		postbiz = new PostBizlmpl();
	}

	@Override
	public Post getModel() {
		// TODO Auto-generated method stub
		return post;
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
	
	public void setTitlename(String titlename) {
		this.titlename = titlename;
	}
	public String getTitlename() {
		return titlename;
	}
}
