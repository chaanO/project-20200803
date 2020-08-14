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
<title>회원정보 수정</title>
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
   <button type="button" class="btn btn-default" aria-label="Left Align" onclick="location='main.jsp'">
        <i class="fas fa-chevron-left"></i>
   </button>
   <h1>중앙문고</h1>
   <h5>회원정보 수정</h5>
   <form action="changeUser.do" method="post">   
      
     <div class="form-group">
       <label>현재 암호 </label>
       <input type="password" name="curPwd" class="form-control input-lg" placeholder="현재 암호">
       <small class="form-text text-muted">
          <c:if test="${errors.curPwd }">현재 암호를 입력하세요.</c:if>
      <c:if test="${errors.badCurPwd }">현재 암호가 일치하지 않습니다.</c:if>
       </small>
     </div>
     
     <div class="form-group">
       <label>새 암호</label>
       <input type="password" name="newPwd" class="form-control input-lg" placeholder="새 암호">
       <small class="form-text text-muted">
         <c:if test="${errors.newPwd }">새 암호를 입력하세요.</c:if>
       </small>
     </div>
     
     <div class="form-group">
       <label>새 전화번호</label>
       <input type="text" name="newPhone" class="form-control input-lg" placeholder="새 전화번호">
       <small class="form-text text-muted">
         <c:if test="${errors.newPhone }">새 전화번호를 입력하세요.</c:if>
       </small>
     </div>
          
     <div class="form-group">
       <label>새 주소</label>
       <input type="text" name="newAddr" class="form-control input-lg" placeholder="새 주소">
       <small class="form-text text-muted">
         <c:if test="${errors.newAddr }">새 주소를 입력하세요.</c:if>
       </small>
     </div>
     
     <div class="form-group">
     <label>이메일</label>
     <input type="email" name="newEmail" class="form-control" placeholder="이메일(email.@example.com)">
     <small class="form-text text-muted">
           <c:if test="${errors.newEmail }">새 이메일을 입력하세요. </c:if>
     </small>
     </div>
     
     <button type="submit" class="btn btn-dark btn-lg btn-block">변경완료</button>
   </form>


<form action="deleteUser.do">
<input type="submit" value="회원탈퇴" />
</form>
</div>



</body>
</html> 