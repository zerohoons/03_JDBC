<%@page import="com.ict.db.VO"%>
<%@page import="java.util.List"%>
<%@page import="com.ict.db.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	
		List<VO> list = DAO.getInstance().getSelectAll();
		
		pageContext.setAttribute("list", list);
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   div{text-align: center; margin: 100px; auto;}
   table, th,td{
	    padding : 10px 5px;
	    border: 1px solid black;
	    border-collapse: collapse;
	    width: 500px;
	    margin: auto;
   }	
   input{
      padding : 10px;
   }
   a{
   	text-decoration: none;
   }
   a:link, a:visited{
   	color: black;
   }
   a:hover{
   	font: 2em;
   	font-weight: bold;
   }
   
</style>
</head>
<body>
	<div>
	    <h2>전체 보기</h2>
		<form  method="post">
			<table>
				<thead>
				<tr>
					<th>IDX</th><th>ID</th><th>NAME</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="k" items="${list}">
					<tr>
					<td>${k.idx}</td> 
					<%-- 상세 페이지로 가기 --%>
					<td><a href="detail.jsp?idx=${k.idx}">${k.id}</a></td> 
					<td>${k.name }</td>
					</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
							
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>