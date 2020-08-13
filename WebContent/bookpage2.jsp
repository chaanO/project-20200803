<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@page import="cart.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cart.dao.ProductDao"%>

<%
	ProductDao pDao = new ProductDao();
	ArrayList<Product> result = pDao.getListProduct();
	session.setAttribute("result", result);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css'>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js'></script>
<title>소설</title>
<style>
		
	.btn {cursor:pointer;}
	
	 a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: black; text-decoration: underline;}
	 
	 .container {
		background-color:white;
	}
	
	td {
		text-align: center;
	}
</style>
</head>
<body class="bg-light">
<my:navbar />

<div class="container shadow p-3">
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">소설</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      	<img onclick="location.href='buy.jsp?no=${6}'" class="btn" src="${result[6].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${6 }"><strong>${result[6].bookName }</strong></a> <br />    	
			    	${result[6].writer } <br />
			    	가격 : ${result[6].price }원
			   	</small>
   			</p>
      </td>
      <td>
      	<img onclick="location.href='buy.jsp?no=${7}'" class="btn" src="${result[7].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${7 }"><strong>${result[7].bookName }</strong></a> <br />
			    	${result[7].writer } <br />
			    	가격 : ${result[7].price }원
			   	</small>
   			</p>
      </td>
      <td>
      	<img onclick="location.href='buy.jsp?no=${8}'" class="btn" src="${result[8].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${8 }"><strong>${result[8].bookName }</strong></a> <br />
			    	${result[8].writer } <br />
			    	가격 : ${result[8].price }원
			   	</small>
   			</p>
      </td>
    </tr>
  
    <tr>
      <td>
      	<img onclick="location.href='buy.jsp?no=${9}'" class="btn" src="${result[9].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${9 }"><strong>${result[9].bookName }</strong></a> <br />
			    	${result[9].writer } <br />
			    	가격 : ${result[9].price }원
			   	</small>
   			</p>
      </td>
      <td>
      	<img onclick="location.href='buy.jsp?no=${10}'" class="btn" src="${result[10].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${10 }"><strong>${result[10].bookName }</strong></a> <br />
			    	${result[10].writer } <br />
			    	가격 : ${result[10].price }원
			   	</small>
   			</p>
      </td>
      <td>
      	<img onclick="location.href='buy.jsp?no=${11}'" class="btn" src="${result[11].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${11 }"><strong>${result[11].bookName }</strong></a> <br />
			    	${result[11].writer } <br />
			    	가격 : ${result[11].price }원
			   	</small>
   			</p>
      </td>
    </tr>
  </tbody>
</table>
</div>

</body>
</html>