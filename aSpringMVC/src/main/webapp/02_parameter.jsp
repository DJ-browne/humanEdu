<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.atag {
	color: pink;
	text-decoration: none;
}

.atag:active {
	
}

.atag:hover {
	color: purple;
	text-decoration: none;
}
</style>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 style="color: orange;">@Controller Practice</h1>

	<a class="atag" href="02_param">리턴생략</a><br><br>
	<a class="atag" style="color: aqua;" href="param.do?id=hong">1 parameter requested</a><br><br>
	<a class="atag"  href="param.do?id=hong&age=20">2 parameters requested</a><br><br>

</body>
</html>