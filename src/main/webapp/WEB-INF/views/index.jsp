<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#LoginForm{
		width: 300px;
	}
</style>
<title>따숨, 마음을 나누다</title>

</head>
<body>
	<h1>따숨, 마음을 나누다</h1>
	<h3>메인페이지</h3>
	
	<form id="LoginForm" action="/member/login.do" method="post">
		<fieldset>
			<legend>로그인</legend>
		ID : <input type="text" name="userId"/><br>
		PW : <input type="password" name="userPwd"/><br>
		<input type="submit" value="로그인"/><br>
		</fieldset>
	</form>

</body>
</html>