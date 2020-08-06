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
<title>Insert title here</title>
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
<body>
<body class="bg-light">

<div class="container-fluid shadow p-3">
<h1>중앙문고</h1>
<h5>게시글 작성 완료</h5>
<form action="login.do" method="post">
		<button type="button" class="btn btn-secondary" onclick="location.href = 'readArticle.jsp' ">작성 글 확인하기</button>
	    <button type="button" class="btn btn-secondary" onclick="location.href = 'listArticle.jsp' ">목록으로</button>
</form>
</div>
</body>
</html>