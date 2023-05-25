<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 기존방식
	String name = request.getParameter("name");
	String id = request.getParameter("id");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>  당신의 신상명세서 확인 </h2>
	이   름  : <%= name %><br/>
	주민번호 : <%=id %><br/> 
	맞습니까????
</body>
</html>