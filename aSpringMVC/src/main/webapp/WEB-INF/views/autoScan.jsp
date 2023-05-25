<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--     <% String id = request.getParameter("id"); %> --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>
		autoScan 결과
	</h2>
	
	객체 주소 : ${vo }<br/>
	아이디 : <%=session.getAttribute("id") %><br/>
	아이디 : ${sessionScope.id }<br/>
	이름 : ${vo.name }<br/>
	나이 : ${vo.age }<br/>
</body>
</html>