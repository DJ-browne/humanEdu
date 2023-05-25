<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>

h1{
color: orange;
}

a {
color: lime;

}

a:hover {
	color: olive;
}

a:active {
	color: orange;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<h1>게시판 프로그램</h1>
	<hr>
	<br>
	<a href="getBoardList.do"> 글 목록 바로가기</a>


	<br>
	<a href="test.do"> 테스트</a>
	<!-- 현재페이지가 실행이 되지않으면 서버실행시 오류가 난 상황 : 보통 설정 파일(*.xml)을 검사, 콘솔확인*
		현재 페이지는 잘 출력되나 그 이외에 오류 난 상황 : 보통 java파일을 검사, 콘솔확인*, 변수, 파라미터, 인자 등
		오류코드가 ORA-00000 : 오라클오류, Mapper, DAO, 변수값 null 체크 등..
	 -->
	
</body>
</html>