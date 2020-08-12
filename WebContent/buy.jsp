<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
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
<script>
	$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').trigger('focus')
	})
</script>
</head>
<body>

<my:navbar />

<div class="container">
<form action="cart.do" method="post">
<img src="${result[param.no].image }" height="200" style="float:left; margin-right: 20px; margin-top: 10px; margin-left:20px">
	<div class="jumbotron">
	  <h1 class="display-5">도서 구매</h1>
	  <input type="hidden" name="bookId" value="${result[param.no].bookId }" />
	  <p class="lead"><input type="hidden" name="bookName" value="${param.bookName }">제목 : ${result[param.no].bookName} </p>
	  <p class="lead"><input type="hidden" name="price" value="${result[param.no].price}">가격 : ${result[param.no].price}원</p>
	  <input type="hidden" name="memberId" value="${authUser.id }">
	  <hr class="my-4">
	  <div class="form-group">
	    <label for="Amount">수량</label>
	    <input type="text" name="amount" class="form-control" id="Amount" value="${param.amount }">
      </div>
	  <input type="submit" data-toggle="modal" data-target="#staticBackdrop" value="장바구니 담기">
	  <input type="button" value="바로결제">
	</div>
</form>
</div>


</body>
</html>