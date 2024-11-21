<%@page import="dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	List<UserDTO> userList = (List<UserDTO>) request.getAttribute("userList");
%>
</head>
<body>
	<table>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>주민번호</th>
			<th>휴대번호</th>
		</tr>
		<% if(userList != null) {
			for(UserDTO user : userList) {
		%>
		<tr>
			<td><%= user.getId() %></td>
			<td><%= user.getPassword() %></td>
			<td><%= user.getName() %></td>
			<td><%= user.getRrn1() + "-" + user.getRrn2() %></td>
			<td><%= user.getPhone1() + "-" + user.getPhone2() + "-" + user.getPhone3()%></td>
			<td>
                <form method="post" action="deleteUser">
                    <input type="hidden" name="userNum" value="<%= user.getUserNum() %>">
                    <button type="submit" class="delete-btn">삭제</button>
                </form>
            </td>
		</tr>
		<%}
    		}%>
	</table>
</body>
</html>