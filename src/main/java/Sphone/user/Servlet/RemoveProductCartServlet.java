package Sphone.user.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Sphone.DAO.CartDAOImpl;
import Sphone.DB.DBConnect;

@WebServlet("/removeProduct")
public class RemoveProductCartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			int pid = Integer.parseInt(req.getParameter("id"));
			String email = req.getParameter("email");
			int cid = Integer.parseInt(req.getParameter("cart_id"));
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnection());
			boolean check = dao.deleteProduct(pid, email, cid);
			HttpSession session = req.getSession();
			
			if(check)
			{
				session.setAttribute("succMsg", "Remove Successfully");
				resp.sendRedirect("checkout.jsp");
			}
			else
			{
				session.setAttribute("failedMsg", "Remove was Failed");
				resp.sendRedirect("checkout.jsp");
			}
			
		}catch(Exception e)
		{
			
		}
	}

}
