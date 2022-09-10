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
	dao.insert(vo);
	
    //진짜 애먹었던 부분이다..... 경로설정이 제대로 되지않아서 404 홈페이지 에러가 자꾸떠서 미치는 줄 알았다.
	response.sendRedirect(request.getContextPath() + "/board/question.jsp");
%>





