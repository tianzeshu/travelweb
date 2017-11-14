package team.tian.database;

import java.sql.*;


public class TestConnection {
    public static void main(String[] args) throws Exception {
       Connection conn=Jdbcutil.getConection();//利用封装好的类名来调用连接方法便可
       System.out.println(conn+",成功连接数据库");
       Jdbcutil.close( conn);//同样利用类名调用关闭方法即可
    }
}