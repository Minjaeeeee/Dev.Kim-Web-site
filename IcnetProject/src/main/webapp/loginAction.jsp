<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="user1.UserDAO" %>
 <%@ page import="java.io.PrintWriter" %>
 
  <!-- 한글 영어 전부 사용가능한 UTF-8로 받으라는 뜻이다. -->
 <% request.setCharacterEncoding("UTF-8");%> 

 <jsp:useBean id="user" class="user1.User" scope="page" /> 
 <!-- 값을 설정해준다 -->
 <jsp:setProperty name="user" property="userID" /> 
 <!-- 값을 설정해준다. -->
 <jsp:setProperty name="user" property="userPassword" />
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1"> 
<link href="./CSS/main.css" rel="stylesheet" type="text/css">
<title>JSP 게시판 웹 사이트</title>
</head>

<body>
 
 	<%
 		String userID = null;
 		if(session.getAttribute("userID")!= null)
 		{
 			userID = (String) session.getAttribute("userID");
 		}
 		
 		if(userID != null)
 		{
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('이미 로그인이 되어있습니다.')");
 			script.println("location.href = 'main.jsp'"); //틀리고나서 전에 있던 페이지로 넘어가게 하는 것이다
 			script.println("</script>");
 		}
 		
 		UserDAO userDAO = new UserDAO();
 		int result = userDAO.login(user.getUserID(), user.getUserPassword());
 		if(result==1)
 		{
 			session.setAttribute("userID", user.getUserID()); //속성값지정해줌! 자바빈 패키지에 있음
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("location.href = 'main.jsp'");
 			script.println("</script>");
 		}
 		
 		else if(result==0)
 		{
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('비밀번호가 틀립니다')");
 			script.println("history.back()"); //틀리고나서 전에 있던 페이지로 넘어가게 하는 것이다
 			script.println("</script>");
 		}
 		
 		else if(result== -1)
 		{
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('존재하지 않는 아이디입니다')");
 			script.println("history.back()"); //틀리고나서 전에 있던 페이지로 넘어가게 하는 것이다
 			script.println("</script>");
 		}
 		
 		else if(result== -2)
 		{
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('데이터베이스 오류가 발생했습니다.')");
 			script.println("history.back()"); //틀리고나서 전에 있던 페이지로 넘어가게 하는 것이다
 			script.println("</script>");
 		}
 	%>
	

</body>
</html>