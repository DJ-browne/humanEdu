<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
   		// infoSave.jsp : controller의 역할과 view의 역할 동시에 있는 페이지
   		// controller의 역할 : 화면이 나오기전에 처리해야하는 여러가지 상황(등록, 수정, 삭제, 조회등...)
   		// 					변수선언, if for 여러가지 로직...
   		
   		// infoSave.jsp : 해야할일
   		// 1. 앞선페이지(infoSave 페이지를 요청한 페이지, infoInput)에서 전해준 데이터를 변수 저장
   		// 		1 -1. 저장한 변수를 데이터베이스로 전달
   		// 2. 앞선페이지에서 전해준 데이터를 화면에 공유(출력)
   		request.setCharacterEncoding("utf-8");   
   
   
   %>
   
   <jsp:useBean id="info" class="info.beans.InfoBean">
   		<jsp:setProperty name="info" property="name"/>
   		<jsp:setProperty name="info" property="id"/>
   </jsp:useBean>

   
  <!--  view의 역할 : 사용자에게 출력해서 보여줄 화면, HTML / CSS / JS + java <%%> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 당신의 신상명세서(getter&setter)</h2>
	이름 : <%=info.getName() %> <br>
	주민번호 : <%=info.getId() %>
	
	<hr>
	<h2> 당신의 신상명세서(액션태그)</h2>
	이름 : <jsp:getProperty name="info" property="name"/> <br>
	주민번호 : <jsp:getProperty name="info" property="id"/> 
	
	<hr>
	<h2> 당신의 신상명세서(EL:표현언어))</h2>
	이름 : ${ info.name }<br>
	주민번호 : ${ info.id }
</body>
</html>