package controller;

import java.io.IOException;

import dao.BookDAO;
import dto.BookDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/detail")
public class BookDetailServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bnum = Integer.parseInt(req.getParameter("bnum"));
		
		 BookDAO dao = new BookDAO();
	     BookDTO book = dao.getBookDetail(bnum);
	     
	     if (book != null) {
	            req.setAttribute("book", book);
	            req.getRequestDispatcher("detail.jsp").forward(req, resp);
	        }
	}
	
	

}
