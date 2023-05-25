<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.*,board.service.*" %>

<%
	// 0. 넘겨받는 한글 깨지지 않도록 지정
	
	String writerName = request.getParameter("writerName");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String password = request.getParameter("password");
	
	BoardRec rec2 = new BoardRec();
	rec2.setWriterName(writerName);
	rec2.setTitle(title);
	rec2.setContent(content);
	rec2.setPassword(password);
	
// 	메소드호출할떄 함수명( 인자4개)  >> 함수명 ( 인자 1개 ) 가 좋으니까 
//  4개의 값을 한묶음으로 가진 포장지를 생성 > 클래스 생성, VO ( value object )
%>

<!--  1. 전 화면 입력값을 넘겨받아 BoardRec 클래스의 각 멤버필드에 지정 -->
<!--  클래스명 변수 = new 클래스명(); -->
<jsp:useBean id="rec" class="board.model.BoardRec">
	<jsp:setProperty name="rec" property="*" />
</jsp:useBean>
<!--  jsp:useBean 특징 : input 태그의 name 속성값과 담으려는 VO의 변수명이 같아야합니다.
					  : 같을 경우에만 넣어주고, 아닌 대상들은 그냥 무시(null,0)
 -->
<%
	// 2. Service클래스에 write() 함수호출  후 리턴 된 데이터에는 글 ID가 잇어야합니다.
	
	// DB 접근하기 위한 코드 5줄 >> DAO 라는 자바파일 / DB에 접근하는 기능을 모두 맡김
	// DAO 직접 접근하여 코드를 작성하여도 됩니다.
	// Service 라는 영역을 만든 이유 : 
	// DB접근하기전 값을 변경하거나 또다른 값을 생성하거나 할때 사용하는 영역
	
	// DAO : 순수하게 DB만 접속하는 내용(SQL생성, 결과 return )
	// Service : 그외 영역, java 로직이 담긴 영역, DAO클래스 메소드를 다회 접속(재활용성 증가)
	// JSP : 순수하게 HTML 코드외 최소한의 자바코드를 작성하도록 하는 것이 베스트
	
	// JSP(view) >> Service.java >> DAO.java >> DB(database)
	//  입력받을값 및 서비스 호출 >> 값을 이용하여 로직추가, 없으면 전달(파라미터,인자) >> 값을 이용하여 DB 접근(CRUD,DML) >> DB 입력완료, 조회완료
	
	// 역순으로도 되돌아와야합니다.
	// DB(database) >> DAO.java >> Service.java >> JSP(view)
	// 결과 생성 >> 받은 결과를 필요에 의해 전달(return) >> 받은 결과를 필요에 의해 전달(return) >> 받은 결과를 필요에 의해 화면에 구성
	
	
	rec = WriteArticleService.getInstance().write(rec);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판글저장</title>
</head>
<body>
입력되었는지 확인해보시구염...<br/>
만일 안되어도..환장하지 맙시다 !!! ^^<br/><br/>
<!-- 작성글보기 : 내가 쓴글을 보겟다. -->
<a href="BoardView.jsp?id=<%=rec.getArticleId() %>" >작성글보기</a>
</body>
</html>
