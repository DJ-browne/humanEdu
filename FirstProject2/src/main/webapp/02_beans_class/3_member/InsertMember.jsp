<%@page import="java.sql.*"%>
<%@page import="member.beans.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 하나씩 천천히 도전합시다 -->
<!--  
	1. form 태그의 데이터를 가져와서 > bean > VO (Member)
	2. 단순출력
	--------------
	3. DB 연결 
	 * 데이터를 담은 테이블 만들어놔야 합니다.
	 - 5가지 과정	

 -->
<%-- <%
	// 이전페이지에서 넘겨받은 데이터를 자바의 변수로 변환하는 과정
	// ?id=1&password=2&repassword=3&name=4&tel=5&addr=6
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	// repassword 같은 데이터이기때문에 굳이 필요없는 데이터
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String addr = request.getParameter("addr");
	
	// 변수 5개를 데이터베이스에 넘겨서 저장을 해야합니다.
	// 전달 과정을 할때 하나의 파일로 넘기는 것이 좀 더 편리하기떄문에
	// 하나의 클래스를 생성 > VO, bean
	// 클래스를 사용하는 이유 : 배열( 동일한 자료형, 인덱스로 선택 하는 단점 )
	// 정확한 구분을 위해서 다양한 자료형을 위해서 클래스로 포장
	// VO, bean : 데이터를 담기위한 클래스, 변수만 존재하는 클래스 > DB에 저장하려고
	
	Member m = new Member();
	m.setId(id);
	m.setPassword(password);
	m.setName(name);
	m.setTel(tel);
	m.setAddr(addr);
	
	// 데이터베이스 5단계 진행..
	
 %>  --%>
 
<%-- 액션태그로 만드는 방법  --%>
<!-- 자동 완성 기능을 이용 : input 태그의 속성 name 이름 == 클래스의 변수명이 동일 / 다르거나 클래스변수에 없으면 사라짐 -->
<!-- Member mm = new Member(); -->
<jsp:useBean id="mm" class="member.beans.Member">
	<jsp:setProperty name="mm" property="*"/>
</jsp:useBean>
<%
	//데이터베이스 5단계 진행..
	
	// 1. 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");

	// 2. 연결객체 얻어오기(url, id, pwd)
	// jdbc:oracle:thin:@localhost:1521:orcl
	// jdbc:oracle:thin:@ip:포트:서비스이름
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","seung","1234");
	// 3. sql 문장 만들기
// 	String sql = "select * from emp";
	String sql = "INSERT INTO memberTest(id, password, name, tel, addr ) "
		+ "     VALUES ( ?, ?, ?, ?, ? )";
	
	// 구구단 >> 변수 + " x " + 변수 + " = " + 변수*변수 >> 2 x 3 = 6
	
	// 4. 전송 객체 얻어오기
	// Statement : sql문장을 완벽한 문자열의 형태로 구성해줘야합니다.
	// sql = 
	// "select * from emp where empno = " + 변수명 + " and ename =" + 변수명 "
	// PreparedStatement : sql문장을 동적으로 배치가능합니다 동적배치시 사용하는 키워드 : ?
	// sql = 
	// "select * from emp where empno = ? and ename = ?"
	// ? 에 어떠한 값을 넣겟다 라는 의미로 set자료형(인덱스번호, 넣을값);
	PreparedStatement ps = conn.prepareStatement(sql);
	// 첫번째 ? 에 넣을 값
	ps.setString(1, mm.getId() );
	ps.setString(2, mm.getPassword() );
	ps.setString(3, mm.getName() );
	ps.setString(4, mm.getTel() );
	ps.setString(5, mm.getAddr() );
	
	// 5. 전송
// 	ResultSet rs = ps.executeQuery();
	ps.executeUpdate();
	
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