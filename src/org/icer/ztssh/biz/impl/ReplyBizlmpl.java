package org.icer.ztssh.biz.impl;

import org.icer.ztssh.biz.ReplyBiz;
import org.icer.ztssh.dao.ReplyDao;
import org.icer.ztssh.dao.impl.ReplyDaolmpl;
import org.icer.ztssh.po.Reply;
import java.util.ArrayList;

public class ReplyBizlmpl implements ReplyBiz {
	ReplyDao Replydao=new ReplyDaolmpl();

	@Override
	public boolean ReplyAdd(Reply Reply) {
		// TODO Auto-generated method stub
	
		int flag=Replydao.insertReply(Reply);
		if(flag>0)
		{
			System.out.println("true");
			return true;
		}
		System.out.println("false");
		return false;
	}
	public ArrayList<Reply> show() {
		return Replydao.showAll();
	}
}
