<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="java.util.List"%>
<%@page import="Sphone.DB.DBConnect"%>
<%@page import="Sphone.DAO.CartDAOImpl"%>
<%@page import="Sphone.Model.Cart"%>
<%@page import="Sphone.Model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your cart</title>
<%@include file="all_component/allCss.jsp"%>
</head>

<body style="background-color: #f0f1f2;">
	<%@include file="all_component/nvabar.jsp"%>

	

	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your item</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Product Name</th>
									<th scope="col">Brand</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
							User u=(User) session.getAttribute("userobj");
							 CartDAOImpl dao=new CartDAOImpl(DBConnect.getConnection());
                            List<Cart> cart=dao.getProductbyUser(u.getEmail());
                            Double totalPrice = 0.0;
                            for (Cart c : cart){
                            	totalPrice = c.getTotalPrice();
                            	%>
								<tr>
									<th scope="row"><%=c.getProductName()%></th>
									<td><%=c.getBrand() %></td>
									<td><%=c.getPrice() %></td>
									<td><a href="removeProduct?id=<%=c.getProductId()%>&&email=<%=u.getEmail() %>&&cart_id=<%=c.getCartId() %>" class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<% 
                            }
							%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice %></td>
								</tr>


							</tbody>
						</table>
					</div>
				</div>
			</div>


			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your detail order</h3>
						<form action ="order" method ="post">
						
						<input type ="hidden" value ="${userobj.email}" name ="email">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">First Name</label> <input type="text" name ="FirstName"
										class="form-control" id="inputEmail4" value ="${userobj.firstName}" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Last Name</label> <input name ="LastName"
										type="text" class="form-control" id="inputPassword4" value ="${userobj.lastName}" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input name ="Phone"
										class="form-control" value ="${userobj.phone}" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input name ="Address"
										class="form-control" value ="${userobj.address}" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col">
									<label for="inputEmail4">Email</label> <input type="text" name ="Email"
										class="form-control" value ="${userobj.email}" required>
								</div>

							</div>
							<div class="form-group" >
								<label>Payment Mode</label> <select class="form-control" name ="Payment">
									<option value="NoSelect">--Select--</option>
									<option value="COD">Cash On Delivery</option>
								</select>

							</div>
							<div class="text-center" >
								<button type ="submit" class="btn btn-info" >Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>