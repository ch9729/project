package controller;

import java.io.IOException;
import java.util.List;

import dao.ManagerDAO;
import dto.BookDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/bookList")
public class BookListServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	ManagerDAO dao = new ManagerDAO();
	List<BookDTO> bookList = dao.getBookList();
	
	req.setAttribute("bookList", bookList);
	req.getRequestDispatcher("bookInfo.jsp").forward(req, resp);
	}
	
}
