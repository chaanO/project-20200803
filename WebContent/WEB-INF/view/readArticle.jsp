<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<%
	//줄바꿈
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
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

#ex1 {
	width: 20px;
	height: 40px;
	text-align: left;
	box-sizing: border-box;
	background-color: #E9ECEF;
}

#ex2 {
	width: 500px;
	height: 40px;
	text-align: left;
	box-sizing: border-box
}

#ex4{
	width: 20px;
	height: 40px;
	text-align: left;
	box-sizing: border-box;
}

#ex3{
	width: 20px;
	height: 500px;
	text-align: left;
	background-color: #E9ECEF;
	
}

.container-fluid {
	background-color: white;
	width: 1300px;
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
<div class="container-fluid" >
	<br /><h3><i class="fas fa-pencil-alt"></i>&nbsp;문의하신 내용입니다.</h3>
	<br />
	<table class="table table-bordered" border="" width="100%">
		<tr>
			<td id="ex1">글 번호</td>
			<td id="ex2">${articleData.article.number }</td>
			<td id="ex1">조회수</td>
			<td id="ex4">${articleData.article.readCount}</td>
		</tr>	
		<tr>	
			<td id="ex1">제목</td>
			<td id="ex2">${articleData.article.title}</td>
			<td id="ex1">작성자</td>
			<td id="ex4">${articleData.article.writer.name }</td>
		</tr>
		<tr>
			<td id="ex3">내용</td>
			<td colspan="4" >${fn:replace(articleData.content,cn, br) }</td>

		</tr>
		<tr>
	</table>

	<table border="0" align="right">
			<td>
			<c:set var="pageNo"
					value="${empty param.pageNo ? '1' : param.pageNo }" /> <a
				class="btn btn-secondary" href="list.do?pageNo=${pageNo}" role="button">목록</a> 
				
				<c:if test="${authUser.id == articleData.article.writer.id}">
					<a class="btn btn-secondary" href="modify.do?no=${articleData.article.number}" role="button">수정</a>
					<a class="btn btn-secondary" href="delete.do?no=${articleData.article.number}" role="button">삭제</a>
				</c:if>
				
				
				</td>
	</table>
<br />

		<!-- 댓글 입력 -->
	<div>
		<form action="write" method="post">
			<br />
			<h3>답변</h3>
			<div class="form-group" align="right">
				<textarea required="required" name="message" class="form-control"
					id="exampleFormControlTextarea1" rows="6"></textarea>

			<input type="hidden" name="name" value="${authUser.name }" /> <input
				type="hidden" name="no" value="${param.no }" /> <input
				type="hidden" name="pageNo" value="${param.pageNo }" /> <input
				type="hidden" name="articleNo" value="${param.no }" />
	<br />

			<button type="submit" class="btn btn-secondary">댓글 등록</button>
			</div>
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
						<h5 class="mt-0"><strong>${message.writerName }</strong></h5>
						${fn:replace(message.message, cn, br) }
					</div>
					
					<c:if test="${authUser.name eq message.writerName}">
						<a data-toggle="modal" href="#exampleModal"
							data-message-id="${message.commentNo }" class="btn-delete">삭제하기</a>
					</c:if>			
							
				</div>
			</c:if>
		</c:forEach>
		
		
	</div>


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
					<br />
					<br />
				</div>
			</div>
		</div>
	</div>
</div>
<p>&nbsp; </p>

	<!-- footer -->
	<footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white"><i class="fas fa-book-open"></i>&nbsp;CHOONGANG 중앙문고</p>
    </div>
    <!-- /.container -->
  </footer>
</body>
</html>