package Sphone.user.Servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Sphone.DAO.ProductDAOImpl;
import Sphone.DB.DBConnect;
import Sphone.Model.Product;

@WebServlet("/add_old_product")
@MultipartConfig
public class AddOldProduct extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String ProductName=req.getParameter("ProductName");
			String Brand=req.getParameter("Brand");
			String ProductYear=req.getParameter("Year");
			String Price=req.getParameter("Price");
			String Quantity=req.getParameter("Quantity");
			String ProductCategory=req.getParameter("Category");
			String Description=req.getParameter("Description");
			Part part=req.getPart("Photo");
			String fileName=part.getSubmittedFileName();
			String Email = req.getParameter("user");
			String Status = "Old";
			
			
			
			Product p = new Product(ProductName,Brand,ProductYear,Price,Quantity,fileName,ProductCategory, Description, Status, Email);
			
			ProductDAOImpl dao=new ProductDAOImpl(DBConnect.getConnection());
			boolean  f =dao.addProduct(p);
			HttpSession session= req.getSession();
			if(f)
			{
				String path=getServletContext().getRealPath("")+"ProductImage";
				File file =new File(path);
				part.write(path + File.separator + fileName);
				session.setAttribute("succMsg", "product add successfully!");
				resp.sendRedirect("sellProduct.jsp");
			}else {
				session.setAttribute("failedMsg","Something wrong on Server!");
				resp.sendRedirect("sellProduct.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
