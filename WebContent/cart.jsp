<%@page import="java.util.ArrayList"%>
<%@page import="cart.dao.ProductDao"%>
<%@page import="cart.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%
	ProductDao pDao = new ProductDao();
	ArrayList<Product> result = pDao.getListProduct();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css'>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js'></script>
<script
	src='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js'></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>중앙문고</title>
<style>
body { font-family: 'Noto Sans KR', sans-serif; }
</style>
<script>
	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').trigger('focus')
	})
</script>
<style>
	table {
		text-align: center;
	}
	
	 a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: black; text-decoration: underline;}
	 
	
</style>
</head>
<body class="bg-light">

<my:navbar />

<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">E-COMMERCE CART</h1>
     </div>
</section>

<div class="container mb-4">
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col"> </th>
                            <th scope="col">Product</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            <th scope="col">Total</th>
                            <th> </th>
                            <th> </th>
                        </tr>
                        <c:if test="${cartPage.hasNoCarts() }">
							<tr>
								<td colspan="7"><strong>장바구니가 비었습니다.</strong></td>
							</tr>
						</c:if>
                    </thead>
                    <tbody>
                    	<c:forEach var="cart" items="${cartPage.cartList }">
                        <tr>
                            <td><img src="${cart.product.image }" height="50"/> </td>
                            <td>${cart.product.bookName }</td>
                            <td>${cart.amount }</td>
                            <td>${cart.product.price }</td>
                            <td>${cart.product.price * cart.amount }</td>
                            <td>
                            	<form action="delete" method="post">
									<input type="hidden" name="bookId" value="${cart.bookId }" />	
	                            	<button class="btn btn-sm btn-danger" type="submit"><i class="fa fa-trash"></i> </button> 
                            	</form>
                            </td>
                            <td><button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#staticBackdrop"><i class="fas fa-credit-card"></i></button> </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                <%--pagination --%>
                <nav aria-label="Page navigation example">
				  	<ul class="pagination pg-dark" style="justify-content: center;">
				    	<li class="page-item">
				    		<c:if test="${(cartPage.startPage - 5) < 0}">
								<a class="page-link" href="list.do?pageNo=${cartPage.startPage}">
									<span aria-hidden="true">&laquo;</span>
					        		<span class="sr-only">Previous</span>
					        	</a>
							</c:if> 
							<c:if test="${(cartPage.startPage - 5) > 0}">
								<a class="page-link" href="list.do?pageNo=${cartPage.startPage - 5}">
									<span aria-hidden="true">&laquo;</span>
				        			<span class="sr-only">Previous</span>
				        		</a>
							</c:if>
				    	</li>
				    	
				    	<c:forEach var="pNo" begin="${cartPage.startPage}" end="${cartPage.endPage }">
							<li class="page-item">
								<a class="page-link" href="list.do?pageNo=${pNo}">${pNo}</a>
							</li>
						</c:forEach>
				    
				    	<li class="page-item">
							<c:if test="${(cartPage.startPage + 5) <= (cartPage.totalPages)}">
								<a class="page-link" href="list.do?pageNo=${cartPage.startPage + 5}">
									<span aria-hidden="true">&raquo;</span>
				        			<span class="sr-only">Next</span>
				        		</a>
							</c:if> 
							<c:if test="${(cartPage.startPage + 5) > (cartPage.totalPages)}">
								<a class="page-link" href="list.do?pageNo=${cartPage.totalPages}">
									<span aria-hidden="true">&raquo;</span>
				        			<span class="sr-only">Next</span>
				        		</a>
							</c:if>
						</li>
				  	</ul>
				</nav>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">결제</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">결제 완료.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="location='main.jsp'">확인</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>