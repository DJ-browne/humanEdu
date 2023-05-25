<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script type="text/javascript">
	$(function () {
		// 이벤트를 만드는 기본모양
// 		addEventListener(type, function (e) {});
		// bind ("이벤트명", 실행할함수);
// 			$('li').bind("click",function(){
// 				// text() : innerHTML 과 같은 기능
// 				// text(넣고싶은 글자); == innerHTML = 넣고싶은글자; 
// 			$('#result').text( $(this).text() );
// 			// $('#result').text(넣을값) : id가 result인 대상의 글자를 넣겠다 (setter)
// 			// $(this).text(); : 이벤트가 발생한 대상의 글자를 의미 (getter)
// 	});
		
		// 일회성 이벤트를 생성할때 사용, 이벤트 한번만 실행
// 		$('li').one("click",function(){			
// 		$('#result').text( $(this).text() );		
// 		});
		
		// bind의 축약 버젼 : 동적으로 생성된 요소한테는 이벤트가 입혀지지 않는다 (발생해도 무시)
// 		$('li').click(function(){			
// 			$('#result').text( $(this).text() );		
// 			});
		
		$('h1').click(function () {
			var li = $('<li/>').text( new Date() );  // 현재 날짜 정보를 가진 li태그 
			$('ul').append(li);  // ul태그에 li태그를 append(추가)
		});
		
		// 동적으로 생성된 요소도 이벤트를 적용할 수 있도록 해야한다
		// on : 동적생성된 요소도 이벤트 처리가 가능한 기능
		// on ( "이벤트" , 실행할 함수 )
		// bind와 차이점 : 이벤트를 여러개 작성가능함
// 		$('li').on("click mouseenter", function() {
// 			$('#result').text( $(this).text() );	
// 		});
		
		// 이벤트 대행자
		// 이벤트 대행자.on( "이벤트", "실제 이벤트가 발생할 태그", 실행할 함수 )
		// 이벤트 대행자 : 부모태그 
		// 실제 이벤트가 발생할 태그 : 자식(하위)태그
		
		// 동적으로 생성된 요소도 결국 ul 태그안에 li태그 구조이기때문에 이벤트가 적용된다 >>>> 버블링 , 이벤트 위임방식
		$('ul').on('click', 'li', function () {   // ul 안에 있는 li 태그들은 클릭 이벤트를 적용
			$('#result').text( $(this).text() );	
		});
			
		
		
		
	});

</script>
</head>
<body>
<h1>제이쿼리 이벤트</h1>
    <ul>
      <li>부에노스 아이레스</li>
      <li>바르셀로나</li>
      <li>리마</li>
      <li>라파스</li>
    </ul>   
   <div id="result"></div>
</body>
</html>