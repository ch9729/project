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
        	<th>번호</th>
        	<th>책 제목</th>
        	<th>권장 연령</th>
    	</tr>
    	<%  %>
    	<tr>
    		<%= manager.getName() %>
    	</tr>
	</table>
</body>
</html>