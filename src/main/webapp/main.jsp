<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ 
	UserDTO user = (UserDTO) request.getAttribute("user");
	%>
	<a href="./edit.jsp"> <button> 회원수정 </button></a>
	<a href="./join.jsp"> <button> 회원삭제 </button></a>
</body>
</html>