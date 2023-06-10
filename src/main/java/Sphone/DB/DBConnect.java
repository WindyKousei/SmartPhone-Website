package Sphone.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	private final static String serverName = "MINHTIEN";
	private final static String dbName = "PhoneComponent";
	private final static String portNumber = "1433";
	private final static String instance = "";// MSSQLSERVER LEAVE THIS ONE EMPTY IF YOUR SQL IS A SINGLE INSTANCE
	private final static String userID = "ServerLogin";
	private final static String password = "1";

	public static Connection getConnection() throws Exception {
		String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName;
		if (instance == null || instance.trim().isEmpty())
			url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url, userID, password);
	}
	

	public static void main(String[] args) {
		try {
			System.out.println(new DBConnect().getConnection());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
