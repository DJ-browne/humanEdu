$(function() {
	var topDiv = $('.tabSet');

	var anchors = topDiv.find('ul.tabs a');
	var panelDivs = topDiv.find('div.panel');
	
	// show tabs
	anchors.show();
	
	

	var lastAnchor = anchors.filter(".on"); // class 이름이 on인 태그를 선택
	var selector = lastAnchor.attr('href'); // 그 선택된 on 태그의 href 속성의 값을 추출 >>
											// #panel1-1
	var lastPanel = $(selector); // $(#panel1-1); // id를 선택한것 // 해당 id를 가진
									// div 태그를 선택

	// lastAnchor : 선택한 탭
	// lastPanel : 선택한 탭에 대한 내용을 담은 div
	panelDivs.hide();
	lastPanel.show();
	
//  anchors.click(function(event) {
//  // 이벤트 설정 -> 클릭 디폴트 동작 무효화
//  event.preventDefault();
//  // 선택한 탭이 누구인지 확인
//  // 선택한 탭의 href값 추출
//  var currentAnchor = $(this);
//  var currentPanel = $(currentAnchor.attr('href'));
//  console.log(currentAnchor);
//  console.log(currentPanel);
//  // on이라는 클래스를 변경
//  lastAnchor.removeClass('.on'); // 클릭된 탭 클래스 삭제
//  currentAnchor.addClass('.on'); // 클릭된 탭 클래스 추가
//  // 다른 패널을 숨기고 누른 탭에 대한 패널은 보여줌
//  lastPanel.hide();
//  currentPanel.show();
//  // 현재 상태 저장
//  lastAnchor = currentAnchor;
//  lastPanel = currentPanel;
//});


	anchors.click(function() {
		// 1. 선택한 탭이 누구인지 확인
		var currentAnchor = $(this);
		// console.log(currentAnchor);
		// 2. 선택한 탭의 href 값을 추출
		var currentPanel = $(currentAnchor.attr('href'));
		// console.log(currentPanel);

		// 0. on 클래스를 변경
		lastAnchor.removeClass('.on');
		currentAnchor.addClass('.on');
		// 3. 다른 패널을 숨기고 // 전체숨김 panelDivs, 그 전 대상 lastPanel을 숨김
		lastPanel.hide();

		// 4. 누른 탭에 대한 패널은 보여주고
		currentPanel.show();

		// 5. 현재 상태를 저장

		// lastAnchor : 이전 데이터
		// lastPanel : 이전 탭에 대한 내용일 담은 div
		// currentAnchor : 현재 데이터
		// currentPanel : 현재 탭에 대한 내용일 담은 div

	});
	
//	$('.tabSet').tabs(); // 클릭이벤트를 만들어준 기능, on 클래스를 바꾸는 기능은 없다

});
