<%@page import="dto.ManagerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    ManagerDTO manager = (ManagerDTO) session.getAttribute("manager");
    if(manager == null) {
        response.sendRedirect("login.jsp"); // 세션에 저장된 정보가 없으면 login 페이지로 이동
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Arial', sans-serif;
    }

    body {
        background-color: #f4f4f4;
        background-image: url("./img/main.jpg");
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .admin-container {
        background: white;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        text-align: center;
        width: 400px;
    }

    .admin-container h2 {
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }

    .admin-container button {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        background-color: #d3e3fd;
        color: black;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .admin-container button:hover {
        background-color: #0056b3;
    }

    .admin-container a {
        text-decoration: none;
    }
</style>
</head>
<body>
    <div class="admin-container">
        <h2><%= manager.getName() %>님, 환영합니다!</h2>
        <a href="bookList"><button>책 정보 관리</button></a>
        <a href="userList"><button>회원 정보 관리</button></a>
        <a href="logoutServlet"><button>로그아웃</button></a>
    </div>
</body>
</html>
