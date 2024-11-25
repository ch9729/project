package controller;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/returnServlet")
public class ReturnServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int rentalNum = Integer.parseInt(req.getParameter("rentalNum"));
		int bnum = Integer.parseInt(req.getParameter("bnum"));
		
		UserDAO dao = new UserDAO();
		int result = dao.returnRental(rentalNum, bnum);
	
		if(result > 0) {
			resp.getWriter().write("success");
	
		}
	}
}
