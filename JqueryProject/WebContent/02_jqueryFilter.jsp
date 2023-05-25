<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

   .bg { background : yellow; }
   .border { border : 3px dotted red; cursor: pointer;}
   li:hover {cursor: pointer;}
   .borderRed { border : 3px dotted red; }
   .borderBlue { border : 3px dotted blue; }


</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		
		// 선택된 대상에 대해서 필터링 하는 법
		// 필터링 키워드가 있기 전 선택된 대상중에서 선별
		// $('li')의 선택된 대상 중 홀수, 짝수번째, 순서 등....
		
// 		$('li:even').css('border','2px solid orange');
// 		$('li:eq(0)').css('border','2px solid orange'); // 0부터 시작
// 		$('li:lt(4)').css('border','2px solid blue');  		
// 		$('li:gt(2)').css('border','2px solid olive'); 
		
		// contains : 특정문자열이 포함된 태그
// 		$('li:contains(튀김)').css('border','2px solid yellow'); 
		
		// addClass : 클래스를 추가하는 동작
// 		$('li').addClass("bg");    // 모든 li 태그에 bg라는 클래스를 추가
// 		$('li:odd').addClass("bg");    // 모든 li 태그 중에 홀수번째 태그에 bg라는 클래스를 추가
		
// 		$('li').mouseover(function () {
// 			// li 태그중에서 이벤트가 발생중인 대상 : this
// 			$(this).addClass("border");
// 		});
		
// 		$('li').mouseout(function () {
// 			$(this).removeClass("border");
			
// 		});
		
			
		// 1. li 클릭이 되면 border 클래스가 추가되도록
// 		$('li').click(function () {
// 			$(this).addClass("border");
// 		});
			
		
		// 2. li 클릭한 대상에 border 클래스가 있다면 제거하는 코드 ( 기능이 있습니다)
			
// 		$('li').click(function () {
// 			$(this).toggleClass("border");
// 		});
		
		// if문 써서
		
// 		      $('li').click(function() {
//          if($(this).hasClass("border")){
//                $(this).removeClass("border");
//            }else{
//                $(this).addClass("border");
//            }
//       });
		
			
	});

</script>



</head>
<body>
<h1>제이쿼리 시작</h1>
      <h2>내가 좋아하는 음식 </h2>
      <ul id="food">
         <li>떡볶이0</li> 
         <li>어묵1</li>
         <!--  1. 추가하고 하나씩 확인해 보기 -->         
         <li>
            <ul> <!-- 2 -->
                  <li>어묵국3</li>
                  <li>어묵말이4</li>
                  <li>어묵튀김5</li>
            </ul>
         </li>
         <li>닭튀김6</li>
         <li>돼지튀김7</li>
         <li>소튀김8</li>
         <li>구두튀김9</li>
      </ul>
</body>
</html>