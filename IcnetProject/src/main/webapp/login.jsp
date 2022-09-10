<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="./CSS/logincss.css" rel="stylesheet" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
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
	</nav>

	
	<div class="container">
			<div class="jubmotron" style="padding-top:20px;">
				<form method="post" action="loginAction.jsp">
					<h1 style="text-align: center; color: white;">Login</h1>
					<br>
					<div class="form-group">
						<input type="text" autocomplete="off" class="form-control" placeholder="아이디" name="userID" maxlength="20">
						<label for="userId">ID</label>
					</div>

					<div class="form-group">
						<input type="password" autocomplete="off" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
						<label for="userPassword">Password</label>
					</div>
					<br>
					<input type="submit" class="login" value="로그인">
				</form>
				
				<div class="join">
				<a href="./join.jsp">회원가입</a>
				</div>
			</div>
	</div>
	
	
   
		
	<!--<a href="https://www.flaticon.com/kr/free-icons/github" title="github 아이콘"-->
	
	

</body>
</html>