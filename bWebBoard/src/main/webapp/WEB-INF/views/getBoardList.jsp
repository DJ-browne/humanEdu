<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getBoardList</title>
</head>
<body>
getBoardList 페이지
<h1>게시글 목록</h1>
      <!-- 로그인 후  -->
      <!-- 
      <h3>${userName }님! 게시판에 오신걸 환영합니다.
      <a href="logout.do">Log-out</a> 
      </h3>
       -->
      <!-- 검색 시작 -->
      <form action="getBoardList.do" method="post">
         <!-- 밑에 두 name에 정보가 위에 action 으로 감 -->
         <!--  -->
               <select name="searchCondition"> <!-- name이 전달됨 여기에 들어있는 value값이 넘어감 -->
                  <option value='title'>제목</option>
                  <option value='content'>내용</option>
                  <option value='writer'>작성자</option>                                    
               </select> 
               <input name="searchKeyword" type="text" /> <!-- name 중요함 -->
               <input type="submit" value="검색"/>
               
      </form>
      <!-- 검색 종료 -->
      
   <table border="1">
         <tr>
            <th bgcolor="orange" width="100">번호</th>
            <th bgcolor="orange" width="200">제목</th>
            <th bgcolor="orange" width="150">작성자</th>
            <th bgcolor="orange" width="150">등록일</th>
            <th bgcolor="orange" width="100">조회수</th>
         </tr>
         <!-- JSTL : 자바 서버 페이지 표준 태그 라이브러리 
            view페이지에 for if문등을 제공해주는 라이브러리
         -->
         <c:forEach items="${boardList }" var="board">
            <tr>
               <td>${board.seq }</td>
               <td align="left"><a href="getBoard.do?seq=${board.seq }">
                     ${board.title }</a></td>
               <td>${board.writer }</td>
               <td><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
               <td>${board.cnt }</td>
            </tr>
         </c:forEach>
      </table>
      <br> <a href="insertBoard.do">새글 등록</a>
</body>
</html>