$(document).ready(function() {

	// 무거워질것이다 계속 초기화 하고 변경 하고 초기화 하고 변경하고
	
//	   $('nav li').click(function(){
//		      // 초기화
//		      $('nav li a').css('color', '#ffffff');
//		      
//		      // 선택 대상 변경
//		      $(this).find('a').css('color', '#ed3140');
//		   })
	
	// 그러므로 클래스 별로 미리 css를 선언 >> 그 클래스를 부여하는 식으로 css를 변경도함
	
	// 이벤트 : 웹 브라우저(화면)에서 발생하는 여러가지 사건, 로딩, 입력, 스크롤, 변경, 선택, 마우스 등....
	// 이벤트가 발생했을때 개발자가 구현할 기능 : function() { 구현할 기능 } 으로 구현
	// 구현할 기능 : id입력체크여부, 필수체크여부, 색상바꾸기, 포인트주기, 강조하기 등......
	// >> 구현한 기능은 이벤트가 발생해야 실행되는 기능
	
	// 언제? : 이벤트 발생하는지
	// 어떻게? : 기능을 구현할것인지
	// {        >> this : 선택한 대상
	//          >> $() : 또다른 선택한 대상
	//          >> $().동작할기능() : 선택한 대상에 대한 구현할 기능에 대한 동작
	// }
	
	// top : 0으로 만들어줘야 내려옴
	// $('.content').css('top','0px');
	$('#container').addClass('start');

	// class='on'
	// 클릭 : li
	$('nav li').click(function() {

		$("nav li").removeClass('on');
		$(this).addClass('on');

		// // ui.css에서 "prev this next" 검색하여 확인 - [참고] !important : 선택자 우선순위 가장
		// 높게 만드는 것
		$(".content").removeClass("prev this next");
		//	      
		var id = $(this).attr("data-rol");
		// //클릭 시 가지고 있던 클래스를 모두 지운다
		$("#" + id).addClass("this").prevAll().addClass("prev");
		// //클릭한 메뉴와 매칭 되는 id에 this 클래스를 지정하고 그 앞의 모든 <section> 태그는 .prev클래스를
		// 지정한다
		$("#" + id).nextAll().addClass("next");
		// //클릭한 메뉴와 매칭 되는 id의 뒤에 오는 <section> 태그는 .next 클래스를 지정한다
	});

	// 로고 클릭 시
	// - 기존에 지정한 클래스 모두 지우기
	// - 화면 크기 조정
	$(".logo_box").click(function() {
		$("nav li").removeClass("on");
		$(".content").removeClass("prev this next");
		$("#container").css("max-width", "1200px");
	});

});
