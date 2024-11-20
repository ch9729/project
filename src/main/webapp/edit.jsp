<%@page import="dto.UserDTO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전달받은 id로 회원 조회
	String id = request.getParameter("id");
	UserDAO userDAO = new UserDAO();
	UserDTO user = userDAO.getUserById(id);	//id 정보 가져오기
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원정보 수정</h2>
	<form method="post" action="UpdateServlet.do">
        <label for="id">아이디:</label>
        <input type="text" name="id" id="id" value="<%= user.getId() %>" readonly>

        <label for="password">비밀번호:</label>
        <input type="password" name="password" id="password" value="<%= user.getPassword() %>">

        <label for="name">이름:</label>
        <input type="text" name="name" id="name" value="<%= user.getName() %>">

        <label for="rrn1">주민등록번호:</label>
        <input type="text" name="rrn1" id="rrn1" value="<%= user.getRrn1() %>" maxlength="6"> -
        <input type="text" name="rrn2" id="rrn2" value="<%= user.getRrn2() %>" maxlength="7">

        <label for="phone1">휴대번호:</label>
        <select name="phone1" id="phone1">
            <option value="010" <% if (user.getPhone1() == 10) { %>selected<% } %>>010</option>
            <option value="011" <% if (user.getPhone1() == 11) { %>selected<% } %>>011</option>
            <option value="016" <% if (user.getPhone1() == 16) { %>selected<% } %>>016</option>
            <option value="017" <% if (user.getPhone1() == 17) { %>selected<% } %>>017</option>
        </select> -
        <input type="text" name="phone2" id="phone2" value="<%= user.getPhone2() %>" maxlength="4"> -
        <input type="text" name="phone3" id="phone3" value="<%= user.getPhone3() %>" maxlength="4">

        <button type="submit">회원정보 수정</button>
    </form>
</body>
</html>