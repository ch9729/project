<%@page import="dto.ManagerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	ManagerDTO manager = (ManagerDTO) session.getAttribute("manager");
	if(manager == null) {
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
	<h2><%= manager.getName() %>님 로그인 입니다.</h2>
	<a href="bookList"><button>책 정보</button></a>
	<a href="userList"><button>회원정보</button></a>
</body>
</html>