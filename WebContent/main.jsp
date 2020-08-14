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
<link href="css/small-business.css" rel="stylesheet">
<title>중앙문고</title>
<style>
	.portfolio-item {
		margin-bottom: 30px;
	}
	
	 a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: black; text-decoration: underline;}
	 
	 .btn {cursor:pointer;}
</style>
</head>
<body class="bg-light">

	<my:navbar />

	<div class="container">
		<div class="row align-items-center my-5">
			<div class="col-lg-7">
				<!-- <img class="img-fluid rounded mb-4 mb-lg-0" src="http://placehold.it/900x400" alt=""> -->
				<my:carousel />
			</div>
			<!-- /.col-lg-8 -->
			<div class="col-lg-5">
				<!-- <h1 class="font-weight-light"><i class="fas fa-book-open"></i>&nbsp;중앙문고</h1>
        <p></p> -->
				<img src="images/비울수록 사람을 더 채우는 말 그릇.jpg" class="btn" height="300" alt="..." onclick="location.href='buy.jsp?no=${21}'">
				<img src="images/너에게 주고픈 아름다운 시.jpg" class="btn" height="300" alt="..." onclick="location.href='buy.jsp?no=${2}'">
			</div>
			<!-- /.col-md-4 -->
		</div>

		<!-- 베스트 셀러 -->
		<h3>○ 베스트 셀러</h3>
		<div class="row">
			<div class="col-lg-3 col-sm-6 portfolio-item">
				<div class="card h-200">
					<img class="btn" src="images/오베라는 남자.jpg" height="300" alt="" onclick="location.href='buy.jsp?no=${9}'">
					<div class="card-body">
						<h6 class="card-title" style="color: blue;" align="center">[소설]</h6>
						<p class="card-text" align="center"><a href="buy.jsp?no=${9}"><small><strong>오베라는 남자</strong></small></a></p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 portfolio-item">
				<div class="card h-200">
					<img class="btn" src="images/육아가 한 편의 시라면 좋겠지만.jpg" height="300" alt="" onclick="location.href='buy.jsp?no=${1}'">
					<div class="card-body">
						<h6 class="card-title" style="color: blue;" align="center">[시/에세이]</h6>
						<p class="card-text" align="center"><a href="buy.jsp?no=${1}"><small><strong>육아가 한편의 시라면 좋겠지만</strong></small></a></p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 portfolio-item">
				<div class="card h-200">
					<img class="btn" src="images/아주 작은 습관의 힘.jpg" height="300" alt="" onclick="location.href='buy.jsp?no=${18}'">
					<div class="card-body">
						<h6 class="card-title" style="color: blue;" align="center">[자기계발]</h6>
						<p class="card-text" align="center"><a href="buy.jsp?no=${18}"><small><strong>아주 작은 습관의 힘</strong></small></a></p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 portfolio-item">
				<div class="card h-200">
					<img class="btn" src="images/경제 상식사전.jpg" height="300" alt="" onclick="location.href='buy.jsp?no=${13}'">
					<div class="card-body">
						<h6 class="card-title" style="color: blue;" align="center">[경제/경영]</h6>
						<p class="card-text" align="center"><a href="buy.jsp?no=${13}"><small><strong>경제 상식사전</strong></small></a></p>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 화제의 신간 -->
		<h3>○ 화제의 신간</h3>
		<div class="row">
			<div class="col-lg-3 col-sm-6 portfolio-item">
				<div class="card h-200">
					<img class="btn" src="images/애쓰지 않고 편안하게.png" height="300" alt="" onclick="location.href='buy.jsp?no=${3}'">
					<div class="card-body">
						<h6 class="card-title" style="color: blue;" align="center">[시/에세이]</h6>
						<p class="card-text" align="center"><a href="buy.jsp?no=${3}"><small><strong>애쓰지 않고 편안하게</strong></small></a></p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 portfolio-item">
				<div class="card h-200">
					<img class="btn" src="images/돈의 속성.jpg" height="300" alt="" onclick="location.href='buy.jsp?no=${15}'">
					<div class="card-body">
						<h6 class="card-title" style="color: blue;" align="center">[경제/경영]</h6>
						<p class="card-text" align="center"><a href="buy.jsp?no=${15}"><small><strong>돈의 속성</strong></small></a></p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 portfolio-item">
				<div class="card h-200">
					<img class="btn" src="images/기분이 태도가 되지 않게.jpg" height="300" alt="" onclick="location.href='buy.jsp?no=${19}'">
					<div class="card-body">
						<h6 class="card-title" style="color: blue;" align="center">[자기계발]</h6>
						<p class="card-text" align="center"><a href="buy.jsp?no=${19}"><small><strong>기분이 태도가 되지 않게</strong></small></a></p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6 portfolio-item">
				<div class="card h-200">
					<img class="btn" src="images/만남은 지겹고 이별은 지쳤다.jpg" height="300" alt="" onclick="location.href='buy.jsp?no=${4}'">
					<div class="card-body">
						<h6 class="card-title" style="color: blue;" align="center">[시/에세이]</h6>
						<p class="card-text" align="center"><a href="buy.jsp?no=${4}"><small><strong>만남은 지겹고 이별은 지쳤다</strong></small></a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white"><i class="fas fa-book-open"></i>&nbsp;CHOONGANG 중앙문고</p>
    </div>
    <!-- /.container -->
  </footer>
</body>
</html>