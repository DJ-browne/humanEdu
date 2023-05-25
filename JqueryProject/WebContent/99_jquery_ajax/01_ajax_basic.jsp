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
		
		// AJAX : 좀더 빠른 웹페이지 구동을 위한 기술
		// 웹페이지는 "요청"을 하면 항상 모든 페이지 내용을 다시 로딩을 하면서 "응답"을 해야합니다.
		// 로딩을 할때 백그라운드영역(서버)과 통신을 하여 그 결과를 페이지 전달
		
		// 자판기 페이지 요구사항 : 사용자페이지 + 관리자페이지
		// 페이지가 한개일 경우 
		// - 사용자페이지영역와 관리자페이지 영역이 공존
		//   관리자에서 메뉴를 추가하면 사용자영역으로 표시만 하면됩니다.
		//   현재 하나의 JS파일에서 관리자영역 태그와 사용자 영역 태그를 컨트롤할 수 잇습니다.
		
		// 페이지가 두개일 경우 
		// - 사용자페이지영역와 관리자페이지 영역이 분리
		//   사용자페이지에서 관리자페이지를 보고싶으면 location을 변경, A태그로 사용
		//   두 페이지 파일을 연결하기 위한 작업이 필요
		//   JAVA&DB / sessionStorage : 서버라는 존재 필요합니다. 가운데 매개체가 필요
		// 서버에게 관리자페이지가보고싶은데.. > 서버가 관리자페이지 출력
		// 서버에게 사용자페이지가보고싶은데.. > 서버가 사용자페이지 출력
		// >> 관리자페이지를 보여줄떄 어떻게 해달라. >> JAVA&DB / sessionStorage
		
		// 웹페이지는 "요청"을 하면 항상 모든 페이지 내용을 다시 로딩을 하면서 "응답"을 해야합니다.
		// 요청을 하고 응답을 받을떄 항상 화면을 동기화 해야합니다. : 응답에 맞춰서 화면을 새로 구성
		
		// "매번" 새로 구성을 할수만 있다면 문제없어요.
		// 설문조사처럼 입력한 데이터의 양이 많다면 새로 구성을할때 항상 채워줘야합니다. 
		
		// 웹페이지를 전체를 다시 로딩하지 않고, 웹페이지의 일부분만 갱신할수있도록 만드는 기술 : 비동기식 자바스크립트
		// 자바스크립와 XML를 이용하여 서버와 비동기식 통신을 한다. 
		// 비동기식 : 일부분만 갱신할수있도록 만드는 기술
		// AJAX : Asynchronous Javascript And XML
		// XML : 전달할 데이터의 모양, <>태그의 형태 >> 너무 무겁고 구현하기 어려워서 JSON 으로 변경
		
		// JSON : 자바스크립트의 객체 표기법, javascript object notation
		var obj =  { }; // 키-값 의 쌍으로 데이터를 구성 / 배열과 다른점. 모든언어에서 구현하고잇는 모양( MAP, dict.. )
						// 값 : 데이터의 형태가 무관, { } 도 가능, function(){ } 도 가능
		
		
	});
	



</script>
<style type="text/css">
div { 
	width: 500px;
	height: 200px;
	border: 1px solid red;
}
</style>
</head>
<body>
<div id="user">
	사용자영역
	<form action="#">
		<input type="text">
		<input type="text">
		<button>요청</button>
	</form>

</div>
<div id="admin">
	관리자영역
</div>
</body>
</html>