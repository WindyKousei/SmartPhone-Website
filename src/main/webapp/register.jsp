<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Register</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/nvabar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center text">Registration Page</h4>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>

						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session"/>
						</c:if>

						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">First Name*</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter first name"
									required="required" name="FirstName">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Last Name*</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter last name"
									required="required" name="LastName">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password*</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Enter password" required="required" name="password">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone number*</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter phone number"
									required="required" name="phone">
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Address*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter address"
									required="required" name="address">
							</div>
							
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree term and Condition</label>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>

						</form>



					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_component/_footer.jsp"%>

</body>
</html>