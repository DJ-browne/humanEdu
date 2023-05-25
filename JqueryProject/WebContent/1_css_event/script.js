/* ****************************************
	테이블에 한 줄 건너 스타일 지정
 ***************************************** */

$(document).ready(function() {
	
	// $('#celebs tbody tr:even')
	// id가 celebs인 태그를 선택 > 하위태그인 tbody > 하위태그인 tr 중 짝수 번째 태그만 선택
	// 선택된 대상에 대한 동장 : .css()
	// css 스타일을 변경하겠다
	
	// $('#celebs tbody tr:even').css('background','#dddddd');
	// $('#celebs tbody tr:even').css('background','#dddddd');
	// $('#celebs tbody tr:even').css('color','#color');
	// $('#celebs tbody tr:even').css('font-size','15pt');

//	$('#celebs tbody tr:even').css({ // 속성 여러개는 객체형식 json 구조로
//		'background' : '#dddddd',
//		'color' : '#666666',
//		'font-size' : '11pt'
//	});

	/*
	 * css파일에 table_striping 클래스 정의가 되어 있어야함 - 위처럼 css로 색을 지정하면 hover에 색이 변경이
	 * 안되지만 - 아래처럼 클래스 추가하면 hover에 색이 변경된다.
	 */

	// 선택한 대상 : $('#celebs tr:even')
	// id가 celebs인 태그 > 하위태그 tr > tr중에 짝수번째
	// 동작 : .addClass()
	// 클래스를 추가 : table_striping
	$('#celebs tr:even').addClass('table_striping');

	/***************************************************************************
	 * 테이블에 마우스 올라 있는 엘리먼트에 강조
	 **************************************************************************/
	// 선택한 대상 : $('#celebs tr')
	// id가 celebs인 태그 > 하위태그 tr (공백때문에 하위태그를 지칭할수있다)
	// 동작 : .mouseover()
	// 선택된 태그에 마우스가 올라올때 행동
	// 행동 : function(){ }으로 구현 (함수니까) >> $(this).addClass >> 이벤트가 실행된 대상에 Class를 추가 
	//																>> 추가된 클래스명은 'td_mouseover'
	$('#celebs tr').mouseover(function() {
		$(this).addClass('td_mouseover');
	});

	
	// 선택한 대상 : $('#celebs tr')
	// id가 celebs인 태그 > 하위태그 tr (공백때문에 하위태그를 지칭할수있다)
	// 동작 : .mouseout()
	// 선택된 태그에 마우스가 나갈때 행동
	// 행동 : function(){ }으로 구현 (함수니까) >> $(this). removeClass >> 이벤트가 실행된 대상에 Class를 제거 
	//																>> 제거된 클래스명은 'td_mouseover'
	$('#celebs tr').mouseout(function() {
		$(this).removeClass('td_mouseover');
	});

	/***************************************************************************
	 * 버튼 클릭시 엘리먼트 감추고 보이기
	 **************************************************************************/
	// 선택한 대상 : $('#hideButton')
	// 동작 : .click()
	// 클릭이 될때 $('#intro').hide(); 이 코드를 실행
	$('#hideButton').click(function() {
		$('#intro').hide();
	});

	$('#showButton').click(function() {
		$('#intro').show();
	});

//	$('#toggleButton').click(function() {
//		 $('#intro img').toggle();
//		 $('#intro img').fadeToggle(1000);
//		 $('#intro img').slideToggle(1000);   // 1000 : ms를기준, 1초
//
//	});

	
	 $('#toggleButton').click(function(){ 
		 var img = $('#intro img'); 
		 if( img.is(':visible') ) { 
			 img.fadeOut(1000); 
			 }else { img.fadeIn(1000); } 
		 });
	 

//	 Fade 효과 : show() -> fadeIn(), hide() -> fadeOut() , fadeToggle() 
//	 Slide효과 : slideUp(), slideDown(), slideToggle() 
	
//	 Fade/Slide 함수에 인자로 'slow','fast','normal' 또는 숫자로 밀리세컨드초를 지정 가능 [예]
	 fadeOut(1000), slideUp('slow')
	

});
