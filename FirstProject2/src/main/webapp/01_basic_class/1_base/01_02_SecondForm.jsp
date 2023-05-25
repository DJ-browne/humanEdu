<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_02_SecondForm.jsp</title>
</head>
<body>
<%
	// Form 태그 자식중에 input 태그내의 name속성 의 속성명
	// 주소상의 Parameter 값이 됩니다. >> String형태

	// 주소상의 Parameter 값은 request 객체 안에 담겨있습니다.
	// name 속성의 속성명과 동일하게 담겨있습니다 >> input태그의 value라는 값
	
	// <input type="text" name="id">
	// request.getParameter("name속성명") 
	//		>> input 태그의 값을 문자열의 형태로 리턴
	// input 태그의 값 > value="값" 
	// 리턴된 형태(데이터)를 변수에 "저장"하여 사용
	String userId = request.getParameter("id");
	String userPwd = request.getParameter("pwd");

%>
	<h2> 폼의 입력 처리 </h2>
	입력받은 아이디 : <%=userId %>	<br>
	입력받은 비밀번호 : 	<%=userPwd %><br>
	
	<!-- 
		아이디와 비밀번호를 입력받아서 java 라는 공간에 저장
		
		로그인 > 우리가 가지고있는 회원명부와 비교 
			> id가 있냐 없냐 pwd 맞냐 틀리냐 > 확인 - 로그인 / 미확인 - 다시입력
			
		1. 데이터 입력 			> HTML(JSP), JavaScript 
		2. 데이터 확인 작업			> 서버 , Java , JavaScript 
		3. 데이터의 기준값(회원명부)	> 서버에 저장되어있는공간 ( DB, DataBase )
		
		입력받은 값과 DataBase 값을 서버가 비교를 하는것
	 -->
</body>
</html>