<%@page import="dto.ManagerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	ManagerDTO manager = (ManagerDTO) session.getAttribute("manager");
	if(manager == null) {
		out.println("Manager is not in the session.");
		//response.sendRedirect("login.jsp");		//세션에 저장된 정보가 없으면 login페이지로 이동
	}else {
		out.println("Manager found: " + manager.getName());
	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%= manager.getName() %></h2>
</body>
</html>