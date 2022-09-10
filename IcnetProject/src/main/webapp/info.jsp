<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="./CSS/info.css" rel="stylesheet" type="text/css">
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
	
	<div class="sns-image">
		<div class="github-icon">
			<img src="./image/github.png" style="width: 150px; height: 150px;">
			<br>
			<br>
			<a href="https://github.com/Minjaeeeee">  Dev.Kim의 깃허브   </a>
		</div>

		<div class="instagram-icon">
			<img src="./image/instagram.png" style="width: 150px; height: 150px;">
			<br>
			<br>
			<a href="https://www.instagram.com/developer_dailystudy/">Dev.Kim의 공스타그램</a>
		</div>
		
		<div class="blog-icon">
			<img src="./image/blog.png" style="width: 150px; height: 150px;">
			<br>
			<br>
			<a href="https://blog.naver.com/kmj6832596">Dev.Kim의 블로그</a>
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
	
	<div class="sns-image">
		<div class="github-icon">
			<img src="./image/github.png" style="width: 150px; height: 150px;">
			<br>
			<br>
			<a href="https://github.com/Minjaeeeee">  Dev.Kim의 깃허브   </a>
		</div>

		<div class="instagram-icon">
			<img src="./image/instagram.png" style="width: 150px; height: 150px;">
			<br>
			<br>
			<a href="https://www.instagram.com/developer_dailystudy/">Dev.Kim의 공스타그램</a>
		</div>
		
		<div class="blog-icon">
			<img src="./image/blog.png" style="width: 150px; height: 150px;">
			<br>
			<br>
			<a href="https://blog.naver.com/kmj6832596">Dev.Kim의 블로그</a>
		</div>
		
	</div>
		
	<%
		}
	%>


	<!-- 깃허브 아이콘 출처이다. -->
	<!--  
	<a href="https://www.flaticon.com/free-icons/instagram" title="instagram icons">Instagram icons created by Freepik - Flaticon</a>
	<a href="https://www.flaticon.com/free-icons/github" title="github icons">Github icons created by Laisa Islam Ani - Flaticon</a>
	<a href="https://www.flaticon.com/free-icons/blog" title="blog icons">Blog icons created by Freepik - Flaticon</a>
	-->
	

</body>
</html>