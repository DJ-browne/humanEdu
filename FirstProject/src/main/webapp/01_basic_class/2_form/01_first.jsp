<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title> 로그인창 </title>
</head>
<body>

<h3>로그인 확인하기 </h3> 
<form action="01_second.jsp" method="get">
사용자: <input name='User' type='text'><br/>
비밀번호: <input name='Pass' type='password'><br/>
<input type='submit' value='login'> 
<!--  submit 버튼을 눌렀을때
	01_second.jsp 파일로 이동이 되면서
	input 태그들의 값을 가지고갑니다
	User = value값
	Pass = value값
	
	* 01_second.jsp ? User="" & Pass = ""
 -->
</form>

</body>
</html>