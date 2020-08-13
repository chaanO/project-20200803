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
      <th scope="col">자기계발</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      	<img onclick="location.href='buy.jsp?no=${18}'" class="btn" src="${result[18].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${18 }"><strong>${result[18].bookName }</strong></a> <br />    	
			    	제임스 클리어 저 | 비즈니스북스 | 2019.02.26 <br />
			    	가격 : ${result[18].price }원
			   	</small>
   			</p>
      </td>
      <td>
      	<img onclick="location.href='buy.jsp?no=${19}'" class="btn" src="${result[19].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${19 }"><strong>${result[19].bookName }</strong></a> <br />
			    	레몬심리 저 | 갤리온 | 2020.06.30 <br />
			    	가격 : ${result[19].price }원
			   	</small>
   			</p>
      </td>
      <td>
      	<img onclick="location.href='buy.jsp?no=${20}'" class="btn" src="${result[20].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${20 }"><strong>${result[20].bookName }</strong></a> <br />
			    	벤쌤 저 | 체인지업 | 2020.07.23 <br />
			    	가격 : ${result[20].price }원
			   	</small>
   			</p>
      </td>
    </tr>
 
    <tr>
      <td>
      	<img onclick="location.href='buy.jsp?no=${21}'" class="btn" src="${result[21].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${21 }"><strong>${result[21].bookName }</strong></a> <br />
			    	김윤나 저 | 카시오페아 | 2017.09.22 <br />
			    	가격 : ${result[21].price }원
			   	</small>
   			</p>
      </td>
      <td>
      	<img onclick="location.href='buy.jsp?no=${22}'" class="btn" src="${result[22].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${22 }"><strong>${result[22].bookName }</strong></a> <br />
			    	마크 맨슨 저 | 갤리온 | 2017.10.27 <br />
			    	가격 : ${result[22].price }원
			   	</small>
   			</p>
      </td>
      <td>
      	<img onclick="location.href='buy.jsp?no=${23}'" class="btn" src="${result[23].image }" height="200">
 			<p>
			   	<small style="text-align:center">
			    	<a href="buy.jsp?no=${23 }"><strong>${result[23].bookName }</strong></a> <br />
			    	김범준 저 | 생각의 길 | 2020.07.15 <br />
			    	가격 : ${result[23].price }원
			   	</small>
   			</p>
      </td>
    </tr>
  </tbody>
</table>
</div>

</body>
</html>