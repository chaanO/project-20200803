<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="cart.dao.ProductDao"%>
<%@ page import="cart.model.Product"%>
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
<title>도서 구매</title>
</head>
<body>
<%
	ProductDao pDao = new ProductDao();
	ArrayList<Product> result = pDao.getListProduct();
%>

<my:navbar />

<div class="container">
<div class="card" style="width: 18rem;">
  <img src="images/누구나 시 하나쯤 가슴에 품고 산다.jpg" class="card-img-top" alt="">
</div>

제목 : <input type="hidden" name="bookName" value="${param.bookName }" />

</div>

</body>
</html>