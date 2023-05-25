<%@ page import="java.util.Arrays"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String[] pet = request.getParameterValues("pet");
%>
<!DOCTYPE html>
<html>
<head><title>요청 파라미터 출력</title></head>
<body>
<h5> 방법 1 </h5>

이름 = <%= name  %><br>
주소 = <%= request.getParameter("address") %><br>
선택한동물 = <%= Arrays.toString(pet) %>

<hr>

선택한동물 = <%
	if(pet != null){
		for ( String p : pet){
			out.print(p+ " ");
		}
	}
%>

</body>
</html>
