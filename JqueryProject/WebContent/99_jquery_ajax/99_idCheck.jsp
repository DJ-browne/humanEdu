<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>

<%
// 1. 이전 화면에서 넘겨받은 데이터, Spring Controller가 할 작업
String userid = request.getParameter("userid"); // userid로 넘겨준 값을 받아서 userid에 넣음

// 1-1. DB와 연결, Spring에서 DAO, mybatis가 할작업
String driver = "oracle.jdbc.driver.OracleDriver";
String user = "firefist";
String pass = "1234";
String dbURL = "jdbc:oracle:thin:@localhost:1521:orcl";

Class.forName(driver);
Connection connection = DriverManager.getConnection(dbURL, user, pass);

String sql = "select * from ajax_temp where name='" + request.getParameter("userid") + "'";
System.out.println(sql);
Statement stmt = connection.createStatement();
ResultSet rs = stmt.executeQuery(sql);

//2. 다시 화면으로 보낼 데이터 구성
String result="NO";
   if (rs.next()){      
      result = "YES";
   }      
   out.print(result);

%>