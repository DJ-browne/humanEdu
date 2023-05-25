<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_ajax_get_csv.jsp</title>
<script type="text/javascript"  src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script type="text/javascript">

	$(function(){
		
		// ajax : 비동기 데이터 통신 : javascript & xml(JSON으로 대체)
		// 웹페이지를 전체적으로 로딩하지않고 일부분만 갱신하도록 하는 기술(백그라운드에서작용)
		
	});
	
	function con(){
		
		// 넘겨줄 데이터
		var param = { cate : "book" , name : "kim" }
		
		// AJAX 실행, 요청 (01_server.jsp), 요청시 데이터 (param)
		// 요청과 응답이 성공하면 parseData()함수를 실행
		$.post("01_server.jsp", param, parseData );
		
		alert('전송');
	}
	
	// 연결이 성공되면 실행되는 함수 
	// 응답을 처리할 함수 
	// 함수내의 파라미터 : strText : 01_server.jsp에서부터 전달받아온 값
	function parseData(strText) {
		alert('성공');
// 		alert(strText);
		// cate=서버로부터 book|name=from_server_kim
		var aryData = strText.split("|");
		
		for(var i=0;i<aryData.length;i++){
			var keyValue  = aryData[i].split("=");				
			if( keyValue[0].trim() == 'cate'){			// jQuery.trim( keyValue[0]) 라고 해도
				$('#cate').val(keyValue[1]);
			}
			
			if( keyValue[0].trim() == 'name'){
				$('#name').val(keyValue[1]);
			}	 	
		}
		
	}



</script>
<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
<button onclick="con()" >전송</button>
</body>
</html>