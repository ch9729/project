<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	UserDTO user = (UserDTO) session.getAttribute("user");
	if(user == null) {
	response.sendRedirect("login.jsp");		//세션에 저장된 정보가 없으면 login페이지로 이동
	return;
	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%= user.getName() %></h2>
</body>
</html>