<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
.container-fluid {
	background-color: white;
	width: 500px;
}

h1 {
	text-align: center;
}

h5 {
	text-align: center;
}
</style>
</head>
<body>

<div class="container-fluid shadow p-3">
	<button type="button" class="btn btn-default" aria-label="Left Align"
		onclick="location=''">

		<i class="fas fa-chevron-left"></i>
	</button>
	<h2>게시글을 삭제하시겠습니까?</h2>
	<h5>게시글을 삭제하시려면 사용자 암호를 입력해주세요</h5>
	
	<form action="delete.do?no=${delReq.articleNumber }" method="post">
		<label for="password">암호</label> <input type="password"
			name="password" /> <small class="form-text text-muted"> <c:if
				test="${errors.password}">암호를 입력하세요.</c:if> <c:if
				test="${errors.invalidPassword}">암호가 일치하지 않습니다.</c:if>
		</small> <input type="submit" class="btn btn-secondary" value="삭제" />
	</form>

	<div align="center">
		<form action="login.do" method="post">
			<button type="button" class="btn btn-secondary"
				onclick="location.href = '${ctxPath }/article/list.do'"
				>목록으로</button>
		</form>
	</div>
</div>
</body>
</html>