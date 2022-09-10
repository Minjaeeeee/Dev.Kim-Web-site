<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<jsp:useBean id="dao" class="board.BoardDao" />

<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardVo vo = dao.selectOne(num);
	pageContext.setAttribute("vo", vo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>
</head>

<body>
	<h3>수정하기</h3>
		<!-- 경로 설정 틀림 -->
	<form action="edit.jsp" method="post">
		<input type="hidden" name="num" value="${vo.num }">
		<input type="text" name="title" value="${vo.title}" required><br> <!-- 타이틀의 제목을 보여주게 된다. -->
		<input type="text" name="writer" value="${vo.writer}" required disabled><br> <!-- disabled는 작성자 부분을 아예 수정을 못하게 할 수 있음 -->
		<textarea rows="4" cols="20" name="content" placeholder="내용" >${vo.content}</textarea><br>
		<input type="submit" value="수정">
	</form>

</body>
</html>