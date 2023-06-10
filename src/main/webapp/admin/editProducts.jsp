<%@page import="Sphone.Model.Product"%>
<%@page import="Sphone.DB.DBConnect"%>
<%@page import="Sphone.DAO.ProductDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Edit Books</title>
<%@include file="style.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Products</h4>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConnection());
						Product p = dao.getProductById(id);
						%>
						<td>
							<center>
								<img src="../ProductImage/<%=p.getPhoto()%>"
									style="width: 100px; height: 100Px;">
							</center>
						</td>

						<form action="../editProducts" method="post">
							<input type="hidden" name="id" value="<%=p.getProductId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Product Name*</label> <input
									name="ProductName" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailhelp"
									value="<%=p.getProductName()%>">
							</div>

							<div class="form-group">
								<label for="inputState">Brand*</label> <select id="inputState"
									name="Brand" class="form-control">
									<%
									if ("SamSung".equals(p.getBrand())) {
									%>
									<option value="SamSung">SamSung</option>
									<option value="Apple">Apple</option>
									<option value="XiaoMi">XiaoMi</option>
									<%
									} else if ("Apple".equals(p.getBrand())) {
									%>
									<option value="Apple">Apple</option>
									<option value="SamSung">SamSung</option>
									<option value="XiaoMi">XiaoMi</option>

									<%
									} else {
									%>
									<option value="XiaoMi">XiaoMi</option>
									<option value="Apple">Apple</option>
									<option value="SamSung">SamSung</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Product Year*</label> <input
									name="ProductYear" type="number" class="form-control"
									id="exampleInputPassword1" value="<%=p.getProductYear()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									name="Price" type="number" class="form-control"
									id="exampleInputPassword1" value="<%=p.getPrice()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Quantity*</label> <input
									name="Quantity" type="number" class="form-control"
									id="exampleInputPassword1" value="<%=p.getQuantity()%>">
							</div>

							<div class="form-group">
								<label for="inputState">Category</label> <select id="inputState"
									name="ProductCategory" class="form-control">
									<%
									if ("Phone".equals(p.getProductCategory())) {
									%>
									<option value="Phone">Phone</option>
									<option value="Accessory">Accessory</option>
									<%
									} else {
									%>
									<option value="Accessory">Accessory</option>
									<option value="Phone">Phone</option>

									<%
									}
									%>
								</select>
							</div>



							<button type="submit" class="btn btn-primary">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>