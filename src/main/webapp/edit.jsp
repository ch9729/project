<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	UserDTO user = (UserDTO) session.getAttribute("user");

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<form method="post" action="${pageContext.request.contextPath}/editInfo">
			<input type="hidden" name="id" value="<%=user.getId() %>">
			
			<label for="password">비밀번호</label>
			<input type="password" id="password" name="password" value="<%= user.getPassword() %>">
			
			<label for="phone">전화번호</label>
			<input type="text" id="phone" name ="phone2" value="<%= user.getPhone2() %>">
			<input type="text" id="phone" name ="phone3" value="<%= user.getPhone3() %>">
			
			<button type="submit">수정하기</button>
		</form>
	</body>
</html>