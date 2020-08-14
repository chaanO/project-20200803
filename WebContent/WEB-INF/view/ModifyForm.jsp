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
<title>Insert title here</title>
<style>
.container-fluid {
	background-color: white;
	width: 1000px;
}
</style>
</head>
<body>
	<my:navbar />

	<div class="container-fluid">
	<h3>
		<br />수정하실 내용을 입력해주세요
	</h3>

		<form action="modify.do?no=${modReq.articleNumber}" method="post">
			<div class="form-group">
				<label for="writer">게시글 번호</label> <input type="text" name="name"
					class="form-control input-lg" value="${modReq.articleNumber }"
					disabled="disabled" />
			</div>
			<div class="form-group">
				<label for="title">제목</label> <input type="text" name="title"
					class="form-control input-lg" value="${modReq.title }" /> <small
					class="form-text text-muted"> <c:if test="${errors.title }">제목을 입력하세요</c:if>
				</small>
			</div>
			<div class="form-group">
				<label for="writer">작성자</label> <input type="text" name="name"
					class="form-control input-lg" value="${modReq.userName }"
					disabled="disabled" />
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea name="content" rows="20" cols="200" class="form-control">${modReq.content}</textarea>
			</div>
			<input type="submit" class="btn btn-dark btn-lg btn-block" value="글 수정" />
		</form>
	</div>
</body>
</html>