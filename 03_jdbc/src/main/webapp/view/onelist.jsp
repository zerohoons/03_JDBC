<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 개인 정보 보기 </title>
<style type="text/css">
div{
text-align: center;
margin:100px;
auto;
}
table, th,td{
	    padding : 10px 5px;
	    border: 1px solid black;
	    border-collapse: collapse;
	    width: 300px;
	    margin: auto;
   }
input{
	padding: 10px;
}
</style>
<script type="text/javascript">
	function list_go(f) {
		f.action="list.jsp";
		f.submit();
	}
	function update_go(f) {
		f.action="update.jsp";
		f.submit();
	}
	function delete_go(f) {
		f.action="delete.jsp";
		f.submit();
	}	
</script>
</head>
<body>
<div>
<h2> 개인정보 보기 </h2>
	<form action="join_ok.jsp" method="post">
			<table>
				<tbody>
					<tr>
						<th  style="width: 40%" > ID </th><td>${vo2.id}</td>
					</tr><%--  --%>
					<tr>
						<th> PW </th><td>${vo2.pw}</td>
					</tr>
					<tr>
						<th> NAME </th><td>${vo2.name}</td>
					</tr>
					<tr>
						<th> AGE </th><td>${vo2.age}</td>
					</tr>
					<tr>
						<th> 주소 </th><td>${vo2.addr}</td>
					</tr>
					<tr>
						<th> 가입날짜 </th><td>${vo2.reg.substring(0,10)}</td>
					</tr>
				</tbody>
				<tfoot>
				<tr>
				<td colspan = "2">
				<input type="button" value="전체보기" onclick="list_go(this.form)">
				<input type="button" value="수정하기" onclick="update_go(this.form)">
				<input type="button" value="삭제하기" onclick="delete_go(this.form)">
				<%-- 정보가 session에 저장되어 있으므로, 브라우저가 꺼지지 않는 이상. 별도의 저장과정이 필요하지 않다.  
					 수정, 삭제를 위해서는 idx와 pw가 반드시 필요하다.--%>
					<input type="hidden" name ="idx" value ="${vo2.idx }">
					<input type="hidden" name ="pw" value ="${vo2.pw }">
				</td>
				</tr>
				</tfoot>
			</table>
	</form>
</div>
</body>
</html>