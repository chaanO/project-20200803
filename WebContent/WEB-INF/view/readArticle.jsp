<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
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

#ex1 {
	width: 150px;
	text-align: left;
	box-sizing: border-box
}

#ex2 {
	width: 800px;
	text-align: left;
	box-sizing: border-box
}
</style>

<script>
	$(function() {
		$('#exampleModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget);
			var recipient = button.data('message-id');
			var modal = $(this);
			modal.find('#recipient-name').val(recipient);
		});
	});
</script>

</head>
<body>
	<my:navbar />
	<br>
	<h1>문의하신 내용입니다.</h1>

<div class="container-fluid" >
	<table border="1" width="100%">
		<tr>
			<td id="ex1">글 번호</td>
			<td id="ex2">${articleData.article.number }</td>
			<td id="ex1">조회수</td>
			<td id="ex1">${articleData.article.readCount}</td>
		</tr>	
		<tr>	
			<td id="ex1">제목</td>
			<td id="ex2">${articleData.article.title}</td>
			<td id="ex1">작성자</td>
			<td id="ex1">${articleData.article.writer.name }</td>
		</tr>
		<tr>
			<td id="ex1">내용</td>
			<td colspan="4">
			${articleData.content }</td>

		</tr>
		<tr>
			<td colspan="4"><c:set var="pageNo"
					value="${empty param.pageNo ? '1' : param.pageNo }" /> <a
				href="list.do?pageNo=${pageNo}">[목록]</a> <c:if
					test="${authUser.id == articleData.article.writer.id}">
					<a href="modify.do?no=${articleData.article.number}">[게시글수정]</a>
					<a href="delete.do?no=${articleData.article.number}">[게시글삭제]</a>
				</c:if></td>
		</tr>
	</table>



	<div>
		<!-- 댓글 입력 -->
		<h1>댓글</h1>
		<form action="write" method="post">

			<div class="form-group">
				<label for="exampleFormControlTextarea1">댓글내용:</label>
				<textarea required="required" name="message" class="form-control"
					id="exampleFormControlTextarea1" rows="3"></textarea>
			</div>

			<input type="hidden" name="name" value="${authUser.name }" /> <input
				type="hidden" name="no" value="${param.no }" /> <input
				type="hidden" name="pageNo" value="${param.pageNo }" /> <input
				type="hidden" name="articleNo" value="${param.no }" />


			<button type="submit" class="btn btn-primary">댓글 등록</button>
		</form>
	</div>

	<hr />


	<div>
		<!-- 댓글 확인 -->
		<c:forEach var="message" items="${list.commentList }">
			<c:if test="${message.articleNo eq param.no}">
				<div class="media border p-3">
					<!-- 댓글 번호 <span class="mr-3">${message.articleNo}</span> -->

					<div class="media-body">
						<h5 class="mt-0">${message.writerName }</h5>

						${message.message } <a data-toggle="modal" href="#exampleModal"
							data-message-id="${message.commentNo }" class="btn-delete">삭제하기</a>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>

	<hr />


	<!-- 삭제 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">댓글을 삭제하시겠습니까?</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">아니요</button>

					<form action="delete" method="post">
						<input type="hidden" id="recipient-name" name="commentNo" /> <input
							type="hidden" name="no" value="${param.no }" /> <input
							type="hidden" name="pageNo" value="${param.pageNo }" /> <input
							type="hidden" name="articleNo" value="${param.no }" /> <input
							type="submit" class="btn btn-secondary" value="예" />
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>