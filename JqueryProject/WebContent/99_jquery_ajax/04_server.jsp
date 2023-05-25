<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	// 1. 이전 화면에서 넘겨받은 데이터
	String cate = request.getParameter("cate");
	String name = request.getParameter("name");
	
	// 2. 다시 화면으로 보낼 데이터 구성
	// JSON의 형태 :  { 키:값, 키:값... }
	String result ="";
	
	result += "{";
	result += "'first' : "+ "'changed_"+cate+"_by_server" +"',";
	result += "'second' : "+ "'from_"+name+"_server'";
	result += "}";
	System.out.println(result);
	
	out.write(result);	
%>