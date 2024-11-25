<%@page import="dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    table th, table td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
    }

    table th {
        background-color: #007BFF;
        color: white;
    }

    table tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    table tr:hover {
        background-color: #f1f1f1;
    }

     .btn {
        display: inline-block;
        padding: 10px 15px;
        background-color: #d3e3fd;
        color: black;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
        text-align: center;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }

    .btn:hover {
        background-color: #0056b3;
    }

    .delete-btn {
        background-color: #dc3545;
    }

    .delete-btn:hover {
        background-color: #c82333;
    }

    .add-btn {
        margin-top: 10px;
    }
    .back-btn {
        margin-bottom: 10px;
        margin-right: 10px;
    }
</style>
<%
	List<UserDTO> userList = (List<UserDTO>) request.getAttribute("userList");
%>
</head>
<body>
    <div class="container">
        <h1>회원 목록 관리</h1>
         <div class="action-buttons">
            <a href="ManagerPage"><button class="btn back-btn">이전 페이지로</button></a>
        </div>
        <table>
            <tr>
                <th>아이디</th>
                <th>비밀번호</th>
                <th>이름</th>
                <th>주민번호</th>
                <th>휴대번호</th>
                <th>작업</th>
            </tr>
            <% if (userList != null) {
                for (UserDTO user : userList) { %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getPassword() %></td>
                <td><%= user.getName() %></td>
                <td><%= user.getRrn1() %>-<%= user.getRrn2() %></td>
                <td><%= user.getPhone1() %>-<%= user.getPhone2() %>-<%= user.getPhone3() %></td>
                <td>
                    <form method="post" action="deleteUser" style="margin: 0;">
                        <input type="hidden" name="userNum" value="<%= user.getUserNum() %>">
                        <button type="submit" class="btn delete-btn">삭제</button>
                    </form>
                </td>
            </tr>
            <% } 
            } else { %>
            <tr>
                <td colspan="6">등록된 회원이 없습니다.</td>
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>