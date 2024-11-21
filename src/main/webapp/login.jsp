<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Arial', sans-serif;
    }

    body {
    	background-image: url("./img/main.jpg");
        background-color: #f4f4f4;
        display: flex;
        justify-content: center; /* 수평 중앙 정렬 */
        align-items: center;    /* 수직 중앙 정렬 */
        height: 100vh;          /* 화면 전체 높이 */
    }

    .form-container {
        background: white;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        width: 400px;
        text-align: center;
    }

    .form-container h1 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }

    .form-container label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
        color: #555;
    }

    .form-container input[type="text"],
    .form-container input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
    }

    .form-container input[type="submit"] {
        width: 100%;
        padding: 12px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .form-container input[type="submit"]:hover {
        background-color: #45a049;
    }

    .form-container small {
        display: block;
        margin-top: 10px;
        color: red;
    }
</style>
</head>
<body>
	<%-- <form method="post" action="${pageContext.request.contextPath}/LoginServlet.do">
	아이디 : <input type="text" name="id"><br>
	비밀번호 : <input type="password" name="password">
	<input type="submit" value="로그인">
	</form> --%>
	
	<div class="form-container">
        <h1>로그인</h1>
        <form method="post" action="${pageContext.request.contextPath}/LoginServlet.do">
            <label for="id">아이디:</label>
            <input type="text" id="id" name="id" placeholder="아이디를 입력하세요" required>

            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>

            <input type="submit" value="로그인">
        </form>
        <small id="error-message">
            <%-- 서버에서 에러 메시지를 전달받으면 표시 --%>
            <%= (request.getAttribute("errorMessage") != null) ? request.getAttribute("errorMessage") : "" %>
        </small>
    </div>
</body>
</html>