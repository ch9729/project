<%@page import="dto.RentalDTO"%>
<%@page import="dto.BookDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    List<RentalDTO> rentalBooks = (List<RentalDTO>) request.getAttribute("rentalBooks");
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>대여한 목록</title>
        <style>
        body {
        	background-image: url("./img/main.jpg");
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .container {
            width: 90%;
            max-width: 800px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        .button-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .button-group button {
            padding: 10px 20px;
            border: none;
            background-color: #d3e3fd;
            color: black;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .button-group button:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        td button {
            padding: 5px 10px;
            border: none;
            background-color: #e74c3c;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        td button:hover {
            background-color: #c0392b;
        }

        .empty-message {
            text-align: center;
            color: #888;
            font-size: 16px;
            padding: 20px 0;
        }
        
        a {
        	text-decoration: none;
        	color: #007BFF;
        	font-weight: bold;
        	transition: color 0.3s ease;
        }
        
        a:hover {
        	color: #0056b3;
        	text-decoration: underline;
        }
    </style>
    </head>
    <body>
        <div class="container">
        <h2>대여한 목록</h2>
        <div class="button-group">
            <a href="UserPage"><button>이전 페이지로</button></a>
        </div>
        <table>
            <tr>
                <th>제목</th>
                <th>반납</th>
            </tr>
            <% if (rentalBooks != null && !rentalBooks.isEmpty()) { 
                for (RentalDTO rental : rentalBooks) {
                    BookDTO book = rental.getBook();
            %>
            <tr>
                <td><a href="detail?bnum=<%= book.getBnum()%>"><%= book.getBname() %></a></td>
                <td>
                    <button type="button" onclick="confirmReturn(<%= rental.getRentalNum() %>, <%= book.getBnum() %>)">반납</button>
                </td>
            </tr>
            <% 
                } 
            } else { 
            %>
            <tr>
                <td colspan="2" class="empty-message">대여한 책이 없습니다.</td>
            </tr>
            <% } %>
        </table>
    </div>

        <script>
            function confirmReturn(rentalNum, bnum) {
                if (confirm("반납하시겠습니까?")) {
                    fetch("returnServlet?rentalNum=" + rentalNum + "&bnum=" + bnum, { method: 'GET' })
                        .then(response => response.text())
                        .then(result => {
                            if (result.trim() === 'success') {
                                alert("반납되었습니다.");
                                location.reload(); // 페이지 새로고침
                            } else {
                                alert("반납에 실패했습니다.");
                            }
                        });
                }
            }
        </script>
    </body>
</html>
