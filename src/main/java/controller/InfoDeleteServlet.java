package controller;

import java.io.IOException;

import dao.UserDAO;
import dto.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteInfo")
public class InfoDeleteServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		UserDTO user = (UserDTO) session.getAttribute("user");
		
		UserDAO dao = new UserDAO();
		int result = dao.deleteUser(user);
		
		if(result > 0) {
			session.invalidate();
			resp.sendRedirect("UserPage?message=deleteSuccess");
		}
	}
	
	

}
