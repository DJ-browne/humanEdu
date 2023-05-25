<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="./js/jquery.red.js"></script>
<script type="text/javascript">
$(function () {
	$('#red').click( function () { // id red (버튼)이 클릭이 되면 함수 이벤트 발생
		
		$('#result').red(); // id result 객체가 외부에서온 red라는 함수를 가져와서 씀
	});
});
	
</script>
</head>
<body>
	<button id="red"> 빨강 </button>
	<div id="result"> 나는 빨강을 좋아해 </div>
</body>
</html>