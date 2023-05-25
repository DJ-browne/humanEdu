<%@page import="member.beans.Member"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	처음 실행했을때는 일반적인 화면 페이지(view의 역할)

	submit 기능이 있는 버튼을 누르고 나면
	
	두번째 실행이 되면서 역할이 추가됩니다. view의 역할 + controller의 역할
	두번째 실행이 되었을때는 이전페이지에서 값을 제출받습니다. guess 라는  값
	
 -->
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3_QuziNumberEL.jsp</title>
</head>
<body>
<!-- controller의 역할  name='guess'-->
<!-- 이전페이지에서 제출한 데이터를 저장  -->
<!-- 1. 이전 화면에서 얻어온 값을 guess 변수에 지정(저장) -->
<%-- <% String guess = request.getParameter("guess"); %> --%>
<c:set var="guess" value="${param.guess }"></c:set>

<!--  2. 그 값이 없다면 임의의 수를 만들어서 저장 -->
<c:if test="${empty guess}">
   자 게임을 시작합시다. <br>
   <% 
      int ranNum = Math.abs(new Random().nextInt()%100) + 1;
      // 저장 (세션을 이용)
      session.setAttribute("answer", ranNum);
   %>
</c:if>
<!--  3. 저장되어있는 값을 answer 변수에 지정 -->
<c:set var="answer" value="${sessionScope.answer }" scope="session"></c:set>

<!--  4. guess의 변수에 값이 있다면  -->
<!--  (1) guess와 answer의 값이 같다면 맞췃다고 출력 -->
<!--  (2) guess와 answer의 값이 다르면 , 크면 크다고 , 작으면 작다고 출력 -->

<c:if test="${ not (empty guess) }">
   <c:if test="${ answer == guess }">
  	    오 정답입니다.<br>
      <a href="3_QuziNumberEL.jsp">재도전</a><br><br>
   </c:if>
   
   <c:if test="${ answer != guess}">
	      오 오답입니다.<br>
	      <c:choose>
	         <c:when test="${answer > guess }"> 더 큰수 </c:when>
	         <c:when test="${answer < guess }"> 더 작은수</c:when>
	      </c:choose>
   </c:if>
</c:if>


<!-- view의 역할 -->
 	<hr><hr>
	   1부터 100까지 수 중에서 하나를 잘 찍으시오~!! <br/>
	   
	   <!-- action 이 없으면 자기자신 페이지로 이동 (3_QuziNumberEL.jsp) -->
	   <form method='get'>
	         어떤 수일까요?
	         <input type='text' name='guess'>
	         <input type='submit' value="Submit">
	   </form>
</body>
</html>