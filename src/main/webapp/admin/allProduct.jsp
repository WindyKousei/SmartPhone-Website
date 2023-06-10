<%@page import="Sphone.Model.Product"%>
<%@page import="Sphone.DB.DBConnect"%>
<%@page import="Sphone.DAO.IProductDAO"%>
<%@page import="Sphone.DAO.ProductDAOImpl"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Product</title>
<%@include file="style.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h3 class="text-center">All Products</h3>

	<c:if test="${not empty succMsg }">
		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg}">
		<p class="text-center text-danger">${failedMsg}</p>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<table class="table table-striped ">
		<thead class="bg-dark text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Product Name</th>
				<th scope="col">Brand</th>
				<th scope="col">Product Year</th>
				<th scope="col">Price</th>
				<th scope="col">Quantity</th>
				<th scope="col">Category</th>
				<th scope="col">Delete/Edit</th>
			</tr>
		</thead>
		<tbody>
			<%
			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConnection());
			List<Product> list = dao.getAllProducts();
			for (Product p : list) {
			%>
			<tr>
				<td><%=p.getProductId()%></td>
				<td><img src="../ProductImage/<%=p.getPhoto()%>"
					style="width: 50px; height: 50Px;"></td>
				<td><%=p.getProductName()%></td>
				<td><%=p.getBrand()%></td>
				<td><%=p.getProductYear()%></td>
				<td><%=p.getPrice()%></td>
				<td><%=p.getQuantity()%></td>
				<td><%=p.getProductCategory()%></td>
				<td><a href="editProducts.jsp?id=<%=p.getProductId()%>"
					class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i>Edit</a> 
					<a href="../delete?id=<%=p.getProductId()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>Delete</a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>