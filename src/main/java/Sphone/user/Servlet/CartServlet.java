package Sphone.user.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Sphone.DAO.CartDAOImpl;
import Sphone.DAO.ProductDAOImpl;
import Sphone.DB.DBConnect;
import Sphone.Model.Cart;
import Sphone.Model.Product;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int pid = Integer.parseInt (req.getParameter("id"));
			String uid = req.getParameter("email");
			
			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConnection());
			Product p = dao.getProductById(pid);
			
			Cart c = new Cart();
			c.setProductId(pid);
			c.setEmail(uid);
			c.setProductName(p.getProductName());
			c.setBrand(p.getBrand());
			c.setPrice(Double.parseDouble(p.getPrice()));
			c.setTotalPrice(Double.parseDouble(p.getPrice()));
			
			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConnection());
			boolean check = dao2.addCart(c);
			HttpSession session = req.getSession();
			
			if(check)
			{
				session.setAttribute("addCart", "Added to cart");
				resp.sendRedirect("index.jsp");
			}
				
			else
				session.setAttribute("falied", "failed");
			resp.sendRedirect("index.jsp");
				
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
