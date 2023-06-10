<%@page import="Sphone.DB.DBConnect"%>
<%@page import="Sphone.DAO.ProductDAOImpl"%>
<%@page import="Sphone.Model.Product"%>
<%@page import="java.sql.Connection"%>
<%@page import="Sphone.Model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SamSung SmartPhone</title>
<%@include file="all_component/allCss.jsp"%>
<style>
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
}</style>
</head>
<body>
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
	<%@include file="all_component/nvabar.jsp"%>
	<%
	User u = (User)session.getAttribute("userobj");
	%>
	<h3 class ="text-center">XiaoMi SmartPhone</h3>
	<div class="container-fulid">
		<div class="row">

			<%
					ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConnection());
					List<Product> Slist = dao.getAllXiaomi();
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
							%> <a
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