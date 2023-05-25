<%@page import="member.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% 
    // InsertMember.jsp : controller의 역할과 view의 역할 동시에 있는 페이지
    // controller의 역할 : 이전페이지에서 넘겨준 데이터를 변수 저장
    // >> 저장된 변수를 어떻게 할지는 프로그램에 따라 설정 ( DB, 출력, 가공 등등 )
  	request.setCharacterEncoding("utf-8");
    
  %>
<!-- 액션태그를 통해서 데이터를 저장하려고할때 자바클래스의 형태가 필요합니다. -->  
<jsp:useBean id="mem" class="member.beans.Member">
	<jsp:setProperty name="mem" property="*"/>
</jsp:useBean>  
<!-- 현재페이지에서 변수로 저장한 데이터를 데이터베이스까지 저장을 하겠다. -->

<%

	// 싱글톤패턴으로 생성되는 객체를 이용( 드라이버로딩)
	MemberDao dao = MemberDao.getInstance();
	// 데이터베이스에 데이터를 저장하기 위해선 변수 저장된 값(mem)을 인자로 전달
	dao.insertMember(mem);


%>



  <!-- view의 역할 -->  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	   아이디 : ${mem.id} <br/>
	   패스워드 : ${mem.password}<br/>
	   이름 : ${mem.name}<br/>
	   전화 : ${mem.tel}<br/>
	   주소 : ${mem.addr}<br/>

</body>
</html>