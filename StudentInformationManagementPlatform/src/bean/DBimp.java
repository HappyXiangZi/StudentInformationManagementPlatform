package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mysql.cj.xdevapi.Result;

public class DBimp {
	private Connection connection = DBcon.getConnection();
	private PreparedStatement pstmt;
	public int addUser(User user) {
		String sql = "insert into member(mid,password) values(?,?)";
		int rusult =0;
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, user.getMid());
			pstmt.setString(2, user.getPass());
			rusult = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				connection.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return rusult;
	}
}
