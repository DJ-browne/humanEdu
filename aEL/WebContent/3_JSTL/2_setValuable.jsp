<%@page import="member.beans.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2_setValuable.jsp</title>
</head>
<body>

1. 자바소스 <br>
	<% 
   Member m = new Member();
   m.setName("홍길동");
   m.setAddr("수원");
	%>
이름 : <%=m.getName() %> / 주소 : <%=m.getAddr() %> <br>
이름2 : ${m.name } / 주소2 : ${m.addr }  <br><br>
<!-- 표현식(EL) 호출되는 변수는 request, session 등 JSP내에 있는 내장객체에 포함되어 있는 값을 표현
	Member m 은 내장객체가 아니라 내가 방금 만든 일반적인 객체
	그러므로 표현식과 연결이 되지않는 상태
 -->


2. JSTL 변수 선언하여 사용<br>
<c:set var="name1"><%=m.getName() %></c:set>
<c:set var="name2" value="<%=m.getName() %>"></c:set>
name1 : ${name1 }<br>
name2 : ${name2 }<br>
<hr>

<!-- 표현식(EL) 으로 표현하고자 하는 값이 있다면 c:set을 통해서 선언해주시면 됩니다. c태그방식-->
<c:set var="m2" value="<%=m %>"></c:set>
이름 3 : ${m2.name } / 주소 3 : ${m2.addr }<br>

</body>
</html>