package controller;

import java.io.IOException;

import dao.ManagerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteBook")
public class BookDeleteServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bnum = Integer.parseInt(req.getParameter("bnum"));
		
		ManagerDAO dao = new ManagerDAO();
		int result = dao.deleteBook(bnum);
		
		result = 1;
		
		resp.sendRedirect("bookList"); 	// 삭제 이후 목록페이지로 리다이렉트
	}
	
	
	

}
