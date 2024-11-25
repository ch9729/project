<%@page import="dto.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BookDTO book = (BookDTO) request.getAttribute("book");
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
        width: 90%;
        max-width: 600px;
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    h1 {
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }

    p {
    margin-bottom: 10px;
    font-size: 16px;
    color: #555;
    word-wrap: break-word; 
    word-break: break-word; 
    overflow: hidden; 
    white-space: pre-wrap; 
    max-height: 400px;
    overflow-y: auto;
	}

    .back-btn {
        display: inline-block;
        padding: 10px 15px;
        background-color: #d3e3fd;
        color: black;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .back-btn:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
	 <div class="container">
        <h1>책 상세 정보</h1>
        <p><strong>책 제목:</strong> <%= book.getBname() %></p>
        <p><strong>책 설명:</strong> <%= book.getBdetail() %></p>
        <a href="rentalChart" class="back-btn">목록으로 돌아가기</a>
    </div>
</body>
</html>