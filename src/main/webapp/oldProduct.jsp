<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="Sphone.DB.DBConnect"%>
<%@page import="Sphone.DAO.ProductDAOImpl"%>
<%@page import="Sphone.Model.Product"%>
<%@page import="Sphone.Model.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OldBook</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/nvabar.jsp"%>

	<c:if test="${not empty succMsg}">
		<div class="alert alert-success text-center">${succMsg}</div>

		<c:remove var="succMsg" scope="session" />
	</c:if>
	<div class="row">
		<div class="container p-5">
			<table class="table table-striped">
				<thead class="bg-primary text-white">
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
					User u = (User) session.getAttribute("userobj");
					String email = u.getEmail();
					ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConnection());
					List<Product> list = dao.getProductByOld(email);
					for (Product p : list) {
					%>
					<tr>
						<td><%=p.getProductId()%></td>
						<td><img src="ProductImage/<%=p.getPhoto()%>"
							style="width: 50px; height: 50Px;"></td>
						<td><%=p.getProductName()%></td>
						<td><%=p.getBrand()%></td>
						<td><%=p.getProductYear()%></td>
						<td><%=p.getPrice()%></td>
						<td><%=p.getQuantity()%></td>
						<td><%=p.getProductCategory()%></td>
						<td><a
							href="delete_old_product?email=<%=email%>&&id=<%=p.getProductId()%>"
							class="btn btn-sm btn-danger">Delete</a></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>