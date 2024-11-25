<%@page import="dto.BookDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	List<BookDTO> rentalBooks = (List<BookDTO>) request.getAttribute("rentalBooks");
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h2>대여한 목록</h2>
		<form>
			<table>
				<tr>
					<th>제목</th>
					<th>반납</th>
				</tr>
				<% if (rentalBooks != null){
					for(BookDTO book : rentalBooks) {
					%>
					
					<tr>
						<td><a="#"><%= book.getBname() %></a></td>
						<td>
							<form method="get">
								<input type="hidden" name="bnum" value=<%= book.getBnum() %>>
								<button type="submit">반납</button>
							</form>
						</td>
					</tr>
				<%}
    		}%>
				
			</table>
		</form>
	</body>
</html>