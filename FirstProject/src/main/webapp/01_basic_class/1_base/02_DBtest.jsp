<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<% 
	// JAVA 라는 언어 (이클립스, 스트링) < ==번역== > 오라클
	// JDBC : 오라클을 외부에서 사용하기위해 만든 인터페이스API(소프트웨어드라이버)
	// 파일명 : ojdbc버전.jar
	
	// JDBC가 필요한 프로그램 > JDBC 인터페이스를 호출 > JDBC 드라이버 활성 > DB 접속
	// ojdbc버전 : 오라클 설치버전에 맞춰서 사용 > 11g(6) / 19c(8, 10)


%>
<%
	
	// 1. 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");

	// 2. 연결객체 얻어오기(url, id, pwd)
	// jdbc:oracle:thin:@localhost:1521:orcl
	// jdbc:oracle:thin:@ip:포트:서비스이름
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","seung","1234");
	// 3. sql 문장 만들기
	String sql = "select * from emp";
	
	// 4. 전송 객체 얻어오기
	PreparedStatement ps = conn.prepareStatement(sql);
	
	// 5. 전송
	ResultSet rs = ps.executeQuery();
%>


<%
	// 1. 드라이버 로딩
	// Class.forName("oracle.jdbc.driver.OracleDriver");
	// Class.forName() : 드라어비를 찾는 명령어
	// 오라클DB 를 사용하기 위한 드라이버를 호출 : 필수조건
	
	// OracleDriver 를 이용하여 DriverManager 생성한것
	// DriverManager를 통해서 db 와 연결 설정 * url, id, pwd
	// url : 접속주소
	// id : 계정
	// pwd : 비밀번호
	// 연결을 시도한 상태를 Connection 를 통해서 객체화
	// Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","seung","1234");
	
	// 연결 객체에게 명령 > "쿼리"를 통한 명령 > 쿼리가 필요함
	// 쿼리 > 단순 문자열이기때문에 String 생성
	// 3. String sql = "select * from emp";
	// 3. String sql = "insert into emp(empno) values ( 1234 )";
	
	// 우리가 만든 쿼리문과 연결정보를 가진 객체를 이용해서 쿼리문을 전달
	// PreparedStatement ps = conn.prepareStatement(sql);
	
	// 연결객체와 우리가 작성한 쿼리문들 합쳐주는 구조화 > Statement > DBMS 전달된 데이터
	// PreparedStatement : 
	// 반복된 코드를 실행할때 한번만 처음부터 실행하고 그 후는 캐시(흔적) 바로바로 실행하는 객체
	// Statement :
	// 반복된 코드를 실행할때 항상 처음부터 실행하고 다시 만드는 객체
	
	// 5. ps.executeQuery(); 
	// ps 에 담긴 연결정보와 sql 문장을 실행 메소드 >> 결과 >> 리턴된다 >> 저장
	// 저장하는 배열 >> ResultSet

%>

<!DOCTYPE html>
<html><head><title> 디비 테스트 </title>
</head>
<body>
 
<div align=center>
<table border=2 cellSpacing=3>

  <tr class="title">
    <td>사번</td>
    <td>사원명</td>
    <td>업무</td>
    <td>관리자사번</td>
    <td>입사일</td></tr>
	
	<% while ( rs.next() ) { %>
	  <tr>
		<td><%= rs.getString(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(3) %></td>
		<td><%= rs.getString(4) %></td>
		<td><%= rs.getString(5) %></td>
	  </tr>
	<%  } // While-End %>

</table>
</div>
</body>
</html>
