<%@page import="board.BoardVo"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List" %> <!-- LIST 태그 선언 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.PrintWriter" %>   

<%
	BoardDao dao = new BoardDao(); //BoardDao 선언으로 db에 접근
	List<BoardVo> ls = dao.selectAll(); //BoardVo 리스트로 반환을 해옴
	pageContext.setAttribute("ls", ls); //ls에다가 ls에 담겨줌
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="./CSS/question.css" rel="stylesheet" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="../CSS/question.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>

<body>
 
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
			<a href="login.jsp">로그인</a>
		</nav>
	</nav>	
	
	<h2  class="questionTitle"> 게시글 목록 </h2>
	
	<table class="questionTable" border="1">
		<tr>
		<th>번호</th> 
		<th>제목</th> 
		<th>작성자</th>
		<th>내용</th>
		<th>등록일</th> 
		<th>조회수</th> 
		</tr> 
		<c:forEach var="board" items="${ls}"> 
		<tr>
			<td>${board.num}</td>
			<td><a style="text-decoration: none; , color:black;" href="${pageContext.request.contextPath}/board/boardDetail.jsp?num=${board.num}"> ${board.title}</a></td> <!-- 보려는 게시글의 번호를 넘겨준다. -->
			<td>${board.writer }</td>
			<td>${board.content}</td>
			<td>${board.regdate }</td>
			<td>${board.cnt}</td>
		</tr>
		</c:forEach>
		
	</table>
	<a class="questionSubmit" href="<c:url value="/board/registForm.jsp"/>"><button>글 등록</button></a>
	
	
	
	
	
	
	
	<!-- 로그인이 되어 있을경우 -->
		<%
			}	
			else
			{
		%>
	<nav class="titlemenu">
	 <h1 style="color:red;"><a href="./index.jsp" style="text-decoration: none; color: red;"> Dev.Kim</a></h1>
	 	<ul class="menu">
	 		<li><a href="#">Technologe</a></li>
	 		<li><a href="#">Question</a></li>
	 		<li><a href="#">Most</a></li>
	 		<li><a href="#">Info</a></li>
	 	</ul>
		<nav class="mainloginbar">
			<a href="logoutAction.jsp">로그아웃</a>
		</nav>
	</nav>		
	
	<h2 class="questionTitle"> 게시글 목록 </h2>
	
	<table  class="questionTable" border="1">
		<tr>
		<th>번호</th> 
		<th>제목</th> 
		<th>작성자</th>
		<th>내용</th>
		<th>등록일</th> 
		<th>조회수</th> 
		</tr> 
		<c:forEach var="board" items="${ls}"> 
		<tr>
			<td>${board.num}</td>
			<td><a href="${pageContext.request.contextPath}/board/boardDetail.jsp?num=${board.num}"> ${board.title}</a></td> <!-- 보려는 게시글의 번호를 넘겨준다. -->
			<td>${board.writer }</td>
			<td>${board.content}</td>
			<td>${board.regdate }</td>
			<td>${board.cnt}</td>
		</tr>
		</c:forEach>
	</table>
	<a class="questionSubmit" href="<c:url value="/board/registForm.jsp"/>"><button>글 등록</button></a>
	
			<%
				}
			%>


</body>
</html>