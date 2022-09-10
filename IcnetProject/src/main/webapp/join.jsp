<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="./CSS/joincss.css" rel="stylesheet" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>JSP 게시판 웹 사이트</title>
</head>


<body>
	<img class="image1" src="image\pexels-sora-shimazaki-5926398.jpg">
 
    <!-- 메뉴바이다 상단 메뉴바 -->
	<nav class="titlemenu">
	 <h1 style="color:red;"><a href="./index.jsp" style="text-decoration: none; color: red;"> Dev.Kim</a></h1>
	 	<ul class="menu">
	 		<li><a href="./technologe.jsp">Technologe</a></li>
	 		<li><a href="./board/question.jsp">Question</a></li>
	 		<li><a href="./most.jsp">Most</a></li>
	 		<li><a href="./info.jsp">Info</a></li>
	 	</ul>
		<nav class="mainloginbar">
			<a href="./login.jsp">로그인</a>
		</nav>
	</nav>
	
	
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jubmotron" style="padding-top:20px;">
				<form method="post" action="joinAction.jsp">
					<h3 style="text-align: center; font-size: 30px ">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
					</div>
					
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<!-- 성별 기입란이다. -->
							<label class="btn btn-primary active">
								<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
							</label>
							
							<label class="btn btn-primary">
								<input type="radio" name="userGender" autocomplete="off" value="여자">여자
							</label>
						</div>
					</div>
					
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
					</div>
					<input type="submit" class="join" value="회원가입">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
		
	

</body>
</html>