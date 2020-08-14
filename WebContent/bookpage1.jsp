<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@page import="cart.dao.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cart.model.Product"%>

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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>중앙문고</title>
<style>
body { font-family: 'Noto Sans KR', sans-serif; }
		
	.btn {cursor:pointer;}
	
	 a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: black; text-decoration: unde
	 rline;}
	 
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
      <th scope="col">시/에세이</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      	<img onclick="location.href='buy.jsp?no=${0}'" class="btn" src="${result[0].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${0 }"><strong>${result[0].bookName }</strong></a> <br />
			    	${result[0].writer } <br />
			    	가격 : ${result[0].price }원
			   	</small>
   			</p>
      </td>
      <td>
      	<img onclick="location.href='buy.jsp?no=${1}'" class="btn" src="${result[1].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${1 }"><strong>${result[1].bookName }</strong></a> <br />
			    	${result[1].writer } <br />
			    	가격 : ${result[1].price }원
			   	</small>
   			</p>
      </td>
      <td>
      	<img onclick="location.href='buy.jsp?no=${2}'" class="btn" src="${result[2].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${2 }"><strong>${result[2].bookName }</strong></a> <br />
			    	${result[2].writer } <br />
			    	가격 : ${result[2].price }원
			   	</small>
   			</p>
      </td>
    </tr>
 
    <tr>
      <td>
      	<img onclick="location.href='buy.jsp?no=${3}'" class="btn" src="${result[3].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${3 }"><strong>${result[3].bookName }</strong></a> <br />
			    	${result[3].writer } <br />
			    	가격 : ${result[3].price }원
			   	</small>
   			</p>
      </td>
      <td>
      	<img onclick="location.href='buy.jsp?no=${4}'" class="btn" src="${result[4].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${4 }"><strong>${result[4].bookName }</strong></a> <br />
			    	${result[4].writer } <br />
			    	가격 : ${result[4].price }원
			   	</small>
   			</p>
      </td>
      <td>
      	<img onclick="location.href='buy.jsp?no=${5}'" class="btn" src="${result[5].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${5 }"><strong>${result[5].bookName }</strong></a> <br />
			    	${result[5].writer } <br />
			    	가격 : ${result[5].price }원
			   	</small>
   			</p>
      </td>
    </tr>
  </tbody>
</table>
</div>

</body>
</html>