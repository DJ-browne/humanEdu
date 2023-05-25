<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	// 1. 이전 화면에서 넘겨받은 데이터
	String cate = request.getParameter("cate");
	String name = request.getParameter("name");
	
	System.out.println("cate : " + cate) ;
	System.out.println("name : " + name) ;
	
	// 2. 다시 화면으로 보낼 데이터 구성
	cate = "서버로부터 " + cate;
	name = "from_server_"+name;
	
	System.out.println("cate : " + cate) ;
	System.out.println("name : " + name) ;
	// 실제로 넘겨줄 데이터 출력
	System.out.println("cate="+ cate+"|name=" + name) ;
	
	// 넘기는 데이터 : out.write();
	out.write("cate="+ cate+"|name=" + name);

	// controller에서 할 작업
%>