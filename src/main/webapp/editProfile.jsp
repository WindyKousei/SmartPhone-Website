<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit your profile</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/nvabar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h4 class = "text-center text-primary">Edit your profile</h4>
					
					<c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty succMsg }">
							<h5 class="text-center text-danger">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<form action="update_profile">
						<input type = "hidden" value ="${userobj.email}" name ="email">
							<div class="form-group">
								<label for="exampleInputEmail1">First Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" 
									required="required" name="FirstName" value ="${userobj.firstName}">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Last Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp"  value ="${userobj.lastName}"
									required="required" name="LastName">
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Phone number*</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" 
									value ="${userobj.phone}"
									required="required" name="phone">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Address*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									value ="${userobj.address}"
									aria-describedby="emailHelp" 
									required="required" name="address">
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Confirm Password*</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>

							
							<div class="text-center">
								<button type="submit" class="btn btn-success">Edit</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>