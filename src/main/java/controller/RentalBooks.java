package controller;

import java.io.IOException;
import java.util.List;

import dao.UserDAO;
import dto.BookDTO;
import dto.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/rentalChart")
public class RentalBooks extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserDTO user = (UserDTO) session.getAttribute("user");
		
		UserDAO dao = new UserDAO();
		List<BookDTO> rentalBooks = dao.getRentalBooks(user.getUserNum());
		
		req.setAttribute("rentalBooks", rentalBooks);
		req.getRequestDispatcher("rentPage.jsp").forward(req, resp);
	}
	

}
