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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	@Override
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String FirstName = req.getParameter("FirstName");
			String LastName= req.getParameter("LastName");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
			String address = req.getParameter("address");
			String check = req.getParameter("check");

			// System.out.println(name+" "+email+" "+phno+" "+password+" "+check+" ");
			User us = new User();
			us.setFirstName(FirstName);
			us.setLastName(LastName);
			us.setEmail(email);
			us.setPassword(password);
			us.setPhone(phone);
			us.setAddress(address);

			HttpSession session = req.getSession();

			if (check != null) {
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConnection());
				boolean f = dao.register(us);
				if (f) {
					// System.out.println("User Register Success!");
					session.setAttribute("succMsg", " Registration Successfully!");
					resp.sendRedirect("register.jsp");
				} else {

					// System.out.println("Something wrong on server!");

					session.setAttribute("failedMsg", "Something wrong on server!");
					resp.sendRedirect("register.jsp");
				}
			} else {
				// System.out.println("Please Check Agree & Terms Condition");
				session.setAttribute("failedMsg", "Please Check Agree & Terms Condition");
				resp.sendRedirect("register.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
