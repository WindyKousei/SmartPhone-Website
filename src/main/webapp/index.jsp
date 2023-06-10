<%@page import="Sphone.DB.DBConnect"%>
<%@page import="Sphone.DAO.ProductDAOImpl"%>
<%@page import="Sphone.Model.Product"%>
<%@page import="Sphone.Model.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPhone: Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">

.back-img {
	background: url("image/CellphoneS.png");
	height: 50vh;
	width: 100%;
	background-size: 60%;
	background-repeat: no-repeat;
	background-position: center;
}

.crd-ho:hover {
	background: #fcf7f7;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
</style>
</head>
<body style="background-color: #f7f7f7;">

<c:if test = "${not empty addCart }">
<div id="toast">${addCart }</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
<c:remove var="addCart" scope ="session"/>
</c:if>

	<%
	User u = (User)session.getAttribute("userobj");
	%>
	
	<%@include file="all_component/nvabar.jsp"%>
	
	<div class="back-img" ></div>



	<!-- Start Recent Phone -->
	<div class="container">
		<h3 class="text-center">Apple</h3>
		<div class="row">


			<%
			ProductDAOImpl dao2 = new ProductDAOImpl(DBConnect.getConnection());
			List<Product> Alist = dao2.getIPhone();
			for (Product p : Alist) {
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
						<div class="row">
							<%
							if (u == null){
							%> 
							<a href="login.jsp" class="btn btn-danger btn-sm m1-3"> Add Cart </a>
							<%
							} else{
								%>
							<a href="cart?id=<%=p.getProductId()%>&&email=<%=u.getEmail()%>" class="btn btn-danger btn-sm"> Add Cart </a>
							<%
							}
							%>
							
								<a href="viewProducts.jsp?id=<%=p.getProductId()%>"
								class="btn btn-success btn-sm ml-3"> View Detail</a> <a href=""
								class="btn btn-danger btn-sm ml-3"> $<%=p.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_Apple_Phone.jsp"
				class="btn btn-danger btn-sm text-white"> View All</a>
		</div>
	</div>
	<!-- End Recent Book -->


	<!-- Start New Book -->
	<div class="container">
		<h3 class="text-center">SamSung</h3>
		<div class="row">


			<%
			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConnection());
			List<Product> Slist = dao.getSamSungPhone();
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
							%>
							<a
								href="viewProducts.jsp?id=<%=p.getProductId()%>"
								class="btn btn-success btn-sm ml-3"> View Detail</a> <a href=""
								class="btn btn-danger btn-sm ml-3"> $<%=p.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_Samsung_Phone.jsp"
				class="btn btn-danger btn-sm text-white"> View All</a>
		</div>
	</div>



	<!-- End New Book -->

	<!-- Start Old Book -->
	<!-- Start Recent Book -->
	<div class="container">
		<h3 class="text-center">XiaoMi</h3>
		<div class="row">


			<%
			ProductDAOImpl dao3 = new ProductDAOImpl(DBConnect.getConnection());
			List<Product> Xlist = dao3.getXiaomiPhone();
			for (Product p : Xlist) {
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
							%>
							 <a
								href="viewProducts.jsp?id=<%=p.getProductId()%>"
								class="btn btn-success btn-sm ml-3"> View Detail</a> <a href=""
								class="btn btn-danger btn-sm ml-3"> $<%=p.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_Xiaomi_Phone.jsp"
				class="btn btn-danger btn-sm text-white"> View All</a>
		</div>
	</div>
	<!-- End Recent Book -->
	<!-- End Old Book -->

	<!-- Start Recent Book -->
	<div class="container">
		<h3 class="text-center">Accessory</h3>
		<div class="row">


			<%
			ProductDAOImpl dao4 = new ProductDAOImpl(DBConnect.getConnection());
			List<Product> Olist = dao2.getAccessory();
			for (Product p : Olist) {
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
							%>
							 <a
								href="viewProducts.jsp?id=<%=p.getProductId()%>"
								class="btn btn-success btn-sm ml-3"> View Detail</a> <a href=""
								class="btn btn-danger btn-sm ml-3"> $<%=p.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_Accessory.jsp" class="btn btn-danger btn-sm text-white">
				View All</a>
		</div>
	</div>

	<!-- End Recent Book -->


	<%@include file="all_component/_footer.jsp"%>
</body>
</html>