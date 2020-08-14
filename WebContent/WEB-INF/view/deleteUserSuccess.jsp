<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>중앙문고</title>
<style>
body { font-family: 'Noto Sans KR', sans-serif; }
	.container-fluid {
		background-color:white;
		width:700px;
	}
	
	h4 {
		text-align:center;
	}
</style>
</head>
<body class="bg-light">
<my:navbar />
	<br>
<div class="container-fluid shadow p-3">
   	<form>
	  	<div class="form-group">
	  	<p>&nbsp;<p>
	  	<h1 align="center"><i class="fas fa-user-slash"></i></h1>
		    <h4 align="center">탈퇴 완료</h4>
		    <hr />
		    <p align="center">그동안 이용해주셔서 감사했습니다.</p>
	  	</div>
	  	<br />
	  	<br />
	  	<br />
 		<button type="button" class="btn btn-dark btn-lg btn-block" onclick="location='${ctxPath }/logout.do'">확인</button>
	</form>
</div>

</body>
</html>