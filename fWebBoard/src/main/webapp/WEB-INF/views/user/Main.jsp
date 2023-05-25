<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>


<% 
	// jsp안에서 session안에 값 확인
	if (session.getAttribute("userName") == null) {
		response.sendRedirect("/user/userLogin.do");
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
  a{text-decoration: none}
</style>
</head>
<body>

<h1>로그인 결과</h1>

<table width="500">
<tr>
<th>
<!-- sessionTime과 userName는 세션 속성에 저장된 값 :  sessionScope 접근 없이도 가능  -->
 [ ${sessionScope.sessionTime} ] ${userName}님 &nbsp; &nbsp;
</th>
</tr>
<tr>
<th>
 <a href="logOut.do">[로그아웃]</a> &nbsp;&nbsp; <hr/>
 
 <!-- 게시판으로 이동하는 방법 2가지
 	1. 링크를 눌러서 (요청)으로 인한 이동 (jsp > controller(board) > jsp)
 	2. 컨트롤러로 이동해서 다시 이동하는 방법 (jsp > controller(member) > controller(board) > jsp)
  -->
 
 <!-- 1번 방법 : 정확한 요청문을 작성해야한다 
 			controller ( board ) 에 정의해야한다
 -->
 <!-- 직접 접근 -->
 <a href="../board/getBoardList.do">[게시판 목록 -> 바로 boardcontroller로 접근]</a> <hr/>
 
 <!-- 2번 방법 : controller에 정의해야한다 -->
<!-- User컨트롤러를 통해 Board 컨트롤러 접근 -->
 <a href="moveBoardList.do">[게시판 목록 -> membercontroller 갔다가 boardcontroller로간다]</a>
 
 
 

</th>
</tr>
</table>


<c:if test="${list!=null}">
  <h2>[ 회원정보 ]</h2>
   <table>
    <tr>
       <th>UserNo</th>
       <th>UserId</th>
       <th>UserName</th>
       <th>UserPass</th>
     </tr>
   <c:forEach items="${list}" var="vo">
     <tr>
       <td>${vo.userNo}</td>
       <td>${vo.userId}</td>
       <td>${vo.userName}</td>
       <td>${vo.userPass}</td>
     </tr>
   </c:forEach>
   </table>
   <p/>
   <form action="userSearch.do" method="post">
   <select name="keyField">
      <option value="0">--선택--</option>
      <option value="userName">이름</option>
      <option value="userId">아이디</option>
   </select>
   <input type="text" name="keyWord"/>
   <input type="submit" value="검색"/>
   </form>
</c:if>


</body>
</html>







