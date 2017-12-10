package org.icer.ztssh.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.icer.ztssh.dao.UserDao;
import org.icer.ztssh.dbutil.DBHelper;
import org.icer.ztssh.po.Team;
import org.icer.ztssh.po.User;
import org.icer.ztssh.po.User;
public class UserDaoImpl implements UserDao {

	@Override
	public User findUserByUsernameAndPassword(String username, String password) {
		// TODO Auto-generated method stub
		DBHelper dbh=new DBHelper();
		//查询语句
		String str="select * from user where username=? and password=?";
		ResultSet rs=dbh.execQuery(str, username,password);
		User user=new User();
		try {
			if(rs.next())
			{
				System.out.println(rs.getInt(1));
				user.setUserid(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setNickname(rs.getString(4));
				user.setGender(rs.getString(5));
				user.setCity(rs.getString(6));
				user.setHobby(rs.getString(7));
				user.setPhoto(rs.getString(8));
				user.setSign(rs.getString(9));
				user.setMoneys(rs.getInt(10));
				user.setRegdate(rs.getString(11));
				user.setPhoto2(rs.getByte(13));
				rs.close();
				return user;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int insertUser(User user) {
		// TODO Auto-generated method stub
		DBHelper dbh=new DBHelper();
		String str="insert into user(username,password,nickname,gender,city,hobby,photo,sign,moneys,regdate) values(?,?,?,?,?,?,?,?,?,?)";
		System.out.println(user.getUsername()+" "+user.getPassword()+" "+user.getNickname()+" "+user.getGender()+" "+user.getCity()+" "+user.getHobby()+" "+user.getPhoto()+" "+user.getSign()+" "+user.getMoneys()+" "+user.getRegdate());
		int i=dbh.execOthers(str, user.getUsername(),user.getPassword(),user.getNickname(),user.getGender(),user.getCity(),user.getHobby(),user.getPhoto(),user.getSign(),user.getMoneys(),user.getRegdate());
		return i;
	}

	@Override
	public int selectUser(String username) {
		// TODO Auto-generated method stub
		DBHelper dbh=new DBHelper();
		String str="select count(*) from user where username=?";
		ResultSet rs=dbh.execQuery(str,username);
		try {
			if(rs.next())
			{
				int i=rs.getInt(1);
				return i;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public void moneysAdd(int userid,int moneys) {
		// TODO Auto-generated method stub
		DBHelper dbh=new DBHelper();
		String str="update user set moneys=moneys+? where userid=?";
		dbh.execOthers(str,moneys,userid);
	}
	
	@Override
	public ArrayList<User> showAll() {
		// TODO Auto-generated method stub
		ArrayList<User> list = new ArrayList<User>();
		DBHelper dbh=new DBHelper();
		//查询语句
		String str="select * from User";
		ResultSet rs=dbh.execQuery(str);
		try {
		while(rs.next()) {	
			User user=new User();
			user.setUserid(rs.getInt(1));
			user.setUsername(rs.getString(2));
			user.setPassword(rs.getString(3));
			user.setNickname(rs.getString(4));
			user.setGender(rs.getString(5));
			user.setCity(rs.getString(6));
			user.setHobby(rs.getString(7));
			user.setPhoto(rs.getString(8));
			user.setSign(rs.getString(9));
			user.setMoneys(rs.getInt(10));
			user.setRegdate(rs.getString(11));
			user.setPhoto2(rs.getByte(13));
			System.out.println(user.getUsername()+" "+user.getPassword()+" "+user.getNickname()+" "+user.getGender()+" "+user.getCity()+" "+user.getHobby()+" "+user.getPhoto()+" "+user.getSign()+" "+user.getMoneys()+" "+user.getRegdate());
			list.add(user);
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
	
	@Override
	public User userChange(User user) {
		// TODO Auto-generated method stub
		DBHelper dbh=new DBHelper();
		System.out.println(user.getPassword()+" "+user.getNickname()+" "+user.getGender()+" "+user.getCity()+" "+user.getHobby()+" "+user.getSign()+" "+user.getUsername());
		String str2="update user set password=?,nickname=?,gender=?,city=?,hobby=?,sign=? where username=?";
		dbh.execOthers(str2,user.getPassword(),user.getNickname(),user.getGender(),user.getCity(),user.getHobby(),user.getSign(),user.getUsername());
		String str="select * from User where username=?";
		ResultSet rs=dbh.execQuery(str,user.getUsername());
		try {
			if(rs.next()) {	
				user.setUserid(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setNickname(rs.getString(4));
				user.setGender(rs.getString(5));
				user.setCity(rs.getString(6));
				user.setHobby(rs.getString(7));
				user.setPhoto(rs.getString(8));
				user.setSign(rs.getString(9));
				user.setMoneys(rs.getInt(10));
				user.setRegdate(rs.getString(11));
				user.setPhoto2(rs.getByte(13));
				rs.close();
			}
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return user;
	}

	public User addPhoto(String username,Byte photo2) {
		DBHelper dbh=new DBHelper();
		//查询语句
		String str="update user set photo2=? where username=?";
		dbh.execOthers(str,photo2,username);
		String str2="select * from User where username=?";
		User user= new User();
		ResultSet rs=dbh.execQuery(str2,username);
		try {
			if(rs.next()) {	
				user.setUserid(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setNickname(rs.getString(4));
				user.setGender(rs.getString(5));
				user.setCity(rs.getString(6));
				user.setHobby(rs.getString(7));
				user.setPhoto(rs.getString(8));
				user.setSign(rs.getString(9));
				user.setMoneys(rs.getInt(10));
				user.setRegdate(rs.getString(11));
				user.setPhoto2(rs.getByte(13));
				rs.close();
			}
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return user;
	}
}