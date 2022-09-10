<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="vo" class="board.BoardVo" />
<jsp:useBean id="dao" class="board.BoardDao" />
<jsp:setProperty name="vo" property="*" />

<%
	dao.update(vo); //자바빈의 아이디
	pageContext.setAttribute("vo", vo);
%>
	<!-- 경로 문제가 진짜 짜증날정도로 싫다. -->
<c:redirect url="${request.contextPath}/board/question.jsp?num=${vo.num}"/>





