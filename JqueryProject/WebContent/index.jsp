<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 직접 입력 방식 : 실제 프로젝트에 준비 -->
<!-- <script type="파일경로/제이쿼리파일.js"></script> -->
<!-- <script type="lib/jquery.min.js"></script> -->


<!-- CDN방식 : 인터넷 경로를 작성 -->
<!-- <script type="인터넷경로"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	// 이 공간에 제이쿼리를 작성
	// 자바스크립도 가능

	window.onload = function() {
		document.getElementById("here").innerHTML = "이것이 자바스크립트";
	}

	// $ is not defined : 제이쿼리 라이브러리가 등록되지 않은 상태;
	// $ () 함수 : HTML 요소를 선택하게 해주는 함수
	// $ (선택자).동작함수();      // 제이쿼리의 문법

	// 1번 방식

	// $(document).ready(function (){
	// 	$('#here').hide();
	// }); 

	// 2번 방식
	// 	jQuery(function() {
	// 	$('#here').hide();

	// 	});

	// 3번 방식 : 가장 많이 애용하는 방법
	$(function() {
		$('#here').hide();
	});

	// window.onload = function(){};
	// 1번방식 $(document).ready( function(){} );
	// 2번방식 jQuery( function(){} );
	// 3번방식 $( function(){} );

	/* window.onload = function(){ alert('경고')}; */
	$(function() {
		
		alert('경고');
	} );
</script>


</head>
<body>
<!-- 
   jquery : Javascript 이용해서 단순화 시켜놓은 라이브러리
      문서객체모델 (DOM) 좀더 간단하게 구현할수잇는 기능을 지원하는 라이브러리
      
      라이브러리 : 어디선가 다운받아서 우리 프로젝트 적용 
      크게 2가지가 있습니다.
   	1. 다운받아서 사용
   	2. 링크만 연결하여 사용 > CDN : 사용자에게 가장 가까운 사이트에서 컨텐츠를 다운받아서 
                           	    사용되도록 하는 기술
                           	   * 단점은 다운이 느려지거나 실패하면 전체적으로 오류발생

 -->
 
	<div id="here">제이쿼리 시작</div>
</body>
</html>