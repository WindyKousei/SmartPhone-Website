<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Sphone.DB.DBConnect"%>
<%@page import="Sphone.DAO.ProductDAOImpl"%>
<%@page import="Sphone.DAO.OrderDAOImpl"%>
<%@page import="Sphone.Model.Product"%>
<%@page import="Sphone.Model.User"%>
<%@page import="Sphone.Model.Order"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Order</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@include file="all_component/nvabar.jsp"%>
<div class = "container p-1">
<h3 class = "text-center text-primary">All your Order</h3>
<table class="table table-striped mt-3">
  <thead class ="bg-primary text-white">
    <tr>
      <th scope="col">OrderId</th>
      <th scope="col">First Name</th>
      <th scope="col">Last Name</th>
      <th scope="col">Product Name</th>
      <th scope="col">Brand</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
  
  <% 
  User u =(User)session.getAttribute("userobj");
  OrderDAOImpl dao = new OrderDAOImpl(DBConnect.getConnection());
  List<Order> list = dao.getProduct(u.getEmail());
  for (Order o: list)
  {%>
  <tr>
      <th scope="row"><%=o.getOrderId()%></th>
      <td><%=o.getFirstName()%></td>
      <td><%=o.getLastName()%></td>
      <td><%=o.getProductName()%></td>
      <td><%=o.getBrand()%></td>
      <td><%=o.getPrice()%></td>
      <td><%=o.getPayment()%></td>
    </tr>
	  
  <%}
  %>
    
   
  </tbody>
</table>

</div>

</body>
</html>