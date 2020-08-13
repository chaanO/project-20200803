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
<body class="bg-light">

<my:navbar />

<form action="cart.do" method="post">
<div class="container dark-grey-text mt-5 shadow p-3" style="background-color: white;">
      <!--Grid row-->
      <div class="row wow fadeIn">

        <!--Grid column-->
        <div class="col-md-6 mb-4">

          <img src="${result[param.no].image }" height="650" alt="">

        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-md-6 mb-4">

          <!--Content-->
          <div class="p-4">
			<h1 class="lead font-weight-bold">도서 구매</h1>
			
			<br>
			
			<hr />
			
			<br>
			
			<h1 class="lead font-weight-bold">
				<input type="hidden" name="bookId" value="${result[param.no].bookId }" />
            	<input type="hidden" name="bookName" value="${param.bookName }">${result[param.no].bookName}
			</h1>
            <p class="lead">
	            <span class="mr-1">
	               <input type="hidden" name="price" value="${result[param.no].price}">판매가 : ${result[param.no].price}원
	               <input type="hidden" name="memberId" value="${authUser.id }">
	            </span>
            </p>

            <!--Content-->
			<p>${result[param.no].writer }</p>
            <p>${result[param.no].content }</p>
			
			<br>
			
			<hr>
			
			<br>
			
            <div class="d-flex justify-content-left">
              <!-- Default input -->
              <input type="number" name="amount" value="${param.amount }" aria-label="Search" class="form-control mr-2" style="width: 100px">
              <button class="btn btn-primary btn-md mr-2 p waves-effect waves-light" type="submit">장바구니 담기
                <i class="fas fa-shopping-cart ml-1"></i>
              </button>
              <button class="btn btn-danger btn-md mr-2 p waves-effect waves-light" data-toggle="modal" data-target="#staticBackdrop" type="button">바로결제
              	<i class="fas fa-credit-card"></i>
              </button>

            </div>

          </div>
          
			</div>
        </div>
</div>
</form>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">결제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	 결제 완료.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="location='main.jsp'">확인</button>
      </div>
    </div>
  </div>
</div>

<%-- <div class="container">
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
	  <input type="submit" value="장바구니 담기">
	  <input type="button" data-toggle="modal" data-target="#staticBackdrop" value="바로결제">
	</div>
</form>
</div>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">결제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	 결제 완료.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="location='main.jsp'">확인</button>
      </div>
    </div>
  </div>
</div> --%>
</body>
</html>