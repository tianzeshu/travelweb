package org.icer.ztssh.biz.impl;

import java.util.ArrayList;

import org.icer.ztssh.biz.UserBiz;
import org.icer.ztssh.dao.UserDao;
import org.icer.ztssh.dao.impl.UserDaoImpl;
import org.icer.ztssh.po.User;


public class UserBizImpl implements UserBiz {
	UserDao userdao=new UserDaoImpl();
	@Override
	public User UserLogin(String username, String password) {
		// TODO Auto-generated method stub
		User user=userdao.findUserByUsernameAndPassword(username, password);
		if(user!=null)
		{
			userdao.moneysAdd(user.getUserid(), 1);
		}
		else
			user=null;
		return user;
	}

	@Override
	public boolean UserRegiter(User user) {
		// TODO Auto-generated method stub
	
		int flag=userdao.insertUser(user);
		if(flag>0)
		{
			System.out.println("true");
			return true;
		}
		System.out.println("false");
		return false;
	}

	@Override
	public boolean findUser(String username) {
		// TODO Auto-generated method stub
		int i=userdao.selectUser(username);
		if(i>0)
			return true;
		return false;
	}
	
	public ArrayList<User> showall() {
		return userdao.showAll();
	}
	
	public User userChange(User user) {
		return userdao.userChange(user);
	}

	@Override
	public User addPhoto(String username, Byte photo2) {
		// TODO Auto-generated method stub
		return userdao.addPhoto(username, photo2);
	}

}
