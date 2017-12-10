package org.icer.ztssh.biz;

import java.util.ArrayList;
import org.icer.ztssh.po.User;

public interface UserBiz {
	User UserLogin(String username,String password);
	boolean UserRegiter(User user);
	boolean findUser(String username);
	ArrayList<User> showall();
	User userChange(User user);
	User addPhoto(String username,Byte photo2);
}
