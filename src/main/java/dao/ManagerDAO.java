package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import config.DBConfig;
import dto.ManagerDTO;

public class ManagerDAO {
	
	//로그인
	public ManagerDTO getManagerLogin(String id, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ManagerDTO manager = null;
		
		try {
			Class.forName(DBConfig.DB_DRIVER_NAME);
			conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_ID, DBConfig.DB_pwd);
			String sql = "SELECT * FROM manager WHERE id=? AND password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			 if (rs.next()) {
	                manager = new ManagerDTO();
	                manager.setNum(rs.getInt("num"));
	                manager.setId(rs.getString("id"));
	                manager.setPassword(rs.getString("password"));
	                manager.setName(rs.getString("name"));
	                manager.setRole(rs.getString("role"));
	                System.out.println(manager.getName());
	                System.out.println("ID: " + id);
	                System.out.println("Password: " + password);
	            }else {
	            	System.out.println("No data found for the given ID and password.");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	        	try {
	        		if (rs != null) rs.close();
	                if (pstmt != null) pstmt.close();
	                if (conn != null) conn.close();
	        	} catch (Exception e) {
	        		e.printStackTrace();
	        	}
	        }
			return manager;
		}
}
