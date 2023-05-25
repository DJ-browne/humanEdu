<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>01_jqueryBasic.jsp</title>
<style type="text/css">

#here {
cursor: pointer;
}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(function() {
	
	// var here = document.getElementById('here');
	var here = $('#here');
	
	// $('#here').click();
	// $('#here').mouseenter();
	// $('#here').mouseleave();
	// $('#here') 를 변수화 시키는 것이 좀 더 유리
	
	// here.addEventListener("click",function(){});
	
	// 선택한 대상 : $('#here') >> 변수화 : here
	// 선택할 대상이 클릭이 될때, 클릭하면 어떤행동을 하겠다
	here.click(function () {
		here.text('클릭하면 내용이 바뀝니다');
	});
	// 선택한 대상이 마우스가 들어올때 어떤 행동을 하겠다
	here.mouseenter(function(){
		here.text('마우스가 들어왔다');
	}); 
	
	// 선택한 대상이 마우스가 나갈때 어떤 행동을 하겠다
	here.mouseleave(function(){
		here.text('마우스가 나갔다');
	}); 
	
	here.hover(function() {
		here.css('border','3px solid green')
	}, function () {
		here.css('border','3px solid red')
		
	});
	
	// stu 변수에는 id가 student인 태그가 담긴 상태
	var stu =$('#student');
// 	stu.css('color','red');
	
	// stu.find() : stu 태그 안에서 찾아라 >> id가 name인 대상(태그)
	// stu.find('#name') : 기능에서 찾아준 태그에 .css() 기능을 사용
	stu.find('#name').css('border','1px solid blue');
	
	var stu =$('#student');
	var name = stu.find('#name');
	
	
	
	
});

</script>

</head>
<body>
	<div id="here">
      아자아자 제이쿼리~~!!! 
   </div>
   
   
   <div id="student">
      <div id="name">홍길동</div>
      <div id="age">34</div>
   </div>
</body>
</html>