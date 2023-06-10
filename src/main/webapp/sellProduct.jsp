<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Old Product</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body tyle="background-color: #f0f1f2;">

<%@include file="all_component/nvabar.jsp"%>
<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h5 class="text-center text-primary p-1">Sell Old Product</h5>
						
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>							
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
							
						<form action="add_old_product" method="post" enctype="multipart/form-data">
						<input type="hidden" value="${userobj.email }" name="user"> 
							<div class="form-group">
								<label for="exampleInputEmail1">Product Name*</label> <input
									name="ProductName" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailhelp">
							</div>

							<div class="form-group">
								<label for="inputState">Brand*</label> <input
									id="exampleInputEmail1" name="Brand" type="text" class="form-control">
									
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

	<%@include file="all_component/footer.jsp"%>

</body>
</html>