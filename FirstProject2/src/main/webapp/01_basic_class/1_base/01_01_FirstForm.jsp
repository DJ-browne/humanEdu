<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_01_FirstForm.jsp</title>
</head>
<body>
 <h3>로그인하기</h3>
 <form method="post" action="01_02_SecondForm.jsp">
 	<table border="1">
		<tr>
			<th>사용자아이디</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pwd"></td>
		</tr>
		<tr>
			<td colspan="2"> <input type="submit" value="Login"></td>
		</tr>
	</table>
 </form>
</body>
</html>