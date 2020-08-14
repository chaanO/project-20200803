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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>중앙문고</title>
<style>
body { font-family: 'Noto Sans KR', sans-serif; } }
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
	<button type="button" class="btn btn-default" aria-label="Left Align" onclick="location='main.jsp'">
  		<i class="fas fa-chevron-left"></i>
	</button>
<h1>중앙문고</h1>
<h5>게시글이 삭제되었습니다.</h5>
		<div align="center">
			<form action="login.do" method="post">
				<button type="button" class="btn btn-secondary"
					onclick="location.href = '${ctxPath }/article/list.do'"
					align="center">목록으로</button>
			</form>
		</div>
	</div>
</body>
</html>