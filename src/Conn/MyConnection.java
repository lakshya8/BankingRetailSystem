package Conn;
import java.sql.*;
import java.util.*;
import java.io.*;
public class MyConnection {
	private static Connection conn;
	private MyConnection(){}
	public static Connection getConnection()throws Exception{
		if(conn==null){
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
			
		}
		return conn;
	}

}
