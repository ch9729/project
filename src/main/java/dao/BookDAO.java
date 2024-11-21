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
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalCount = 0;
		
		try {
			Class.forName(DBConfig.DB_DRIVER_NAME);
			conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_ID, DBConfig.DB_pwd);
			String sql = "SELECT COUNT(*) FROM book";
			if(map.get("searchWord") != null) {
				sql += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				rs.next();
				totalCount = rs.getInt(1);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public List<BookDTO> selectList(Map<String, Object> param) {
	    List<BookDTO> bookList = new ArrayList<>();
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        conn = DriverManager.getConnection(DBConfig.DB_URL, DBConfig.DB_ID, DBConfig.DB_pwd);
	        StringBuilder sql = new StringBuilder();
	        sql.append("SELECT bnum, bname, bdetail, age FROM book"); // book은 테이블 이름

	        // 검색 조건이 있는 경우
	        if (param != null && param.get("searchWord") != null) {
	            sql.append(" WHERE ").append(param.get("searchField")).append(" LIKE ?");
	        }

	        pstmt = conn.prepareStatement(sql.toString());

	        // 검색 조건 파라미터 설정
	        if (param != null && param.get("searchWord") != null) {
	            pstmt.setString(1, "%" + param.get("searchWord") + "%");
	        }

	        rs = pstmt.executeQuery();

	        // 결과를 BookDTO 객체에 저장
	        while (rs.next()) {
	            BookDTO dto = new BookDTO();
	            dto.setBnum(rs.getInt("bnum"));
	            dto.setBname(rs.getString("bname"));
	            dto.setBdetail(rs.getString("bdetail"));
	            dto.setAge(rs.getInt("age"));
	            bookList.add(dto);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return bookList;
	}
}
