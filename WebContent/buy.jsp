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
<script>
	$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').trigger('focus')
	})
</script>
</head>
<body>
<%

//	ProductDao pDao = new ProductDao();
//	ArrayList<Product> result = pDao.getListProduct();
%>

<my:navbar />

<div class="container">
	<div class="jumbotron">
	  <h1 class="display-5">도서 구매</h1>
	  <p class="lead">제목 : ${result[param.no].bookName }</p>
	  <p class="lead">가격 : ${result[param.no].price }원</p>
	  <hr class="my-4">
	  <div class="form-group">
	    <label for="Amount">수량</label>
	    <input type="text" name="amount" class="form-control" id="Amount">
      </div>
	  <a class="btn btn-primary btn-lg" href="#" role="submit"  data-toggle="modal" data-target="#staticBackdrop">장바구니 담기</a>
	  <a class="btn btn-primary btn-lg" href="#" role="button">바로 결제</a>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">장바구니 담기 완료</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	장바구니에 상품을 담았습니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">장바구니 확인</button>
        <button type="button" class="btn btn-primary">쇼핑 계속하기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>