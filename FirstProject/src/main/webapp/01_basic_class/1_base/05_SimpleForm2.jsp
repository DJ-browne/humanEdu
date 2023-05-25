<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // name=ㅁㄴㅇ
    // gender=male
    // occupation=programmer
    // hobby=LOL
    // hobby=멍때리기
    // hobby=그냥있기
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String occupation = request.getParameter("occupation");
	String[] hobby = request.getParameterValues("hobby");
	
	// hobby = null : 체크없는상태
	// hobby = [] : 체크한상태
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 폼의 입력값 처리 </title>
</head>
<body>
	<h2>폼의 입력값 넘겨받아 처리</h2>
	입력한 이름 : <%=name %><br/>
	입력한 성별 : <%=gender %><br/>
	입력한 직업 : <%=occupation %><br/>
<%-- 	입력한 취미 : <%= Arrays.toString(hobby) %> --%>
	<!--  배열일때 데이터를 하나씩 추출하는 방법 : 반복문 -->
	
	<%	
		for (int i = 0 ; i < hobby.length ; i++){
			out.print("입력한 취미"+(i+1)+" : "  + hobby[i]+ " <br/>");
		}
	%>
</body>
</html>