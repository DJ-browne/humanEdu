<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="user.model.*,user.service.*" %>
    <%@ page import="java.util.List"%>
  <%
  	String userid = request.getParameter("userid");
    String password = request.getParameter("password");
    
  //   List<UserVO> uList = UserDao.getInstance().selectList();
    boolean check = AdminDao.getInstance().check(userid, password);
  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 로그인 확인</title>
</head>
<body>
<% 


if (check == true) {
// 	String id = (String) session.getAttribute("userid");
	session.setAttribute("id", userid);
	response.sendRedirect("main.jsp");
} else {
	response.sendRedirect("login.jsp");
	
}
	
%>
</body>
</html>