<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert('1');
</script>

</head>
<body>
	<%! String name; %>
	<%  name= "홍길동"; %>
	
	<% String name2 = "홍길동2"; // 선언과 대입(초기화) 동시 가능 %>
	
	<% for ( int i = 0; i < 10; i++ ) {  %>
		<!-- 반복되는공간 -->
		안녕하세요, <%= name %>님 <br>
	<% } %>
       
</body>
</html>