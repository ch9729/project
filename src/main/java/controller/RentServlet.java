package controller;

import java.io.IOException;

import dao.UserDAO;
import dto.BookDTO;
import dto.RentalDTO;
import dto.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/rentServlet")
public class RentServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserDTO user = (UserDTO) session.getAttribute("user");
		String bnumParam = req.getParameter("bnum");
		
		int bnum = Integer.parseInt(bnumParam);
		
		int userNum = user.getUserNum();
		
		UserDAO dao = new UserDAO();
		boolean success = dao.rentBook(userNum, bnum);

		resp.sendRedirect("UserPage");
	}
	
}
