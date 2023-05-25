/**
 * 
 */

$(function (){
	
//	$('.accordion').click( function () {
//		alert('1');
//	});
	
//	var allDt = $('.accordion').find('dt');
//	var allDd = $('.accordion').find('dd');
	
	
//	allDd.hide(); 
	
//	allDt.click( function () {
		
//		allDd.hide(); 
		// $(this) : 클릭된dt태그
		// .next() : 다음 태그
		// .show() : 보여준다
//		$(this).next().show();   // 클릭된 dt태그의 다음 태그를 보인다
		
		
//		$(this).next().toggle();   // 클릭된 dt태그의 다음 태그를 보인다
	
//	});

	
	// each() : 선택자에 대한 반복문
	// $('.accordion') : 선택된 대상이 여러개
	
	$('.accordion').each( function () {
		// 1. 클래스 accordion가 2개가 있다 그래서 각각의 기능을 구현
		// -- 선택자.each() : 선택된 대상의 수만큼 함수를 실행
		console.log( $(this) );
	
//		>> 각각의 accordion 클래스 안 자기 자신안에 dt
		var allDt = $(this).find('dt'); 
		var allDd = $(this).find('dd');
		
		allDd.hide(); 
		allDt.css('cursor','pointer')
	    allDt.click(function(){
	    	allDd.hide(); 
	    	allDt.css('cursor','pointer')
	    	$(this).css('cursor','default')
	    	$(this).next().show(); 
	    
//		         allDd.hide();
//		         $(this).next().show(); 
		      });
		
	});
	
	
		
	
	
	
});