<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.service.*, board.model.*" %>
<%
	// 화면(JSP)과 화면(JSP) 사이에 값을 주고 받을거면 
	// request / session / application 객체를 활용
	// request : 주소 뒤 ( ? 뒤 ) 부터 나오는 키 = 값 에서의 키와 request.getParameter(키) 가 같아야합니다.
	// request : 페이지가 한번 이동하면 매번 갱신되는 값
	
	// session, application : setAttribute("키","값")  : 한번 설정하면 브라우저 꺼질때까지 값이 유효
	
	
	// 1. 해당 게시물의 게시글번호값을 얻어온다
	String article_id = request.getParameter("id"); 
	// 2. Service에 getArticleById() 호출하여 그 게시글번호를 갖는 레코드를 검색한다.
	BoardRec rec = ViewArticleService.getInstance().getArticleById(article_id);
	
	// rec 담겨있는 비밀번호 >> 정답 / 지우려고 시도하는 사용자가 입력한 비밀번호가 아닙니다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 게시글 보기 </title>
</head>
<body>

	<h4> 게시판 글 보기 </h4><br/>
	<table border="1" bordercolor="red">
	<tr>
		<td> 제  목 : </td>
		<td><%= rec.getTitle() %></td>
	</tr>
	<tr>
		<td> 작성자 : </td>
		<td><%= rec.getWriterName() %></td>
	</tr>
	<tr>
		<td> 작성일자 : </td>
		<td><%= rec.getPostingDate() %></td>
	</tr>
	<tr>
		<td> 내  용 : </td>
		<td><%= rec.getContent() %></td>
	</tr>
	<tr>
		<td> 조회수 : </td>
		<td><%= rec.getReadCount() %> </td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="BoardList.jsp" >목록보기</a>
			<a href="BoardReplyForm.jsp?parentId=<%= article_id %>">답변하기</a>
			<a href="BoardModifyForm.jsp?id=<%= article_id %>" >수정하기</a>
			<!-- 1. 수정 : 내용을 다 보여줄꺼야 
				 BoardModifyForm.jsp 은 수정할 대상의 번호를 알고있어야합니다.
				 BoardModifyForm.jsp 는 글 내용을 다 출력된 상태로 사용자에게 보여줘야합니다.
				 BoardModifyForm.jsp 의 HTML코드가 실행되기전에 DB를 다녀와야합니다.
				 
				 ---------------------------------------------- 	
				 BoardModifyForm.jsp 수정을 하고 수정하기 버튼을 누르면
				 action에 의해서 BoardModify.jsp 로 이동
				 사용자가 입력한 값을 수정하기전에 비밀번호를 검사해야합니다.
				 UPDATE article SET title=? , content = ? WHERE article_id = ? AND password = ?
				 * BoardDelete.jsp 동일한 기능	 				 
			
			-->
			<a href="BoardDeleteForm.jsp?id=<%= article_id %>" >삭제하기 </a>
		</td>
	</tr>
	</table>


</body>
</html>