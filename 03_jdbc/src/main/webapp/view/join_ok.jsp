<%@page import="com.ict.db.DAO"%>
<%@page import="com.ict.db.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	VO vo = new VO();
	vo.setId(request.getParameter("id"));
	vo.setPw(request.getParameter("pw"));
	vo.setName(request.getParameter("name"));
	vo.setAge(request.getParameter("age"));
	vo.setAddr(request.getParameter("addr"));
	
	//DB처리는 항상 DAO에서 이루어진다.
	int result = DAO.getInstance().getInsert(vo);
	pageContext.setAttribute("result", result);
%>

<c:choose>
	<c:when test="${result>0}">
	<script>
		alert("회원가입성공");
		location.href="index.jsp";
	</script>
	</c:when>
	<c:otherwise>
	<script>
		alert("회원가입실패");
		location.href="join.jsp";	
	</script>
	</c:otherwise>
</c:choose>