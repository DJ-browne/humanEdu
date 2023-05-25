<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>99_idForm.jsp</title>
<style type="text/css">

.userinput {
border: 1px solid olive;
 }
.userinput:focus {
border-color:#0982f0;
 outline: none;
 }
button {
border: 1px solid olive;
background: orange;
color: teal;
}

button:hover {
border: 1px solid olive;
background: yellow;
color: teal;
}

button:active {
border: 1px solid olive;
background: teal;
color: maroon;
}

div {
border: 1px solid olive;
}
</style>
<script type="text/javascript"  src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script type="text/javascript">

/*
	web의 환경 : 서버(회사)와 클라이언트(사용자)
			
			클라이언트 -> 서버
		                    요청 보냄
		        	<-
		       	요청에 대한 응답
	
	요청 : 어떤 페이지를 보여줘, 버튼을 누른다, 웹브라우저에서 내가 할 행동/시점, 주소를 친다, 마우스 클릭, 키보드 엔터
	응답 : 요청에 대한 응답, 요청이 있으면 그에 대한 대답, 구현할 기능, 구현할 상황
 	
	1회 요청에 대한 1회 응답이라는것 기본 조건
	응답전까지는 다른 행동 불가능 > 고장난페이지를 검색하면 로딩이 되는 동안 다른 페이지를 볼수 있나? ㄴㄴ없다
	> 웹 페이지는 "요청"을 하면 항상 "응답"을 해야한다
	> 응답 >> 요청 페이지 내용을 로딩하는 행동
	> 로딩 >> 페이지를 구성하는 행동, 이전 작업들을 프로그래밍하지 않는 이상 단순한 파일 열기
	> 요청으로 인한 페이지의 초기화 발생 : 동기식 연결이기 때문
	> 비동기를 하여 요청을 해도 로딩을 하는것이 아니라 데이터만 받겠다 
	// 웹페이지를 전체적으로 로딩하는것이 아니라 일부분만 갱신하도록 하는 기술
	
	* AJAX
		
 */

$(function () {
	$('#id_check').click(function() { // id가 id_check가 클릭이되면 함수가 시작한다
		// id가 실제 database에 있는지 확인
		// id : 사용자가 입력한 값, 화면
		// 화면상에서 사용자가 입력한 값을 가지고 DB에 가서 select문을 통해 결과를 화면에 공유
// 		let id = $('.userinput').val(); // class가 userinput인 곳의 value(값)
		let id = $('input[name=id]').val(); // input태그 안의 name이 id인 곳의 value(값)
		
		// $.get / $.post : ajax의 문법, 축약형
		// $.get( 요청할주소, 파라미터, 요청성공시 응답할 함수, 응답 받아온 데이터형식 )
		// $.get(.jsp, { 키 : 값 }, function?(){}, "xml,json,text")
		// $.post 도 동일
		
		// 기본형
		// $.ajax( { 옵션명 : 값, 옵션명 : 값 ... } )
		
		$.ajax({
			
			// 요청할 부분에 대한 정의 ------------------------------
			url: '99_idCheck.jsp',    // 주소 : URL
			type: 'get',              // post : method방식
			data : { 'userid' :id},   // 파라미터 (위에서 가져온 let id 변수값을 userid로 넘겨줌)
			// 응답에 대한 정의 -----------------------------------
			dataType: 'text',      // 응답할때 text로 가져오겠다(응답받을데이터형식)
			success: function(data) {  // 성공시 실행할 함수, data : 응답받은 데이터
				alert(data) // YES or NO
			
				// 서버에 접속이 성공하여 처리가 다 완료되었을떄 상황 
	            // cont >> DB >> cont >> view 까지 정상적으로 왓을때
	               if( data.trim() == 'YES') {
	                  $('#idmessage').text("이미 사용중인 아이디입니다.");
	                  $('#idmessage').show();
	               }else{
	                  $('#idmessage').text("사용가능한 아이디입니다.");
	                  $('#idmessage').show();
	               }
			},
			error: function(err) {    // 실패시 실행할 함수, err : 에러에 대한 객체
				alert('에러발생'+err)
				
			}
						
			
		})
	})
})


</script>

</head>
<body>

<input name="id" type="text" class="userinput" size="15" />
<button type="button" id="id_check">중복체크</button><br/><br/>
<div id="idmessage" style="display:none;"></div>

</body>
</html>