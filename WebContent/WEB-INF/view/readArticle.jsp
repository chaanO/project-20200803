<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
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
<title>Insert title here</title>
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

   <table border="1" width="100%">
      <tr>
         <td>제목</td>
         <td><c:out value='${articleData.article.title}'></c:out></td>
         <td>작성자</td>
         <td>${articleData.article.writer.name }</td>
      </tr>
      <tr>
         <td>내용</td>
         <td colspan="4" style = "white-space: pre-wrap;">
         <c:out value="${articleData.content }"/></td>
         
      </tr>
      <tr>
      <td colspan="4">댓글 </td>
      </tr>
      <tr>
         <td colspan="4">
         <c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }" /> 
         <a href="list.do?pageNo=${pageNo}">[목록]</a> 
         <c:if test="${authUser.id == articleData.article.writer.id}">
               <a href="modify.do?no=${articleData.article.number}">[게시글수정]</a>
               <a href="delete.do?no=${articleData.article.number}">[게시글삭제]</a>
            </c:if></td>
      </tr>
   </table>



	<div >
		<my:alert />
		<h1>댓글</h1>
		<form action="write" method="post">
			<div class="form-group">
				<label for="exampleInputEmail1">이름:</label> <input
					required="required" type="text" name="name" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp">
			</div>

			<div class="form-group">
				<label for="exampleFormControlTextarea1">댓글내용:</label>
				<textarea required="required" name="message" class="form-control"
					id="exampleFormControlTextarea1" rows="3"></textarea>
			</div>
			
			<input type="text" name="no" value="${param.no }" hidden />
			<input type="text" name="pageNo" value="${param.pageNo }" hidden />
			<input type="text" name="articleNo" value="${param.no }" hidden />
			
			
			<button type="submit" class="btn btn-primary">댓글 등록</button>
		</form>
	</div>

	<hr />

	
		<div>
		<c:forEach var="message" items="${list.commentList }">
		<c:if test="${message.articleNo eq param.no}">
			<div class="media border p-3">
				<!-- <span class="mr-3">${message.articleNo}</span> -->

				<div class="media-body">
					<h5 class="mt-0">${message.writerName }</h5>
					${message.message }

					<a data-toggle="modal" href="#exampleModal"
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
					<h5 class="modal-title" id="exampleModalLabel"> 댓글을 삭제하시겠습니까?</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">아니요</button>
						
					<form action="delete" method="post">
					<input type="text" hidden id="recipient-name" name="commentNo" />
					
					<input type="text" name="no" value="${param.no }" hidden />
					<input type="text" name="pageNo" value="${param.pageNo }" hidden />
					<input type="text" name="articleNo" value="${param.no }" hidden />
					
					<input type="submit" class="btn btn-secondary" value="예" />
					</form>
				</div>
			</div>
		</div>
	</div>



		

</body>
</html>