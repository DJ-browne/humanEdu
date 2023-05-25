<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
	// ?userId=123
	String id = request.getParameter("userId");
	
	System.out.println(">>> " + id);
	
	//데이터베이스 5단계 진행..
	
	// 1. 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	// 2. 연결객체 얻어오기(url, id, pwd)
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","seung","1234");
	
	// 3. sql 문장 만들기
	String sql = "SELECT * FROM memberTest WHERE id = ?";
	
	// 4. 전송 객체 얻어오기
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, id);
	
	// 5. 전송
	ResultSet rs = ps.executeQuery();
	
	// 데이터가 조회가 되었느냐 안되었느냐, 있냐 없냐, 1개냐 0개냐...
	boolean flag = false;
	
	while(rs.next()){
		flag = true;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 아이디 중복 확인 </title>
</head>
<body>
<%
	if(  flag ) {
%>
		사용중인 아이디가 있습니다. 다시 입력하여 주십시오.
<%  }else { %>
		사용할 수 있는 아이디입니다.
<%  } %>
</body>
</html>