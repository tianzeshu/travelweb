package team.tian.database;

import java.sql.*;


public class TestConnection {
    public static void main(String[] args) throws Exception {
       Connection conn=Jdbcutil.getConection();//���÷�װ�õ��������������ӷ������
       System.out.println(conn+",�ɹ��������ݿ�");
       Jdbcutil.close( conn);//ͬ�������������ùرշ�������
    }
}