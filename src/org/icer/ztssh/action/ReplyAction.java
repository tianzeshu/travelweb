package org.icer.ztssh.action;

import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import org.icer.ztssh.biz.ReplyBiz;
import org.icer.ztssh.biz.impl.ReplyBizlmpl;
import org.icer.ztssh.po.Reply;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import java.util.ArrayList;

public class ReplyAction extends ActionSupport implements SessionAware,
ModelDriven<Reply>, Preparable{
	private Map<String, Object> session;
	private Reply Reply;
	private ReplyBiz Replybiz;
	private String nextpage;
	private String valcode;
	private ArrayList<Reply> list;
	private String freplyname;
	private String fmember;
	// 登录
	public String Replyadd() {
		// 验证登录
		//System.out.println(">>>"+user.getUsername()+","+user.getPassword()+","+valcode);
			if(Replybiz.ReplyAdd(Reply)) {
				if(Reply.getIspost()!=0)
					this.nextpage = "postdetail.jsp";
				else
					this.nextpage = "teamdetail.jsp";
				return SUCCESS + "_blue";
			}
			else {
				this.nextpage = "fail.jsp";
				return SUCCESS + "_yellow";
			}
	}
	
	public String showAll() {
		list = Replybiz.show();
		session.put("replylist", list);
		this.nextpage = "teamdetail.jsp";
		return SUCCESS + "_red";
	}
	
	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		Reply = new Reply();
		Replybiz = new ReplyBizlmpl();
	}

	@Override
	public Reply getModel() {
		// TODO Auto-generated method stub
		return Reply;
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
	
	public String getFreplyname() {
		return freplyname;
	}
	public void setFreplyname(String freplyname) {
		this.freplyname = freplyname;
	}
	
	public String getFmember() {
		return fmember;
	}
	public void setFmember(String fmember) {
		this.fmember = fmember;
	}
}
