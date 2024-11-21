package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.DBConfig;
import dto.BookDTO;
import dto.ManagerDTO;
import dto.UserDTO;

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
	
	//책 전체 조회
	public List<BookDTO> getBookList() {
		List<BookDTO> bookList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(DBConfig.DB_DRIVER_NAME);
			conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_ID, DBConfig.DB_pwd);
			String sql = "SELECT * FROM book";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookDTO book = new BookDTO();
				book.setBnum(rs.getInt("bnum"));
				book.setBname(rs.getString("bname"));
				book.setBdetail(rs.getString("bdetail"));
				book.setAge(rs.getInt("age"));
				bookList.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bookList;
	}
	
	//책 추가
	public boolean addBook(String bname, String bdetail, int age) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(DBConfig.DB_DRIVER_NAME);
			conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_ID, DBConfig.DB_pwd);
			String sql = "INSERT INTO book(bname, bdetail, age) VALUES (?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bname);
			pstmt.setString(2, bdetail);
			pstmt.setInt(3, age);
			int row = pstmt.executeUpdate();
			return row > 0;
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
		
		return false;
	}
	
	//책 삭제
	public int deleteBook(int bnum) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(DBConfig.DB_DRIVER_NAME);
			conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_ID, DBConfig.DB_pwd);
			String sql = "DELETE FROM book WHERE bnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 회원 전체 조회
	public List<UserDTO> getUserList() {
		List<UserDTO> userList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(DBConfig.DB_DRIVER_NAME);
			conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_ID, DBConfig.DB_pwd);
			String sql = "SELECT * FROM user";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UserDTO user = new UserDTO();
				user.setUserNum(rs.getInt("userNum")); 
				user.setId(rs.getString("id")); 
				user.setPassword(rs.getString("password")); 
				user.setName(rs.getString("name")); 
				user.setRrn1(rs.getInt("rrn1")); 
				user.setRrn2(rs.getInt("rrn2")); 
				user.setPhone1(rs.getInt("phone1")); 
				user.setPhone2(rs.getInt("phone2")); 
				user.setPhone3(rs.getInt("phone3")); 
				userList.add(user);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
	
	//회원 삭제
	public int deleteUser(int userNum) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(DBConfig.DB_DRIVER_NAME);
			conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_ID, DBConfig.DB_pwd);
			String sql = "DELETE FROM user WHERE userNum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return result;
	}
	
}
