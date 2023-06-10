<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@include file="all_component/nvabar.jsp"%>
<div class = "container p-1">
<h3 class = "text-center text-primary">Author of this page</h3>
<table class="table table-striped mt-3">
  <thead class ="bg-primary text-white">
    <tr>
      <th scope="col">Index</th>
      <th scope="col">Full Name</th>
      <th scope="col">Student code</th>
      <th scope="col">Email</th>
      <th scope="col">Phone Number</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Nguyen Minh Tien</td>
      <td>20133093</td>
      <td>20133093@student.hcmute.edu.vn</td>
      <td>0813240973</td>
 
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Huynh Nguyen Tin</td>
      <td>20133094</td>
      <td>20133094@student.hcmute.edu.vn</td>
      <td>0123456789</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Bui Le Hai Trieu</td>
      <td>20133101</td>
      <td>20133101@student.hcmute.edu.vn</td>
      <td>0123456789</td>
    </tr>
    <tr>
      <th scope="row">4</th>
      <td>Do Hoang Thinh</td>
      <td>20133122</td>
      <td>20133122@student.hcmute.edu.vn</td>
      <td>0123456789</td>
    </tr>
   
  </tbody>
</table>


</div>

</body>
</html>