package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import config.DBConfig;
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
	        String sql = "UPDATE user SET password=?, name=?, rrn1=?, rrn2=?, phone1=?, phone2=?, phone3 WHERE id=?";
	        pstmt = conn.prepareStatement(sql);

	        // ?에 값 설정
	        pstmt.setString(1, userDTO.getPassword());
	        pstmt.setString(2, userDTO.getName());
	        pstmt.setInt(3, userDTO.getRrn1());
	        pstmt.setInt(4, userDTO.getRrn2());
	        pstmt.setInt(5, userDTO.getPhone1());
	        pstmt.setInt(6, userDTO.getPhone2());
	        pstmt.setInt(7, userDTO.getPhone3());
	        pstmt.setString(8, userDTO.getId());

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
			String sql = "DELETE FROM user WHERE num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userDTO.getNum());
			
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
				 user.setNum(rs.getInt("num"));
				 user.setId(rs.getString("id"));
				 user.setPassword(rs.getString("password"));
				 user.setName(rs.getString("name"));
				 System.out.println(user.getName());
	                System.out.println("ID: " + id);
	                System.out.println("Password: " + password);
	            } else {
	            	System.out.println("안됨");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
			return user;
		}
}
