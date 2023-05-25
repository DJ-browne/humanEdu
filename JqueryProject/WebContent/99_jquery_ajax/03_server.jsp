<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	// 1. 이전 화면에서 넘겨받은 데이터
	String cate = request.getParameter("cate");
	String name = request.getParameter("name");
	
	// 2. 다시 화면으로 보낼 데이터 구성
	// XML : 문서의 구조, 구조를 표현할때 <> 를 사용
	String result ="";
	
	result += "<data>";
	result += "<first>"+ "서버에서"+cate+"변경2" +"</first>";
	result += "<second>"+ "from_"+name+"_server2" +"</second>";
	result += "</data>";
	
	out.write(result);
%>