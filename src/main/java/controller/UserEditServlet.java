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

@WebServlet("/editInfo")
public class UserEditServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("edit.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserDTO user= (UserDTO) session.getAttribute("user");
		
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		int phone2 = Integer.parseInt(req.getParameter("phone2"));
		int phone3 = Integer.parseInt(req.getParameter("phone3"));
		
		user.setPassword(password);
		user.setPhone2(phone2);
		user.setPhone3(phone3);
		
		UserDAO dao = new UserDAO();
		int result = dao.updateUser(user);
		
		if(result > 0) {
			session.setAttribute("user", user);
		}
		resp.sendRedirect("UserPage");
	}
	
	
	
}
