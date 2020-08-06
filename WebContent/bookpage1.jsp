<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
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
<title>시/에세이</title>
<style>
		
	.btn {cursor:pointer;}
	
	 a:link { color: red; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: black; text-decoration: underline;}
	 
</style>
</head>
<body>

<my:navbar />

<h3>시</h3>
<div class="container">
 <img onclick="location.href='buy.jsp'" class="btn" src="images/누구나 시 하나쯤 가슴에 품고 산다.jpg" height="200">
 	<p>
	   	<small style="text-align:center">
	    	<a href="buy.jsp"><strong><input type="hidden" name="bookName"/>누구나 시 하나쯤 가슴에 품고 산다.</strong></a> <br />
	    	김서경 저 | 메이븐 | 2019.07.01 <br />
	    	가격 : 13,500원
	   	</small>
   	</p>
</div>
</body>
</html>