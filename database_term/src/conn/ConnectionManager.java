package conn;

import java.sql.*;

public class ConnectionManager {
	private  Connection conn = null;
	private String dbdriver = "oracle.jdbc.driver.OracleDriver";
	public ConnectionManager() {
		try {
		Class.forName(dbdriver);
		String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "db1512173";
		String passwd = "wjdgus12";
		conn =  DriverManager.getConnection (dburl, user, passwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public Connection getConnection() {
		return conn;
	}
}