
$(document).ready(function(){
	
	// 선택된 대상 : $('.rollover img')
	// 클래스명이 rollover > 하위 태그 img 태그
	
	// 동작 : .hover()
	// 마우스가 들어오고, 나갈때 이벤트를 구현
	// 들어올때 $(this).attr('src',  $(this).attr('src').replace('_off','_on') );
	
		// 선택된 대상 : $(this) : 이벤트가 발생한 대상
		// 동작 : .attr() : 속성값을 바꾸는 방법, src의 속성을 바꾸겠다
		// 지금까지 상황 : $('.rollover img')에 마우스가 들어오면 src라는 속성을 변경하겠다
	
	// ======================================================================== //
		// src = '값' : 들어갈 값 == $(this).attr('src').replace('_off','_on')
		// $(this) : 이벤트가 발생한 대상
		// .attr('src') : src의 현재 속성값
		// $(this).attr('src') : 이벤트가 발생한 대상의 src의 현재 속성값
		// .replace('_off','_on') : off를 on으로 바꾸겠다
	
	// 나갈때 $(this).attr('src',  $(this).attr('src').replace('_on','_off') );
		
		// 선택된 대상 : $(this) : 이벤트가 발생한 대상
		// 동작 : .attr() : 속성값을 바꾸는 방법, src의 속성을 바꾸겠다
		// 지금까지 상황 : $('.rollover img')에 마우스가 나갈때 src라는 속성을 변경하겠다
	
	// ======================================================================== //
		
	
	$('.rollover img').hover(function(){
		$(this).attr('src',  $(this).attr('src').replace('_off','_on') );
				
	}, function(){
		$(this).attr('src',  $(this).attr('src').replace('_on','_off') );
	})
});

