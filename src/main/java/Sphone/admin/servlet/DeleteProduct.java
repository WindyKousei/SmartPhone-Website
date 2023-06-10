package Sphone.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Sphone.DAO.ProductDAOImpl;
import Sphone.DB.DBConnect;

@WebServlet("/delete")
public class DeleteProduct extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			
			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConnection());
			boolean f=dao.deleteProducts(id);
			HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg", "Product Delete Successfully...");
				resp.sendRedirect("admin/allProduct.jsp");
			}else {
				session.setAttribute("failedMsg", "Something wrong on server...");
				resp.sendRedirect("admin/allProduct.jsp");
				
			}
		}catch (Exception e) {
			e.printStackTrace();
			
		}
	}

}
