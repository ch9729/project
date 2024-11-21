<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/addBook">
		<label for="bname">책이름</label>
		<input type="text" id="bname" name="bname" placeholder="책 이름을 입력해주세요.">
	
		<label for="bdetail">책내용</label>
		<input type="textarea" id="bdetail" name="bdetail" placeholder="내용을 입력해주세요.">

		<label for="age">연령</label>
		<input type="number" id="age" name="age" placeholder="연령을 적어주세요.">
	
		<input type="submit" value="저장">
	</form>
</body>
</html>