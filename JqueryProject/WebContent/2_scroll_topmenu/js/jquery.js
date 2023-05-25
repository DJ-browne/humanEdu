/**
 * 
 */

$(function() {

	// 1. 마우스가 올라오고 내려갈때 폰트 크기만 변경 // 색상변경, hover / css/ color

	
		$('#navigation a').hover(function() {
			// 즉시 적용 : csss
			$(this).css({
				'color' : 'orange',
				'font-size' : '15px',
//				'padding-left' : '10px'
			});
			// animate : 적용시간을 딜레이 줄수있다 기준은 ms
			$(this).animate({paddingLeft: "+=10px"}, 1000)

		}, function() {

			$(this).css({
				'color' : '#3687AF',
				'font-size' : '12px',
			});
			$(this).animate({paddingLeft: "-=10px"}, 1000)

		});
	

	// window 객체 : 창 관련된 데이터를 가진 객체
	$(window).scroll(function() {
		// alert( $(document).scrollTop() ); // 스크롤 한후의 가장 위 부분을 알려줌
		$('#navigation').css('top', $(document).scrollTop()); // fixed를 안써도
																// 기능을 사용 할수 있다
	});
});