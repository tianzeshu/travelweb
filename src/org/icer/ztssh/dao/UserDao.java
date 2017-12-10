package org.icer.ztssh.dao;
import java.util.ArrayList;

import org.icer.ztssh.po.*;
public interface UserDao {
	User findUserByUsernameAndPassword(String username,String password);
	int insertUser(User user);
	int selectUser(String username);
	void moneysAdd(int userid,int moneys);
	ArrayList<User> showAll();
	User userChange(User user);
	User addPhoto(String username,Byte photo2);
}
