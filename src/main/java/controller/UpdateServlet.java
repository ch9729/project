package controller;

import java.io.IOException;

import dao.UserDAO;
import dto.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateServlet.do")
public class UpdateServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

        // 폼 데이터 가져오기
        String id = req.getParameter("id");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        int rrn1 = Integer.parseInt(req.getParameter("rrn1"));
		int rrn2 = Integer.parseInt(req.getParameter("rrn2"));
		int phone1 = Integer.parseInt(req.getParameter("phone1"));
		int phone2 = Integer.parseInt(req.getParameter("phone2"));
		int phone3 = Integer.parseInt(req.getParameter("phone3"));

        // UserDTO에 데이터 저장
        UserDTO userDTO = new UserDTO();
        userDTO.setId(id);
        userDTO.setPassword(password);
        userDTO.setName(name);
        userDTO.setRrn1(rrn1);
        userDTO.setRrn2(rrn2);
        userDTO.setPhone1(phone1);
        userDTO.setPhone2(phone2);
        userDTO.setPhone3(phone3);

        // UserDAO를 통해 업데이트
        UserDAO userDAO = new UserDAO();
        int result = userDAO.updateUser(userDTO);

        // 결과 처리
        if (result > 0) {
            resp.getWriter().write("<script>alert('회원정보 수정 성공!'); location.href='main.jsp';</script>");
        }
	}
	
	
	
}
