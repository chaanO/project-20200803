<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
	.btn {cursor:pointer;}
</style>

<div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-interval="2000">
      <img src="images/킵.jpg" class="d-block w-100 btn" height="300" alt="..." onclick="location.href='buy.jsp?no=${14}'">
    </div>
    <div class="carousel-item" data-interval="2000">
      <img src="images/누구나.jpg" class="d-block w-100 btn" height="300" alt="..." onclick="location.href='buy.jsp?no=${0}'">
    </div>
    <div class="carousel-item" data-interval="2000">
      <img src="images/영어.jpg" class="d-block w-100 btn" height="300" alt="..." onclick="location.href='buy.jsp?no=${20}'">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>