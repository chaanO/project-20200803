<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="${ctxPath }/main.jsp"><i class="fas fa-book-open"></i>&nbsp;중앙문고</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="${ctxPath }/bookpage1.jsp">시/에세이</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="${ctxPath }/bookpage2.jsp">소설</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="${ctxPath }/bookpage3.jsp">경제/경영</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="${ctxPath }/bookpage4.jsp">자기계발</a>
      </li>
    </ul>
    
    <div class="navbar-nav">
      <c:if test="${not empty sessionScope.authUser }">
      
         <a class="nav-link nav-item active">${authUser.name }님</a>
         
         <a class="nav-link nav-item active" href="${ctxPath }/logout.do"><i class="fas fa-user"></i>&nbsp;로그아웃</a>
         
         <a class="nav-link nav-item active" href="${ctxPath }/list.do"><i class="fas fa-shopping-cart"></i>&nbsp;장바구니</a>

         <a class="nav-link nav-item active" href="${ctxPath }/changeUser2.do"><i class="fas fa-users-cog"></i>&nbsp;계정관리</a>
         
         <a class="nav-link nav-item active" href="${ctxPath }/article/list.do"><i class="fas fa-question-circle"></i>&nbsp;고객센터</a>
         
      </c:if>

      <c:if test="${empty sessionScope.authUser }">
         <a class="nav-link nav-item active" href="${ctxPath }/login.do"><i class="fas fa-user"></i>&nbsp;로그인</a>
         
         <a class="nav-link nav-item active" href="${ctxPath }/join.do"><i class="fas fa-clipboard-list"></i>&nbsp;회원가입</a>
         
         <a class="nav-link nav-item active" href="${ctxPath }/article/list.do"><i class="fas fa-question-circle"></i>&nbsp;고객센터</a>
      </c:if>
   </div>
  </div>
</nav> 