<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.BookDAO"%>
<%@page import="dto.BookDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ManagerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<BookDTO> bookList = (List<BookDTO>) request.getAttribute("bookList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
        	<th>책 제목</th>
        	<th>권장 연령</th>
    	</tr>
    	<% if(bookList != null) {
    		for(BookDTO book : bookList) {%> 
    	
 		<tr>
            <td><%= book.getBname() %></td>
            <td><%= book.getAge() %></td>
            <td>
            	<form method="post" action="deleteBook">
            		<input type="hidden" name="bnum" value="<%=book.getBnum() %>">
            		<button type="submit" class="delete-btn">삭제</button>
            	</form>
            </td>

    	</tr>
    	<%}
    		}%>
	</table>
	<form method="get" action="${pageContext.request.contextPath}/addBook">
		<!-- <input type="hidden" name="age" value=""> -->
		<button type="submit" class="add-btn">책 추가</button>
	</form>
	
</body>
</html>