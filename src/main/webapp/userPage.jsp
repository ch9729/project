<%@page import="dto.BookDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.BookDAO"%>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	UserDTO user = (UserDTO) session.getAttribute("user");
	if(user == null) {
	response.sendRedirect("login.jsp");		//세션에 저장된 정보가 없으면 login페이지로 이동
	return;
	}
 %>
 <%	BookDAO dao = new BookDAO();
 	Map<String, Object> param = new HashMap<String, Object>();
 	String searchField = request.getParameter("searchField");
 	String searchWord = request.getParameter("searchWord");
 	if(searchWord != null) {
 		param.put("searchField", searchField);
 		param.put("searchWord", searchWord);
 	}
 	int totalCount = dao.selectCount(param);
 	List<BookDTO> bookLists = dao.selectList(param);
 	//dao.close();
 %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 대시보드</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
        	background-image: url("./img/main.jpg");
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 80%;
            max-width: 1200px;
            background: white;
            border-radius: 10px;
            padding: 20px 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h2 {
            font-size: 24px;
            color: #333;
        }

        .header .actions {
            margin-top: 10px;
        }

        .header button {
            padding: 10px 15px;
            margin: 5px;
            font-size: 14px;
            color: black;
            background-color: #d3e3fd;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .header button:hover {
            background-color: #0056b3;
        }

        .form-container {
            margin-bottom: 20px;
        }

        .form-container select,
        .form-container input[type="text"],
        .form-container input[type="submit"] {
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .table-container {
            width: 100%;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th,
        table td {
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

        table tr:nth-child(odd) {
            background-color: #ffffff;
        }

        table button {
            padding: 5px 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        table button:hover {
            background-color: #218838;
        }

        .no-data {
            text-align: center;
            font-size: 16px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2><%= user.getName() %>님 안녕하세요!</h2>
            <div class="actions">
                <a href="editInfo"><button>회원수정</button></a>
                <a href="#" onclick="deleteUser();"><button>회원삭제</button></a>
                <a href="rentalChart"><button>대여한 책</button></a>
                <a href="logoutServlet"><button>로그아웃</button></a>
            </div>
        </div>

        <div class="form-container">
            <form method="get">
                <select name="searchField" required>
                    <option value="bname" selected>책 제목</option>
                    <option value="bdetail">책 설명</option>
                </select>
                <input type="text" name="searchWord" placeholder="검색어를 입력하세요" required />
                <input type="submit" value="검색하기" />
            </form>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>제목</th>
                        <th>연령</th>
                        <th>대여희망</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (bookLists != null && !bookLists.isEmpty()) { 
                        for (BookDTO dto : bookLists) { 
                            if (dto.getBooking_yn() == 1) {
                                continue;
                            }
                    %>
                    <tr data-id="<%= dto.getBnum() %>">
                        <td><%= dto.getBname() %></td>
                        <td><%= dto.getAge() %></td>
                        <td><button type="button" onclick="confirmRental(<%= dto.getBnum() %>)">대여</button></td>
                    </tr>
                    <% } 
                    } else { %>
                    <tr>
                        <td colspan="3" class="no-data">등록된 책이 없습니다.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        function confirmRental(bookId) {
            if (confirm("대여하시겠습니까?")) {
                fetch("rentServlet?bnum=" + bookId, {
                    method: "GET",
                })
                    .then((response) => response.text())
                    .then((result) => {
                        if (result.trim() === "success") {
                            alert("대여가 되었습니다.");
                            location.reload(); // 페이지 새로고침
                        } else {
                            alert("대여에 실패했습니다. 다시 시도해주세요.");
                        }
                    });
            }
        }

        function deleteUser() {
            if (confirm("정말 삭제하시겠습니까?")) {
                window.location.href = "deleteInfo";
            }
        }
    </script>
</body>
</html>