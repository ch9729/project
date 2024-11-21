package controller;

import java.io.IOException;

import dao.ManagerDAO;
import dao.UserDAO;
import dto.ManagerDTO;
import dto.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet.do")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
        String password = req.getParameter("password");
        ManagerDAO managerDAO = new ManagerDAO();
        ManagerDTO manager = managerDAO.getManagerLogin(id, password);
        
        // 관리자 로그인 성공
        if(manager != null) {	
        	HttpSession session = req.getSession();    
        	session.setAttribute("manager", manager);	// 세션에 관리자 저장
        	resp.sendRedirect("managerPage.jsp");		//해당 페이지로 이동
        			return;
        }
        
        UserDAO userDAO = new UserDAO();
        UserDTO user = userDAO.getUserLogin(id, password);
        
        // 회원 로그인 성공
        if(user != null) {	
        	HttpSession session = req.getSession();  
        	session.setAttribute("user", user);		// 세션에 관리자 저장
        	resp.sendRedirect("userPage.jsp");		//해당 페이지로 이동
        			return;
        }
	}
	
}
