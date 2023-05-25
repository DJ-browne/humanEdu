<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="user.model.*,user.service.*" %>
    <%@ page import="java.util.List"%>
  <%
  	String userid = request.getParameter("userid");
      String password = request.getParameter("password");
      String username = request.getParameter("username");
      String usergenderF = request.getParameter("userF");
      String usergenderM = request.getParameter("userM");
      String usergenderN = request.getParameter("userN");
      
      AdminVO vo = new AdminVO();
      vo.setUserid(userid);
      vo.setPassword(password);
      vo.setUsername(username);
      
      if (usergenderF != null) {
    	  vo.setUsergender(usergenderF);
      } else if (usergenderM != null) {
    	  vo.setUsergender(usergenderM);
      } else {
    	  vo.setUsergender(usergenderN);
      }
    	  
      
      int insert = AdminDao.getInstance().insert(vo);
  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 가입 확인</title>
</head>
<body>
<% 

if (insert > 0) {
	response.sendRedirect("main.jsp");
} else {
	response.sendRedirect("join.jsp");
}

	
%>
</body>
</html>