<%@page import="dto.BookDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.BookDAO"%>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	UserDTO user = (UserDTO) session.getAttribute("user");
	if(user == null) {
	response.sendRedirect("login.jsp");		//세션에 저장된 정보가 없으면 login페이지로 이동
	return;
	}
 %>
 <%	BookDAO dao = new BookDAO();
 	Map<String, Object> param = new HashMap<String, Object>();
 	String searchField = request.getParameter("searchField");
 	String searchWord = request.getParameter("searchWord");
 	if(searchWord != null) {
 		param.put("searchField", searchField);
 		param.put("searchWord", searchWord);
 	}
 	int totalCount = dao.selectCount(param);
 	List<BookDTO> bookLists = dao.selectList(param);
 	//dao.close();
 %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h2><%= user.getName() %>님 안녕하세요</h2>
		<a href="./edit.jsp"> <button> 회원수정 </button></a>
		<a href="./join.jsp"> <button> 회원삭제 </button></a>
		<a href="./join.jsp"> <button> 대여한 책 </button></a>
		
		
		<form method="get">
			<table border="1" width="90%">
				<tr>
					<td align="center">
						<input type="text" name="searchWord" />
					<input type="submit" value="검색하기" />
					</td>
				</tr>
			</table>	
		</form>
		
		<table border="1" width="90%">
			<tr>
				<th width="80%">제목</th>
				<th width="10%">연령</th>
				<th width="10%">대여희망</th>
			</tr>
			
			<%
				if (bookLists != null && !bookLists.isEmpty()) {
	    		int virtualNum = totalCount; // 게시물 번호 시작값
	    		
	    		for (BookDTO dto : bookLists) {
	    			if(dto.getBooking_yn()==1) {
	    				continue;
	    			}
			%>
			<tr align="center">
	    		<td align="center">
	        		<%= dto.getBname() %> <!-- 제목 -->
	    		</td>
	    		<td align="center"><%= dto.getAge() %></td> <!-- 연령 -->
	    		<td><button type="button" onclick="confirmRental(<%= dto.getBnum() %>)">대여</button></td>
			</tr>
			<%
	    		}
				} else {
			%>
			<tr>
	    		<td colspan="3" align="center">등록된 책이 없습니다.</td>
			</tr>
			<%
				}
			%>
		</table>
		<script>
			function confirmRental(bookId) {
				if(confirm("대여하시겠습니까?")) {
					window.location.href = `rentalServlet?bnum=${bookId}`;
				}  else {
					return false;
				}
			}
		</script>
	</body>
</html>