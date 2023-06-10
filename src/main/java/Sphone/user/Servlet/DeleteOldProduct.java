package Sphone.user.Servlet;
import java.io.IOException;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Sphone.DAO.ProductDAOImpl;
import Sphone.DB.DBConnect;

@WebServlet("/delete_old_product")
public class DeleteOldProduct  extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 try{
	            String email=req.getParameter("email");
	            int id=Integer.parseInt(req.getParameter("id"));
	            ProductDAOImpl dao=new ProductDAOImpl(DBConnect.getConnection());

	            boolean f = dao.oldProductDelete(email, id);
	            HttpSession session = req.getSession();

	            if(f){
	                session.setAttribute("succMsg", "Your Product Deleted Successfully");
	                resp.sendRedirect("oldProduct.jsp");
	            }
	            else{
	                session.setAttribute("succMsg", "Something went wrong");
	                resp.sendRedirect("oldProduct.jsp");
	            }
	        }
	        catch(Exception e){
	            e.printStackTrace();
	        }
	}

}
