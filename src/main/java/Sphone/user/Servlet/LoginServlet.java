package Sphone.user.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Sphone.Model.User;

import Sphone.DAO.UserDAOImpl;
import Sphone.DB.DBConnect;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConnection());

			HttpSession session = req.getSession();
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User us = new User();
				us.setFirstName("Admin");

				session.setAttribute("userobj", us);
				resp.sendRedirect("admin/home.jsp");
			} else {

				User us = dao.login(email, password);
				if (us != null) {
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
				} else {
					session.setAttribute("failedMsg", "Email or Password Invalid");
					resp.sendRedirect("login.jsp");
				}

				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
