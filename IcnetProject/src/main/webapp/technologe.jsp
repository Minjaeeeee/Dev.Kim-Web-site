<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="./CSS/technologe.css" rel="stylesheet" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>

<body>
 
 <img class="image1" src="image\pexels-sora-shimazaki-5926398.jpg">

 	<%
		String userID = null; //빈값이다.
		if(session.getAttribute("userID")!= null) 
		{
			userID = (String) session.getAttribute("userID");
		}
	%>

	<!-- 아이디가 되어 있지 않았을 경우이다. -->
			<%
				if(userID == null)
				{
			%>

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
	
	<h1 class="tech-h1">민재님이 사용하실 줄 아는 언어는?</h1>
	
	<div class="sns-image">
		<div class="c-icon">
			<img src="./image/c.png" style="width: 100px; height: 100px;">
		</div>
	
		<div class="html-icon">
			<img src="./image/free-icon-html-5-5968267.png" style="width: 100px; height: 100px;">
		</div>

		<div class="css-icon">
			<img src="./image/free-icon-css-3-5968242.png" style="width: 100px; height: 100px;">
		</div>
		
		<div class="java-icon">
			<img src="./image/java (1).png" style="width: 100px; height: 100px;">
		</div>
		
		<div class="jsp-icon">
			<img src="./image/jsp.png" style="width: 100px; height: 100px;">
		</div>
		
	</div>

	<!-- 로그인이 되어 있을경우 -->
		<%
			}	
			else
			{
		%>

	  <nav class="titlemenu">
	 <h1 style="color:red;"><a href="./index.jsp" style="text-decoration: none; color: red;"> Dev.Kim</a></h1>
	 	<ul class="menu">
	 		<li><a href="./technologe.jsp">Technologe</a></li>
	 		<li><a href="./board/question.jsp">Question</a></li>
	 		<li><a href="./most.jsp">Most</a></li>
	 		<li><a href="./info.jsp">Info</a></li>
	 	</ul>
	 	
		<nav class="mainloginbar">
			<a href="logoutAction.jsp">로그아웃</a>
		</nav>
	</nav>	
	
	<h1 class="tech-h1">민재님이 사용하실 줄 아는 언어는?</h1>
	
	<div class="sns-image">
		<div class="c-icon">
			<img src="./image/c.png" style="width: 100px; height: 100px;">
		</div>
	
		<div class="html-icon">
			<img src="./image/free-icon-html-5-5968267.png" style="width: 100px; height: 100px;">
		</div>

		<div class="css-icon">
			<img src="./image/free-icon-css-3-5968242.png" style="width: 100px; height: 100px;">
		</div>
		
		<div class="java-icon">
			<img src="./image/java (1).png" style="width: 100px; height: 100px;">
		</div>
		
		<div class="jsp-icon">
			<img src="./image/jsp.png" style="width: 100px; height: 100px;">
		</div>
		
	</div>
	<%
		}
	%>

</body>
</html>
	
	<!-- 출처 -->
	<!-- 
		<a href="https://www.flaticon.com/kr/free-icons/html-5" title="html 5 아이콘">Html 5 아이콘  제작자: Freepik - Flaticon</a>
		<a href="https://www.flaticon.com/kr/free-icons/css-3" title="css 3 아이콘">Css 3 아이콘  제작자: Freepik - Flaticon</a>
		<a href="https://www.flaticon.com/free-icons/java" title="java icons">Java icons created by Freepik - Flaticon</a>
		<a href="https://www.flaticon.com/free-icons/java" title="java icons">Java icons created by Freepik - Flaticon</a>
		<a href="https://www.flaticon.com/free-icons/alphabet" title="alphabet icons">Alphabet icons created by Freepik - Flaticon</a>
		<a href="https://www.flaticon.com/free-icons/jsp" title="jsp icons">Jsp icons created by IconMarketPK - Flaticon</a>
	 -->

