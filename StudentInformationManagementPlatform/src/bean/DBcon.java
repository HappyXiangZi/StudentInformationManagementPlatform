package bean;
import java.sql.*;

public class DBcon {
	private static final String DRIVER_CLASS = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
	private static final String user = "zeng";
	private static final String psw = "zeng";
	public static Connection getConnection() {
		Connection dbConnection = null;
		try {Class.forName(DRIVER_CLASS);
			dbConnection = DriverManager.getConnection(url, user, psw);
			if (dbConnection == null) {
				
			}
		}catch (Exception e) {
			
			e.printStackTrace();
		}
		return dbConnection;
	}
	//πÿ±’¡¨Ω”
	public static void closeConnection(Connection dbConnection) {
		try {
			if (dbConnection!=null&&(!dbConnection.isClosed())) {
				dbConnection.close();
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void closeResultSet(ResultSet res) {
		try {
			if (res!=null) {
				res.close();
				res = null;
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public static void closeStatement(PreparedStatement pStatement) {
		try {
			if (pStatement!=null) {
				pStatement.close();
				pStatement=null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
