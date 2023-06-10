<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Product</title>
<%@include file="style.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Product</h4>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>

						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
						
						<form action="../addProduct" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Product Name*</label> <input
									name="ProductName" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailhelp">
							</div>

							<div class="form-group">
								<label for="inputState">Brand*</label> <select
									id="inputState" name="Brand" class="form-control">
									<option selected>--select--</option>
									<option value="SamSung">SamSung</option>
									<option value="Apple">Apple</option>
									<option value="XiaoMi">XiaoMi</option>
									<option value="Other">Other</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									name="Price" type="number" class="form-control"
									id="exampleInputPassword1">
							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Product Year*</label> <input
									name="Year" type="number" class="form-control"
									id="exampleInputPassword1">
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Quantity*</label> <input
									name="Quantity" type="number" class="form-control"
									id="exampleInputPassword1">
							</div>

							<div class="form-group">
								<label for="inputState">Product Category</label> <select
									id="inputState" name="Category" class="form-control">
									<option selected>--select--</option>
									<option value="Phone">Phone</option>
									<option value="Accessory">Accessory</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="Photo" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Description</label> <input
									name="Description" type="text" class="form-control">
							</div>
							<button type="submit" class="btn btn-primary">Add</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>