<%@page import="java.util.ArrayList"%>
<%@page import="cart.dao.ProductDao"%>
<%@page import="cart.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	ProductDao pDao = new ProductDao();
	ArrayList<Product> result = pDao.getListProduct();
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
<title>장바구니</title>
</head>
<body>

<table border="1">
	<tr>
		<td>도서</td>
		<td>도서명</td>
		<td>가격</td>
		<td>수량</td>
		<td>총 금액</td>
		<td>삭제</td>
	</tr>
	<c:if test="${cartPage.hasNoCarts() }">
		<tr>
			<td colspan="7">장바구니가 비었습니다.</td>
		</tr>
	</c:if>
	<%--
		for (int i = 0; i < result.size(); i++) {
			Product temp = result.get(i);
			session.setAttribute("temp", temp);
	--%>
			<c:forEach var="cart" items="${cartPage.cartList }">
				<tr>
					<td><img src="${cart.product.image }" alt="" /></td>
					<td>${cart.product.bookName }</td>
					<td>${cart.product.price }</td>
					<td>${cart.amount }</td>
					<td>${cart.product.price * cart.amount }</td>
					<td>
					<form action="delete" method="post">
					<input type="hidden" name="bookId" value="${cart.bookId }" />
					<input type="submit" value="삭제" />
					</form>
					</td>
				</tr>
			</c:forEach>
			
	<%--
		}
	--%>
	
	<%--
		<tr>
			<td>${result[param.no].image }</td>
			<td>${result[param.no].bookName }</td>
			<td>${result[param.no].price }</td>
			<td>${result[param.no].amount }</td>
			<td>${result[param.no].price * result[param.no].amount }</td>
		</tr>
	 --%>
	<c:if test="${cartPage.hasCarts() }">
		<tr>
			<td colspan="7">
				<c:if test="${cartPage.startPage > 5 }">
				<a href="list.do?pageNo=${cartPage.startPage - 5 }">[이전]</a>
				</c:if>
				<c:forEach var="pNo" begin="${cartPage.startPage }" end="${cartPage.endPage }">
				<a href="list.do?pageNo=${pNo }">[${pNo }]</a>
				</c:forEach>
				<c:if test="${cartPage.endPage < cartPage.totalPages }">
				<a href="list.do?pageNo=${cartPage.startPage + 5 }">[다음]</a>
				</c:if>
			</td>
		</tr>
	</c:if>
</table>
</body>
</html>