 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="user1.UserDAO" %>
 <%@ page import="java.io.PrintWriter" %>
 
 <!-- 한글 영어 전부 사용가능한 UTF-8로 받으라는 뜻이다. -->
 <% request.setCharacterEncoding("UTF-8");%> 

 <jsp:useBean id="user" class="user1.User" scope="page" /> 
 
 <!-- 값을 설정해주는 단계 아이디, 패스워드, 이름, 성별, 이메일을 입력받는다. -->
 <jsp:setProperty name="user" property="userID" /> 
 <jsp:setProperty name="user" property="userPassword" />
 <jsp:setProperty name="user" property="userName" />
 <jsp:setProperty name="user" property="userGender" />
 <jsp:setProperty name="user" property="userEmail" />
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1"> 
<link rel="stylesheet" href="css/bootstrap.css">
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
 	
 	    //개인 정보가 전부 입력이 안되어 있을때 경고문 출력시키는 코드이다.
 		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null
 		|| user.getUserEmail() == null )
 		{
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('입력이 안된 사항이 있습니다.')");
 			script.println("history.back()"); //틀리고나서 전에 있던 페이지로 넘어가게 하는 것이다
 			script.println("</script>");
 		}
 	
 		else
 		{
 			UserDAO userDAO = new UserDAO();
 	 		int result = userDAO.join(user); //자바 빈에서 사용하는 user를 가져온다.
 	 		
 	 		if(result == -1)
 	 		{
 	 			PrintWriter script = response.getWriter();
 	 			script.println("<script>");
 	 			script.println("alert('이미 존재하는 아이디입니다.')");
 	 			script.println("history.back()"); //틀리고나서 전에 있던 페이지로 넘어가게 하는 것이다
 	 			script.println("</script>");
 	 		}
 	 		
 	 		
 	 		else 
 	 		{
 	 			session.setAttribute("userID", user.getUserID()); //속성값지정해줌! 자바빈 패키지에 있음
 	 			PrintWriter script = response.getWriter();
 	 			script.println("<script>");
 	 			script.println("location.href = 'main.jsp'"); 
 	 			script.println("</script>");
 	 		}
 		}
 	%>
	

</body>
</html>