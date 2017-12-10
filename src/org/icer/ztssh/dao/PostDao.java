package org.icer.ztssh.dao;
import java.util.ArrayList;

import org.icer.ztssh.po.*;
public interface PostDao {
	int insertPost(Post post);
	ArrayList<Post> showAll();
}
