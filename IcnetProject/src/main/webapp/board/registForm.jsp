<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../CSS/board.css" rel="stylesheet" type="text/css">
<title>JSP 게시판 웹 사이트</title>
</head>

<body>
<!-- 배경화면 이미지  -->
 <img class="image1" src="../image\pexels-sora-shimazaki-5926398.jpg">  
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
	
		
	<h1 class="registTitle"> 등록하기 </h1>
	<form class="regist"  action="./regist.jsp" method="post">
		<input class="registWrite" type="text" name="title" placeholder="제목" required>
		<br>
		<input class="registWrite" type="text" name="writer" placeholder="작성자" required>
		<br>
		<textarea class="registWrite" rows="4" cols="20" name="content" placeholder="내용" ></textarea>
		<br>
		<input class="registWrite" style="background-color: red;" type="submit" value="등록">
	</form>
	
	<!-- 로그인이 되어 있을경우 -->
		<%
			}	
			else
			{
		%>
	<nav class="titlemenu">
	 <h1 style="color:red; color: white;"><a href="./index.jsp" style="text-decoration: none; color: red;"> Dev.Kim</a></h1>
	 	<ul class="menu">
	 		<li><a href="./technologe.jsp">Technologe</a></li>
	 		<li><a href="#">Question</a></li>
	 		<li><a href="#">Most</a></li>
	 		<li><a href="#">Info</a></li>
	 	</ul>
		<nav class="mainloginbar">
			<a href="logoutAction.jsp">로그아웃</a>
		</nav>
	</nav>		
	
		
	<h1 class="registTitle"> 등록하기 </h1>
	<form class="regist" action="./regist.jsp" method="post">
		<input class="registWrite" type="text" name="title" placeholder="제목" required>
		<br>
		<input class="registWrite" type="text" name="writer" placeholder="작성자" required>
		<br>
		<textarea class="registWrite" rows="4" cols="20" name="content" placeholder="내용" ></textarea>
		<br>
		<input class="registWrite" style="background-color: red;" type="submit" value="등록">
	</form>
	
			<%
				}
			%>
</body>
</html>