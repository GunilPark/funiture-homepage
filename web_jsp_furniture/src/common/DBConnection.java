package common;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
	
	public static Connection getConnection(){
		Connection con = null;
		boolean goIng = true;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");	 //oracle		
		} catch (Exception ex) {
			System.out.println("===드라이버 없음====: " + ex.getMessage());
			goIng = false;
		}	
		
		if(goIng){ 
			try{ 
//				String DB_URL = "jdbc:oracle:thin:@track-7:1521:xe";
				String DB_URL = "jdbc:oracle:thin:@182.217.138.73:1521:xe";
				
				String DB_USER = "track7";
				String DB_PASSWORD= "1234";
				con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

			} catch (Exception ex) {
				System.out.println("=====계정설정 오류======: " + ex.getMessage());
			}

		}
		return con;
	}
	
	public static void closeDB(Connection con,
			PreparedStatement ps,
			ResultSet rs){
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		if(ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}










