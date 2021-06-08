<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String idx = request.getParameter("idx");
	String pw = request.getParameter("pw");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   div{
   text-align: center; margin: 100px auto; width:500px;
   }
  fieldset{
  		border : 2px solid green;
   }	
   input{
      padding : 5px;
   }
</style>
<script type="text/javascript">
function delete_ok(f){
		var pw = f.pw.value;
	if("${param.pw}"== f.pw.value){
		var chk = confirm("계정을 삭제할까요?");
		if(chk){
			f.action="delete_ok.jsp";
			f.submit();
		}else{
			history.go(-1);
		}
	}else{
		alert("비밀번호가 잘못되었습니다.");
		pw = "";
		f.pw.value.focus();
		return;
	}
}
</script>
</head>
<body>
<div>
		<form  method="post">
			<fieldset>
		    <legend style="font-style: bold; font-size: 25px;">삭제하기</legend>
			비밀번호: <input type="password" name="pw" placeholder="비밀번호를 입력하세요." >
			<input type="button" value="삭제하기" onclick="delete_ok(this.form)">
			<input type="hidden" name = "idx" value="${param.idx}">
			</fieldset>
		</form>
	</div>
</body>
</html>