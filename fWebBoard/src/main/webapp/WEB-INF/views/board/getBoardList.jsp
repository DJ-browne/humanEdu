<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
</head>
<body>
   <h1>게시글 목록</h1>
   
   <h3>${userName } 님 안녕하세요</h3><br>
      
   <table border="1">
         <tr>
            <th bgcolor="orange" width="100">번호</th>
            <th bgcolor="orange" width="200">제목</th>
            <th bgcolor="orange" width="150">작성자</th>
            <th bgcolor="orange" width="150">등록일</th>
            <th bgcolor="orange" width="100">조회수</th>
            <!-- 추가 -->
            <th bgcolor="orange" width="150">파일이름</th>
            <th bgcolor="orange" width="100">파일용량</th>            
         </tr>
         <c:forEach items="${boardList }" var="board">
            <!-- property 이름 변경 -->
            <tr>
               <td>${board.b_id }</td>
               <td align="left"><a href="getBoard.do?b_id=${board.b_id }">
                     ${board.b_title }</a></td>
               <td>${board.b_name }</td>
               <td>${board.b_date }</td>
               <td>${board.b_count }</td>
               <!-- 추가 -->
               <td>
                <c:choose>
                   <c:when test="${board.b_fsize==0}">첨부파일 없음</c:when>
                   <c:otherwise>
                      <a href='resources/upload/${board.b_fname}'>
                         <img src="resources/images/disk.gif">${board.b_fname}
                      </a> 
                   </c:otherwise>
                </c:choose>                 
               </td>               
               <td>${board.b_fsize}byte</td>
            </tr>
         </c:forEach>
      </table>
      <br> <a href="insertBoard.do">새글 등록</a>
</body>
</html>