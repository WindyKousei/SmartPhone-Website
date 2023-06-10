package Sphone.admin.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;


import Sphone.DAO.ProductDAOImpl;
import Sphone.DB.DBConnect;
import Sphone.Model.Product;

@WebServlet("/editProducts")
@MultipartConfig
public class EditProduct extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String ProductName = req.getParameter("ProductName");
			String Brand = req.getParameter("Brand");
			String ProductYear = req.getParameter("ProductYear");
			String Price = req.getParameter("Price");
			String Quantity = req.getParameter("Quantity");
			String ProductCategory = req.getParameter("ProductCategory");
			
			Product p= new Product();
			p.setProductId(id);
			p.setProductName(ProductName);
			p.setBrand(Brand);
			p.setProductYear(ProductYear);
			p.setPrice(Price);
			p.setQuantity(Quantity);
			p.setProductCategory(ProductCategory);
			
			
			
			ProductDAOImpl dao=new ProductDAOImpl(DBConnect.getConnection());
			boolean f=dao.updateEditProducts(p);
			HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg", "Product Update Successfully...");
				resp.sendRedirect("admin/allProduct.jsp");
			}else {
				session.setAttribute("failedMsg", "Something wrong on server...");
				resp.sendRedirect("admin/editProduct.jsp");
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
