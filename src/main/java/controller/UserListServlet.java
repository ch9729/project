package controller;

import java.io.IOException;
import java.util.List;

import dao.ManagerDAO;
import dto.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/userList")
public class UserListServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ManagerDAO dao = new ManagerDAO();
		List<UserDTO> userList = dao.getUserList();
		
		req.setAttribute("userList", userList);
		req.getRequestDispatcher("userInfo.jsp").forward(req, resp);
	}
	
	
	

}
