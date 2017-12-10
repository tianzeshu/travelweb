package org.icer.ztssh.biz;

import org.icer.ztssh.po.Reply;
import java.util.ArrayList;

public interface ReplyBiz {
	boolean ReplyAdd(Reply Reply);
	ArrayList<Reply> show();
}
