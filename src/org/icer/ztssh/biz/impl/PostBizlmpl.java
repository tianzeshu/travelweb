package org.icer.ztssh.biz.impl;

import org.icer.ztssh.biz.PostBiz;
import org.icer.ztssh.dao.PostDao;
import org.icer.ztssh.dao.impl.PostDaolmpl;
import org.icer.ztssh.po.Post;
import java.util.ArrayList;

public class PostBizlmpl implements PostBiz {
	PostDao Postdao=new PostDaolmpl();

	@Override
	public boolean PostAdd(Post Post) {
		// TODO Auto-generated method stub
	
		int flag=Postdao.insertPost(Post);
		if(flag>0)
		{
			System.out.println("true");
			return true;
		}
		System.out.println("false");
		return false;
	}
	public ArrayList<Post> show() {
		return Postdao.showAll();
	}
}
