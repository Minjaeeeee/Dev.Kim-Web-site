<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="board.BoardDao" />


<%
	int num = Integer.parseInt(request.getParameter("num"));
	dao.delete(num);
%>
	<!-- 경로 문제가 진짜 짜증날정도로 싫다. -->
<c:redirect url="${request.contextPath}/board/question.jsp"/>





