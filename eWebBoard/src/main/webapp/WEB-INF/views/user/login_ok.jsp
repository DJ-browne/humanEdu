<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<% if ( (request.getAttribute("userId") == request.getParameter("userId")) && (request.getAttribute("userPass") == request.getParameter("userPass"))  ) {%>
${sessionScope.userName} 님 로그인에 성공하셨습니다. <hr>
<%} else if ( (request.getAttribute("userId") == request.getParameter("userId"))   ) { %>


<% } %>
	
	
</body>
</html>