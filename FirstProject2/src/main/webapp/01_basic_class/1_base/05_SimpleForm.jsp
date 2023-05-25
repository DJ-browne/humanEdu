<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 폼과 서블릿 </title></head>

<body>
	<form method="get" action="05_SimpleForm2.jsp">
		<h4>  입력 후 전송 버튼을 누릅니다 </h4>

		이름	: <input type="text" name="name"><br/>

		성별    : <input type="radio" name="gender" value="male" checked="checked"> 남
 			   <input type="radio" name="gender" value="female"> 여 <br/>


		직업	: <select name="occupation">
						<option> programmer
						<option> web designer
						<option> white hand
						<option> people
			</select><br/>

		취미    :	 <input type="checkbox" name="hobby" value="LOL"> LOL
					 <input type="checkbox" name="hobby" value="행컵먹기"> 행컵먹기
					 <input type="checkbox" name="hobby" value="멍때리기"> 멍때리기
					 <input type="checkbox" name="hobby" value="그냥있기"> 그냥있기 <br/> <br/>

		
		<input type="submit" value='전송'>
		<input type="reset" value='취소'>
	</form>
</body>
</html>