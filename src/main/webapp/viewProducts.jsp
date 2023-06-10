<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%@page import="Sphone.Model.Product"%>
<%@page import="Sphone.DB.DBConnect"%>
<%@page import="Sphone.DAO.IProductDAO"%>
<%@page import="Sphone.DAO.ProductDAOImpl"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/nvabar.jsp"%>
	
	<%
	int pid = Integer.parseInt (request.getParameter("id"));
	ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConnection());
	Product p = dao.getProductById(pid);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white ">
				<img src="ProductImage/<%=p.getPhoto() %>" style="height: 150px; width: 150px"><br>
				<h4 class ="mt-3">Product Name:<span class ="text-success"><%=p.getProductName() %></span></h4>
				<h4>Brand: <span class ="text-success"><%=p.getBrand() %></span></h4>
				<h4>Price: <span class ="text-success"><%=p.getPrice() %></span></h4>
			</div>
			
			

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=p.getProductName()%></h2>
				
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-sharp fa-solid fa-money-bill fa-3x"></i>
						<p>COD</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-3x"></i>
						<p>Return available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-3x"></i>
						<p>Free Shipping</p>
					</div>

				</div>
				<div class="text-center p-3">
					<a href="" class="btn btn-primary"><i class = "fas fa-cart-plus"></i>Add Cart</a> <a href=""
						class="btn btn-danger">$<%=p.getPrice() %></a>
				</div>
			</div>

		</div>
	</div>

</body>
</html>