package controller;

import java.io.IOException;

import dao.ManagerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteUser")
public class UserDeleteServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userNum = Integer.parseInt(req.getParameter("userNum"));
		
		ManagerDAO dao = new ManagerDAO();
		int result = dao.deleteUser(userNum);
		
		result = 1;
		
		resp.sendRedirect("userList");	// 회원 삭제 이후 페이지 리다이렉트
	}
	
	
}
