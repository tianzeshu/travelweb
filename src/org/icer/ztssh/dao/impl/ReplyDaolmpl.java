package org.icer.ztssh.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.icer.ztssh.dao.ReplyDao;
import org.icer.ztssh.dbutil.DBHelper;
import org.icer.ztssh.po.Reply;
import java.util.ArrayList;

public class ReplyDaolmpl implements ReplyDao {

	@Override
	public int insertReply(Reply Reply) {
		// TODO Auto-generated method stub
		DBHelper dbh=new DBHelper();
		String str="insert into Reply(textid,username,title,number,text,time,ispost) values(?,?,?,?,?,?,?)";
		System.out.println(Reply.getTextid()+" "+Reply.getUsername()+" "+Reply.getTitle()+" "+Reply.getNumber()+" "+Reply.getText()+" "+Reply.getTime());
		int i=dbh.execOthers(str, Reply.getTextid(),Reply.getUsername(),Reply.getTitle(),Reply.getNumber(),Reply.getText(),Reply.getTime(),Reply.getIspost());
		return i;
	}
	
	@Override
	public ArrayList<Reply> showAll() {
		// TODO Auto-generated method stub
		ArrayList<Reply> list = new ArrayList<Reply>();
		DBHelper dbh=new DBHelper();
		//查询语句
		String str="select * from Reply";
		ResultSet rs=dbh.execQuery(str);
		try {
		while(rs.next()) {
			Reply Reply=new Reply();
			System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+" "+rs.getString(5)+" "+rs.getString(6));
			Reply.setTextid(rs.getInt(1));
			Reply.setUsername(rs.getString(2));
			Reply.setTitle(rs.getString(3));
			Reply.setNumber(rs.getInt(4));
			Reply.setText(rs.getString(5));
			Reply.setTime(rs.getString(6));
			Reply.setIspost(rs.getInt(7));
			list.add(Reply);
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