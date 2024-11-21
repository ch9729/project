<%@page import="dto.BookDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ManagerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<BookDTO> bookList = (List<BookDTO>) request.getAttribute("bookList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
        	<th>번호</th>
        	<th>책 제목</th>
        	<th>권장 연령</th>
    	</tr>
    	<% if(bookList != null) {
    		for(BookDTO book : bookList) {%> 
    	
 <tr>
            <td><%= book.getBnum() %></td>
            <td><%= book.getBname() %></td>
            <td><%= book.getBdetail() %></td>
            <td><%= book.getAge() %></td>
            <td>
                <a href="editBook.jsp?bnum=<%= book.getBnum() %>">수정</a>
                <form action="deleteBook" method="post" style="display:inline;">
                    <input type="hidden" name="bnum" value="<%= book.getBnum() %>">
                    <button type="submit">삭제</button>
                </form>
            </td>

    	</tr>
    	<%}
    		}%>
	</table>
</body>
</html>