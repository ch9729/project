package controller;

import java.io.IOException;

import dao.ManagerDAO;
import dto.BookDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addBook")
public class BookAddServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("addBook.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bname = req.getParameter("bname");
		String bdetail = req.getParameter("bdetail");
		int age = Integer.parseInt(req.getParameter("age"));
		ManagerDAO dao = new ManagerDAO();
		BookDTO dto = new BookDTO();
		
		dto = dao.addBook(bname, bdetail, age);
		resp.sendRedirect("bookList");
	}

}