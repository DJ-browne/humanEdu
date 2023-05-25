<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<title> 우리 페이지 </title>
</head>
<body>

<%	
	String user = null;
// 	String user1 = "";  >> 비교시 >> user1.equals("") 
	//##########
	// 1. 요청을 통해 전송된 쿠키들을 얻어오기
	Cookie[] ck = request.getCookies();

	// 2. 내가 지정한 이름의 쿠키를 찾기
	for( int i = 0; ck != null && i < ck.length ; i++){
		// 3. 해당하는 그 쿠키의 값을 얻어와 변수에 저장
		if( (ck[i].getName()).equals("userId")){
			user = ck[i].getValue();
		}
		
	}
	
	if ( user == null ){
		response.sendRedirect("02_LoginForm.jsp");
	}
%>

	<h2> 이 페이지는 로그인을 하셔야만 볼 수 있는 페이지 입니다 </h2><br/><br/><br/>
	 <%=user %>님, 로그인 중입니다.


</body>
</html>