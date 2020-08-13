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
<title>경제/경영</title>
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
      <th scope="col">경제/경영</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      	<img onclick="location.href='buy.jsp?no=${12}'" class="btn" src="${result[12].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${12 }"><strong>${result[12].bookName }</strong></a> <br />    	
			    	곽해선 저 | 혜다 | 2019.12.25 <br />
			    	가격 : ${result[12].price }원
			   	</small>
   			</p>
      </td>
      <td>
      	<img onclick="location.href='buy.jsp?no=${13}'" class="btn" src="${result[13].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${13 }"><strong>${result[13].bookName }</strong></a> <br />
			    	김민구 저 | 길벗 | 2019.03.11 <br />
			    	가격 : ${result[13].price }원
			   	</small>
   			</p>
      </td>
      <td>
      	<img onclick="location.href='buy.jsp?no=${14}'" class="btn" src="${result[14].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${14 }"><strong>${result[14].bookName }</strong></a> <br />
			    	주언규 저 | 21세기북스 | 2020.07.22 <br />
			    	가격 : ${result[14].price }원
			   	</small>
   			</p>
      </td>
    </tr>

    <tr>
      <td>
      	<img onclick="location.href='buy.jsp?no=${15}'" class="btn" src="${result[15].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${15 }"><strong>${result[15].bookName }</strong></a> <br />
			    	김승호 저 | 스노우폭스북스 | 2020.06.15 <br />
			    	가격 : ${result[15].price }원
			   	</small>
   			</p>
      </td>
      <td>
      	<img onclick="location.href='buy.jsp?no=${16}'" class="btn" src="${result[16].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${16 }"><strong>${result[16].bookName }</strong></a> <br />
			    	이학연 저 | 넥서스BIZ | 2020.03.08 <br />
			    	가격 : ${result[16].price }원
			   	</small>
   			</p>
      </td>
      <td>
      	<img onclick="location.href='buy.jsp?no=${17}'" class="btn" src="${result[17].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${17 }"><strong>${result[17].bookName }</strong></a> <br />
			    	권도균 저 | 위즈덤하우스 | 2015.08.05 <br />
			    	가격 : ${result[17].price }원
			   	</small>
   			</p>
      </td>
    </tr>
  </tbody>
</table>
</div>

</body>
</html>