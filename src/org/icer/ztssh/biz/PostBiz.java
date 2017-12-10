package org.icer.ztssh.biz;

import org.icer.ztssh.po.Post;
import java.util.ArrayList;

public interface PostBiz {
	boolean PostAdd(Post post);
	ArrayList<Post> show();
}
