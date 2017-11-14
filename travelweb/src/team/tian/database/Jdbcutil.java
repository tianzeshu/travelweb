package team.tian.database;

import java.util.*;
import java.sql.*;
import java.io.*;

public class Jdbcutil {
	private static String DRIVER_CLASS;
	private static String URL;
	private static String USERRNAME;
	private static String PASSWORD;
	private static Properties p = new Properties();
	static {
		try {
			FileInputStream fis = new FileInputStream("db.properties");
			p.load(fis);
			DRIVER_CLASS = p.getProperty("driver");
			URL = p.getProperty("url");
			USERRNAME = p.getProperty("user");
			PASSWORD = p.getProperty("pass");
			Class.forName(DRIVER_CLASS);
			fis.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, USERRNAME, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void close(Connection conn) {
		try {
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
