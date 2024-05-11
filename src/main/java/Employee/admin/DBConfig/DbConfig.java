package Employee.admin.DBConfig;

import java.sql.*;

public class DbConfig {

	protected PreparedStatement stmt;
	protected Connection conn;
	protected ResultSet rs;
	public DbConfig(){
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/employeeproject","root","root");
	}
	catch(Exception ex)
	{
		System.out.println("Error is==>"+ex);
	}

	}

}
