<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% // String gender = "female"; %>
<!-- JSTL을 이용한 변수 선언 -->
<c:set var="gender" value="female" />

<!-- 흐름 제어 -->
<!-- if문 / {} 와 " 사이에는 공백이 있으면 안됩니다. -->

<c:if test="${ gender eq 'male' }">당신은 남자입니다.</c:if><br> <!-- eq 이퀄  -->
<c:if test="${ gender == 'female'}">당신은 여자입니다.</c:if><br>

<%-- <% if( gender.equals ) { %> --%>
<!-- 	당신은 남자입니다. <br> -->
<%-- <% }else { %> --%>
<!-- 	당신은 여자입니다.<br> -->
<%-- <% } %> --%>

<c:set var="age" >24</c:set>
<c:if test="${ age ge 20  }"> 당신은 성인입니다. </c:if> <br/><br/>

<!-- choose 태그 안에 html 주석는  에러나고 jsp 주석은 인식 됨 -->
 
<c:choose> 
   <c:when test="${ age lt 10 }"> 당신은 어린이입니다. </c:when>
   <c:when test="${ age ge 10 and age le 20 }" > 당신은 청소년입니다.</c:when>
   <c:otherwise> 당신은 성인입니다. </c:otherwise>
</c:choose>

<%-- <c:set var="sum" value="0" /> --%>
<!-- sum 변수에 자동으로 0 초기화가 되어 위 코드 필요없지만  -->
<%-- i 라는 변수가 1 ~ 100 까지 반복 --%>
<c:forEach var="i" begin="1" end="100">
<c:set var="sum" value="${ sum + i }" />   
</c:forEach>
1~100까지의 합 : ${sum}  <br/>  <hr/>

<%-- <% --%>
<!-- // 	int sum = 0;	 -->
<!-- //     for(int i = 0 ; i < 101 ; i++){  -->
<!-- // 		sum += i; -->
<!-- //     } -->
<%-- %> --%>
<%-- <%= sum %> --%>

<!-- 짝수의 합과 홀수의 합을 구하기 -->

<c:forEach var="i" begin="1" end="100"> 
   <c:if test="${ i % 2 == 0 }">
      <c:set var="even1" value="${ even1 + i }" />   
   </c:if>
   <c:if test="${ i % 2 == 1 }">
      <c:set var="odd1" value="${ odd1 + i }" />   
   </c:if>
</c:forEach>
1~100까지의 짝수합 : ${even1}  <br/>  <hr/>
1~100까지의 홀수합 : ${odd1}  <br/>  <hr/>

<c:forEach var="i" begin="1" end="100"> 
   <c:choose>
      <c:when test="${ i % 2 == 0 }">
         <c:set var="even2" value="${ even2 + i }" />   
      </c:when>
      <c:when test="${ i % 2 == 1 }">
         <c:set var="odd2" value="${ odd2 + i }" />   
      </c:when>
   </c:choose>   
</c:forEach>
1~100까지의 짝수합 : ${even2}  <br/>  <hr/>
1~100까지의 홀수합 : ${odd2}  <br/>  <hr/>
<!-- 변수를 하나 선언하여 그 변수 값에 따른 구구단 출력 -->

<c:set var="dan">9</c:set>

${dan } 단 : <br>
<c:forEach var="i" begin="1" end="9">
	${dan} X ${i} = ${dan * i }<br/>
</c:forEach>




</body>
</html>