package Start.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Start.Config.*;
public class DatabaseService {
	public Connection OpenConnection() {
		Connection conn = null;
		try {
			
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(DatabaseConfig.CONNECTION_Url,DatabaseConfig.USERNAME,DatabaseConfig.PASSWORD);
			return conn;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	public ResultSet ReadData(String sql) throws SQLException {
		Connection conn=this.OpenConnection();
		Statement stmt = conn.createStatement();
		ResultSet result=stmt.executeQuery(sql);
		return result;
	}
}
