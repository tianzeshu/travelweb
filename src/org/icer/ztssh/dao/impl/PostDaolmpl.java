package org.icer.ztssh.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.icer.ztssh.dao.PostDao;
import org.icer.ztssh.dbutil.DBHelper;
import org.icer.ztssh.po.Post;
import java.util.ArrayList;

public class PostDaolmpl implements PostDao {

	@Override
	public int insertPost(Post post) {
		// TODO Auto-generated method stub
		DBHelper dbh=new DBHelper();
		String str="insert into post(textid,username,title,classnum,text,zan,dzan,time) values(?,?,?,?,?,?,?,?)";
		System.out.println(post.getTextid()+" "+post.getUsername()+" "+post.getTitle()+" "+post.getClassnum()+" "+post.getText()+" "+post.getZan()+" "+post.getDzan()+" "+post.getTime());
		int i=dbh.execOthers(str, post.getTextid(),post.getUsername(),post.getTitle(),post.getClassnum(),post.getText(),post.getZan(),post.getDzan(),post.getTime());
		return i;
	}
	
	@Override
	public ArrayList<Post> showAll() {
		// TODO Auto-generated method stub
		ArrayList<Post> list = new ArrayList<Post>();
		DBHelper dbh=new DBHelper();
		//查询语句
		String str="select * from post";
		ResultSet rs=dbh.execQuery(str);
		try {
		while(rs.next()) {
			Post post=new Post();
			System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getInt(4)+" "+rs.getString(5)+" "+rs.getInt(6)+" "+rs.getInt(7)+" "+rs.getString(8));
			post.setTextid(rs.getInt(1));
			post.setUsername(rs.getString(2));
			post.setTitle(rs.getString(3));
			post.setClassnum(rs.getInt(4));
			post.setText(rs.getString(5));
			post.setZan(rs.getInt(6));
			post.setDzan(rs.getInt(7));
			post.setTime(rs.getString(8));
			list.add(post);
		}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			rs.close();
		} catch(SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}