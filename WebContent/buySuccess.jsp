<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<title>장바구니 담기 완료</title>
<style>
	.container-fluid {
		background-color:white;
		width:400px;
	}
	
	h1 {
		text-align:center;
	}
	 
	h5 {
		text-align:center;
	}
</style>
</head>

<body class="bg-light">

<div class="container-fluid shadow p-3">

<h1>중앙문고</h1>
<h5>장바구니 담기 완료</h5>
<form action="" method="post">
	<div class="form-group">
		
<input type="button" class="btn btn-dark" onclick="location='${ctxPath}/list.do'" value="장바구니 확인" />
<%--
<input type="button" class="btn btn-dark" onclick="location='${ctxPath}/cart.jsp'" value="장바구니 확인" />
 --%>
<input type="button" class="btn btn-dark" value="로그인" />
</div>
</form>
</div>

</body>
</html>