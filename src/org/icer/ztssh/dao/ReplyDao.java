package org.icer.ztssh.dao;
import java.util.ArrayList;

import org.icer.ztssh.po.*;
public interface ReplyDao {
	int insertReply(Reply Reply);
	ArrayList<Reply> showAll();
}
