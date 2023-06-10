package Sphone.user.Servlet;
import java.io.IOException;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Sphone.DAO.UserDAOImpl;
import Sphone.DB.DBConnect;
import Sphone.Model.User;

@WebServlet("/update_profile")
public class UpdatepProfileServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String FirstName = req.getParameter("FirstName");
			String LastName= req.getParameter("LastName");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
			String address = req.getParameter("address");
			
			User us = new User();
			us.setEmail(email);
			us.setFirstName(FirstName);
			us.setLastName(LastName);
			us.setPhone(phone);
			us.setAddress(address);
			
			HttpSession session = req.getSession();
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConnection());
			boolean check = dao.checkPassword(email, password);
			
			if(check)
			{
				boolean check2 = dao.updateProfile(us);
				if (check2)
				{
					session.setAttribute("succMsg", " Update Successfully!");
					resp.sendRedirect("editProfile.jsp");
				}
				else {
					session.setAttribute("failedMsg", " Please try again");
					resp.sendRedirect("editProfile.jsp");
				}
				
			}else
			{
				session.setAttribute("failedMsg", " Your Password is incorrect, please try again");
				resp.sendRedirect("editProfile.jsp");
				
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
