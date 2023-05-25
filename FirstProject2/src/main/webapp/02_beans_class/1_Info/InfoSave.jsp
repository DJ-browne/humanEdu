<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ page import="info.beans.InfoBean" %>
<%--
	<jsp:useBean id="bean" class="info.beans.InfoBean"> 의 의미
	>> 자바에서는 InfoBean bean = new InfoBean();
	>> 객체 만든뒤 다음 작업은 객체에 값을 넣어주는 행위 > setter
--%>
<%-- <jsp:useBean id="bean" class="info.beans.InfoBean"> --%>
<%-- 	<jsp:setProperty name="bean" property="name" /> --%>
<%-- 	<jsp:setProperty name="bean" property="id" /> --%>
<%-- </jsp:useBean> --%>

<jsp:useBean id="bean" class="info.beans.InfoBean">
	<jsp:setProperty name="bean" property="*"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<body>
	<h2>  당신의 신상명세서 확인 </h2>
	이   름  : <jsp:getProperty property="name" name="bean"/> <br/>
	주민번호 : <%=bean.getId() %><br/>
	성  별   : <br/>  
	맞습니까????
</body>
</html>