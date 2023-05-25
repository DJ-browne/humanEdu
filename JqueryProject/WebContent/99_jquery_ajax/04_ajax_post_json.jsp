<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_ajax_post_json.jsp</title>
<script type="text/javascript"  src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script type="text/javascript">
	function con(){
		// 넘겨줄 데이터
		var param = { cate : "book" , name : "shin" }
	
		// AJAX 실행, 요청 (02_server.jsp), 요청시 데이터 (param)
		// 요청과 응답이 성공하면 parseData()함수를 실행
		// dataType : 응답하는 데이터의 종류를 정의 >> 함수내의 있는 파라미터의 데이터 종류를 결정
		$.post("04_server.jsp", param, parseData,"text");
		
		
		alert('전송');
	}
	
	// 연결이 성공되면 실행되는 함수 
	// 응답을 처리할 함수 
	// 함수내의 파라미터 : resData : 04_server.jsp에서부터 전달받아온 값
	// 응답데이타 종류 (xml/html/script/json/jsonp/text)
	function parseData(resData) {

		alert(resData);
		console.log(resData);
		// 지금은 변환 라이브러리를 구현하지 않았기때문에 일단은 완성하는 기준으로 작성한 코드
		
		var obj = {};	
    	obj = eval("(" + resData + ")"); 
		$('#cate').val ( obj.first );
		$('#name').val ( obj.second );
		
	}


</script>
</head>
<body>

서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
<button onclick="con()" >전송</button>

</body>
</html>