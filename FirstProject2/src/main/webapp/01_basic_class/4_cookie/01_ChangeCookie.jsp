<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
		
<html>
<head><title>쿠키</title></head>
<body>	

<b>Simple Cookie Example</b><hr>

<%	
// 1. 클라이언트로부터 Cookie를 얻어옴 
Cookie[] ck = request.getCookies();
// 2. 쿠키 이름 중에 "yourid"가 있는지 검색
	for ( int i = 0 ; ck!=null && i < ck.length ; i++){
		if( (ck[i].getName()).equals("yourid") ){
		// 3. 해당하는 쿠키가 있다면 그 이름과 새 값으로 새 쿠키를 만들고 전송
			Cookie c = new Cookie("yourid", URLEncoder.encode("변경아이디","UTF-8") );
			response.addCookie(c);
		}		
	}

%>


<br><a href="01_GetCookie.jsp"> 쿠키검색 </a>

</body></html>
