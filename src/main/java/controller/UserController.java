package controller;

import java.io.IOException;

import org.apache.catalina.User;

import dao.UserDAO;
import dto.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet.do")
public class UserController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		int rrn1 = Integer.parseInt(req.getParameter("rrn1"));
		int rrn2 = Integer.parseInt(req.getParameter("rrn2"));
		int phone1 = Integer.parseInt(req.getParameter("phone1"));
		int phone2 = Integer.parseInt(req.getParameter("phone2"));
		int phone3 = Integer.parseInt(req.getParameter("phone3"));
	
		UserDTO userDTO = new UserDTO();
		userDTO.setId(id);
		userDTO.setPassword(password);
		userDTO.setName(name);
		userDTO.setRrn1(rrn1);
		userDTO.setRrn2(rrn2);
		userDTO.setPhone1(phone1);
		userDTO.setPhone2(phone2);
		userDTO.setPhone3(phone3);
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.insertUser(userDTO);
		
		if(result > 0) {
			req.getRequestDispatcher("main.jsp").forward(req, resp);
		} else {
			resp.getWriter().write("회원가입 실패");
		}
	}
	
	
}
