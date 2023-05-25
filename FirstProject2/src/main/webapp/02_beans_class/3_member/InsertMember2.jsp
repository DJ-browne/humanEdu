<%@page import="member.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 액션태그로 만드는 방법  --%>
<!-- 자동 완성 기능을 이용 : input 태그의 속성 name 이름 == 클래스의 변수명이 동일 / 다르거나 클래스변수에 없으면 사라짐 -->
<!-- Member mm = new Member(); -->
<jsp:useBean id="mm" class="member.beans.Member">
	<jsp:setProperty name="mm" property="*"/>
</jsp:useBean>

<%
	// DB 접근하기위한 5단계
	MemberDao dao = MemberDao.getInstance();
	dao.insertMember(mm);
	
	// 총정리 : MemberForm 에서 넘겨준 데이터를 자바의 변수로 저장 ( mm ) *액션태그 bean
	//        저장된 변수(mm)를 MemberDao.insertMember 메소드를 통해서 저장할 데이터를 전달 ( 파라미터, 인자 )

	// 이후에 할 작업 : insertMember 메소드에서 DB에 연결작업 해야합니다.
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 회원가입 확인  </title>
</head>
<body>
	아이디 : <%=mm.getId() %><br>
	패스워드 : <%=mm.getPassword() %><br> 
	이름 : <%=mm.getName() %><br>
	전화 : <%=mm.getTel() %><br>
	주소 : <%=mm.getAddr() %><br>
</body>
</html>