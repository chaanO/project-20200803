<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
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
<body class="bg-light">
	<my:navbar />
	<br>
	<div class="container-fluid shadow p-3">
		<br />
			<br />
		<h1><i class="fas fa-check-circle"></i></h1>
		<h4 align="center">글이 정상적으로 수정되었습니다</h4>
		<hr />
		<p align="center">답변은 평균 2~4일 정도 소요됩니다.</p>
		<br />
		<div align="center">
				<button type="button" class="btn btn-secondary"
					onclick="location.href ='${ctxPath }/article/read.do?no=${param.no}'">작성
					글 확인하기</button>
				<button type="button" class="btn btn-secondary"
					onclick="location.href = '${ctxPath }/article/list.do' ">목록으로</button>
		</div>
	</div>
</body>
</html>

