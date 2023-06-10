<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your info</title>
<%@include file="all_component/allCss.jsp"%>
<style>
a {
	text-decoration: none;
	color: black;
}

a:hover{
text-decoration: none;
}
</style>
</head>
<body style="background-color: #f7f7f7;">

<c:if test = "${empty userobj }">
<c:redirect url ="login.jsp"/>
</c:if>
	<%@include file="all_component/nvabar.jsp"%>

	<div class="container">
	<h3 class = "text-center">Hello, ${userobj.lastName}</h3>
		<div class="row">
			<div class="col-md-4">
				<a href="sellProduct.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class = "text-success">
							<i class="fa-sharp fa-solid fa-dollar-sign fa-3x"></i>
							</div>
							<h3>Sell old product</h3>

						</div>
					</div>
				</a>
			</div>
			
			
			<div class="col-md-4">
				<a href="editProfile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class = "text-danger">
							<i class="fa-sharp fa-solid fa-address-card fa-3x"></i>
							</div>
							<h3>Edit profile</h3>

						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="oldProduct.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class = "text-success">
							<i class="fa-sharp fa-solid fa-dollar-sign fa-3x"></i>
							</div>
							<h3>Old Product</h3>

						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class = "text-info">
							<i class="fa-sharp fa-solid fa-box-open fa-3x"></i>
							</div>
							<h3>Your order</h3>

						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-3">
				<a href="Service.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class = "text-primary">
							<i class="fa-sharp fa-solid fa-phone-volume fa-3x"></i>
							</div>
							<h3>Customer Service</h3>

						</div>
					</div>
				</a>
			</div>
			
		</div>
	</div>
</body>
</html>