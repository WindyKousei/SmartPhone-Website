<%@page import="Sphone.DB.DBConnect"%>
<%@page import="Sphone.DAO.ProductDAOImpl"%>
<%@page import="Sphone.Model.Product"%>
<%@page import="Sphone.Model.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SamSung SmartPhone</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>

	<%@include file="all_component/nvabar.jsp"%>
	<%
	User u = (User)session.getAttribute("userobj");
	%>
	<h3 class ="text-center">Apple SmartPhone</h3>
	<div class="container-fulid">
		<div class="row">

			<%
					ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConnection());
					List<Product> Slist = dao.getAllApple();
					for (Product p : Slist) {
					%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt=" " src="ProductImage/<%=p.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=p.getProductName()%></p>
						<p><%=p.getPrice()%></p>
						<p>
							Quantity:<%=p.getQuantity()%></p>
						<div class="row ">
							<%
							if (u == null){
							%> 
							<a href="login.jsp" class="btn btn-danger btn-sm"> Add Cart </a>
							<%
							} else{
								%>
							<a href="cart?id=<%=p.getProductId()%>&&email=<%=u.getEmail()%>" class="btn btn-danger btn-sm"> Add Cart </a>
							<%
							}
							%><a
								href="viewProducts.jsp?id=<%=p.getProductId()%>" class="btn btn-success btn-sm ml-5"> View Detail</a> <a
								href="" class="btn btn-danger btn-sm ml-5"> $<%=p.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>

			<%
					}
					%>
			</div>
		</div>


</body>
</html>