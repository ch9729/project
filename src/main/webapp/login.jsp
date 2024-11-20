<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/LoginServlet.do">
	아이디 : <input type="text"><br>
	비밀번호 : <input type="password">
	<input type="submit" value="로그인">
	</form>
</body>
</html>