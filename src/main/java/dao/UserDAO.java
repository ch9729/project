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

public class UserDAO {
	
	// 회원가입
	public int insertUser(UserDTO userDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		
		try {
			// mySQL 드라이버
			Class.forName(DBConfig.DB_DRIVER_NAME);
			conn = DriverManager.getConnection(DBConfig.DB_URL,
											   DBConfig.DB_ID,
											   DBConfig.DB_pwd);
			
			String sql = "INSERT INTO user(id, password, name, rrn1, rrn2, phone1, phone2, phone3) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userDTO.getId());
			pstmt.setString(2, userDTO.getPassword());
			pstmt.setString(3, userDTO.getName());
			pstmt.setInt(4, userDTO.getRrn1());
			pstmt.setInt(5, userDTO.getRrn2());
			pstmt.setInt(6, userDTO.getPhone1());
			pstmt.setInt(7, userDTO.getPhone2());
			pstmt.setInt(8, userDTO.getPhone3());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// 정보 id값으로 받아오기
	public UserDTO getUserById(String id) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    UserDTO user = null;

	    try {
	        // 데이터베이스 연결
	        conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_ID, DBConfig.DB_pwd);

	        // SQL 쿼리 작성
	        String sql = "SELECT * FROM user WHERE id=?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, id); // id 값을 쿼리 파라미터에 설정

	        // 쿼리 실행
	        rs = pstmt.executeQuery();

	        // 결과 처리
	        if (rs.next()) {
	            user = new UserDTO();
	            user.setId(rs.getString("id"));
	            user.setPassword(rs.getString("password"));
	            user.setName(rs.getString("name"));
	            user.setRrn1(rs.getInt("rrn1"));
	            user.setRrn2(rs.getInt("rrn2"));
	            user.setPhone1(rs.getInt("phone1"));
	            user.setPhone2(rs.getInt("phone2"));
	            user.setPhone3(rs.getInt("phone3"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return user;
}
	
	
	// 정보 수정
	public int updateUser(UserDTO userDTO) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    int result = -1; // 업데이트 결과를 반환

	    try {
	        conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_ID, DBConfig.DB_pwd);

	        // SQL 업데이트 쿼리
	        String sql = "UPDATE user SET password=?, phone2=?, phone3=? WHERE id=?";
	        pstmt = conn.prepareStatement(sql);

	        // ?에 값 설정
	        pstmt.setString(1, userDTO.getPassword());
	        pstmt.setInt(2, userDTO.getPhone2());
	        pstmt.setInt(3, userDTO.getPhone3());
	        pstmt.setString(4, userDTO.getId());

	        // 쿼리 실행 및 결과 저장
	        result = pstmt.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return result; // 업데이트 성공 여부 반환
	}
	
	
	//회원삭제
	public int deleteUser(UserDTO userDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		
		try {
			conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_ID, DBConfig.DB_pwd);
			String sql = "DELETE FROM user WHERE userNum=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userDTO.getUserNum());
			
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 로그인
	public UserDTO getUserLogin(String id, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserDTO user = null;
		
		try {
			conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_ID, DBConfig.DB_pwd);
			String sql = "SELECT * FROM user WHERE id=? AND password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			 if (rs.next()) {
				 user = new UserDTO();
				 user.setUserNum(rs.getInt("userNum"));
				 user.setId(rs.getString("id"));
				 user.setPassword(rs.getString("password"));
				 user.setName(rs.getString("name"));
	            } 
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
			return user;
		}
	
	//책 대여
	public boolean rentBook(int userNum, int bnum) {
		Connection conn = null;
		PreparedStatement updatePstmt = null;
		PreparedStatement rentalPstmt = null;

		try {
			String updateSql = "UPDATE book SET booking_yn=1 WHERE bnum=? AND booking_yn=0";
			String rentalSql = "INSERT INTO rental(userNum, bnum, rentalStart) VALUES (?, ?, NOW())";
			conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_ID, DBConfig.DB_pwd);
			updatePstmt = conn.prepareStatement(updateSql);
			rentalPstmt = conn.prepareStatement(rentalSql);
			
			updatePstmt.setInt(1, bnum);
			
			int updated = updatePstmt.executeUpdate();
			
			if(updated > 0) {
				rentalPstmt.setInt(1, userNum);
				rentalPstmt.setInt(2, bnum);
				int rental = rentalPstmt.executeUpdate();
				return rental > 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//대여 한 목록
	public List<BookDTO> getRentalBooks(int userNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BookDTO> rentalBooks = new ArrayList<>();
		
		try {
			conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_ID, DBConfig.DB_pwd);
			String sql = "SELECT book.bnum, book.bname, book.bdetail, book.age FROM book JOIN rental ON book.bnum = rental.bnum WHERE rental.userNum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookDTO book = new BookDTO();
				book.setBnum(rs.getInt("bnum"));
				book.setBname(rs.getString("bname"));
				book.setBdetail(rs.getString("bdetail"));
				book.setAge(rs.getInt("age"));
				rentalBooks.add(book);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rentalBooks;
		
	}
	
	//대여 반납
	public int returnRental(int rentalNum, int bnum) {
		int result = 0;
		Connection conn = null;
		PreparedStatement updatePstmt = null;
		PreparedStatement rentalPstmt = null;
		
		
		try {
			Class.forName(DBConfig.DB_DRIVER_NAME);
			conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_ID, DBConfig.DB_pwd);
			String updateSql = "UPDATE book SET booking_yn=0 WHERE bnum=? AND booking_yn=0;";
			String rentalSql = "DELETE FROM rental WHERE rentalNum=?";
			
			updatePstmt = conn.prepareStatement(updateSql);
			updatePstmt.setInt(1, bnum);
			updatePstmt.executeUpdate();
			
			rentalPstmt = conn.prepareStatement(rentalSql);
			rentalPstmt.setInt(1, rentalNum);
			result = rentalPstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
