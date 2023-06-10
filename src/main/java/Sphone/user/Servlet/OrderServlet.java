package Sphone.user.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Sphone.DAO.CartDAOImpl;
import Sphone.DAO.OrderDAOImpl;
import Sphone.DB.DBConnect;
import Sphone.Model.Cart;
import Sphone.Model.Order;

@WebServlet("/order")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			String id = req.getParameter("email");
			String FirstName = req.getParameter("FirstName");
			String LastName = req.getParameter("LastName");
			String Phone = req.getParameter("Phone");
			String Address = req.getParameter("Address");
			String Email= req.getParameter("Email");
			String Payment= req.getParameter("Payment");
			
			
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnection());
			List<Cart> list = dao.getProductbyUser(id);
			
			if(list.isEmpty())
			{
				session.setAttribute("failedMsg", "Buy something to checkout");
				resp.sendRedirect("checkout.jsp");
			}
			else
			{
				OrderDAOImpl dao2 = new OrderDAOImpl(DBConnect.getConnection());
				int i = dao2.getOrderNumber();
				
				Order o = null;
				
				ArrayList<Order> orderList = new ArrayList<Order>();
				for (Cart c:list)
				{
					o = new Order();
					
					o.setOrderId("ORD-VN0"+i);
					o.setFirstName(FirstName);
					o.setLastName(LastName);
					o.setPhone(Phone);
					o.setAddress(Address);
					o.setEmail(Email);
					o.setBrand(c.getBrand());
					o.setProductName(c.getProductName());
					o.setPrice(c.getPrice());
					o.setPayment(Payment);
					i++;
					orderList.add(o);
					
					
					
				}
				
				if ("NoSelect".equals(Payment))
				{
					session.setAttribute("failedMsg", "Please Choose Payment Type");
					resp.sendRedirect("checkout.jsp");
				}
				else
				{
					boolean check = dao2.saveOrder(orderList);
					if(check)
					{
						resp.sendRedirect("orderSuccess.jsp");
					}
					else
					{
						session.setAttribute("failedMsg", "Failed To Process Your Order");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}
			
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	

}
