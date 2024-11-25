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
	<style>
    body {
    	background-image: url("./img/main.jpg");
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .container {
        background: white;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        max-width: 400px;
        width: 100%;
        text-align: center;
    }

    .container h1 {
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }

    label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
        color: #555;
        text-align: left;
    }

    input[type="password"], input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
    }

    .phone-container {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .phone-container span {
        font-size: 16px;
        font-weight: bold;
        margin-bottom: 0; /* 중앙에 정렬 */
        line-height: 1; /* 텍스트 높이 조정 */
    }

    .phone-container input {
        flex: 1;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
    }

    button {
        width: 100%;
        padding: 12px;
        background-color: #d3e3fd;
        color: black;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #45a049;
    }
</style>
	</head>
	<body>
     <div class="container">
        <h1>회원 정보 수정</h1>
        <form method="post" action="${pageContext.request.contextPath}/editInfo">
            <input type="hidden" name="id" value="<%=user.getId() %>">
            
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" value="<%= user.getPassword() %>">
            
            <label for="phone">전화번호</label>
            <div class="phone-container">
                <span>010-</span>
                <input type="text" id="phone2" name="phone2" placeholder="중간 번호" value="<%= user.getPhone2() %>">
                <input type="text" id="phone3" name="phone3" placeholder="마지막 번호" value="<%= user.getPhone3() %>">
            </div>
            
            <button type="submit">수정하기</button>
        </form>
    </div>
</body>
</html>