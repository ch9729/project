package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import config.DBConfig;
import dto.BookDTO;

public class BookDAO {
	
	//전체 조회
	public int selectCount(Map<String, Object> map) {
	    int totalCount = 0;
	    String sql = "SELECT COUNT(*) FROM book WHERE booking_yn = 0"; // 기본 조건

	    if (map != null && map.get("searchWord") != null) {
	        sql += " AND " + map.get("searchField") + " LIKE ?"; // 검색 조건 추가
	    }

	    try (Connection conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_ID, DBConfig.DB_pwd);
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        if (map != null && map.get("searchWord") != null) {
	            pstmt.setString(1, "%" + map.get("searchWord") + "%"); // 파라미터 바인딩
	        }

	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                totalCount = rs.getInt(1); // 총 카운트 값
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return totalCount;
	}
	
	public List<BookDTO> selectList(Map<String, Object> param) {
	    String sql = "SELECT bnum, bname, bdetail, age, booking_yn FROM book WHERE booking_yn = 0"; // 기본 조건
	    if (param != null && param.get("searchWord") != null) {
	        sql += " AND " + param.get("searchField") + " LIKE ?"; // 검색 조건 추가
	    }

	    List<BookDTO> bookList = new ArrayList<>();
	    try (Connection conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_ID, DBConfig.DB_pwd);
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        if (param != null && param.get("searchWord") != null) {
	            pstmt.setString(1, "%" + param.get("searchWord") + "%");
	        }

	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	                BookDTO book = new BookDTO();
	                book.setBnum(rs.getInt("bnum"));
	                book.setBname(rs.getString("bname"));
	                book.setBdetail(rs.getString("bdetail"));
	                book.setAge(rs.getInt("age"));
	                book.setBooking_yn(rs.getInt("booking_yn"));
	                bookList.add(book);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return bookList;
	}
}
