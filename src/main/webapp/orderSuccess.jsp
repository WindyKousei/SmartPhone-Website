
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/nvabar.jsp"%>
	<div class ="container text-center mt-3">
	<i class="fa-solid fa-thumbs-up fa-5x text-success"></i>
	<h1>Thank you</h1>
	<h2>Your Order Successfully</h2>
	<h4>The order(s) will be delivered to your home</h4>
	<h4>Check your phone regularly</h4>
	<a href = "index.jsp" class ="btn btn-success mt-3">Continue Shopping</a>
	</div>
	

</body>
</html>