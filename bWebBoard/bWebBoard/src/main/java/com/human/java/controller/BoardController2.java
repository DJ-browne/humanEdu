package com.human.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

// 어노테이션 : 컴파일러에게 알리는 힌트절, 이 자바클래스는 Controller의 역할을 할겁니다.
//@Controller
public class BoardController2 {
	
	// 일반적인 메소드의 형태
	public String test2() {		
		return null;	// 호출이 되면 반환할떄 특정한 값을 출력
	}
	
	// @RequestMapping : DispatcherServlet 조회할 이름, 사용자가 요청할 경로이름
	// value값과 동일한 값을 사용자가 요청하면 
	// 메소드가 호출된것처럼 행동 >> return "보여줄화면명";
	@RequestMapping(value="test.do")
	public String test() {
		
		// 원하는 코딩, DB접속하든, 특별한 로직작성, 사용자 입력값을 이용한 로직 작성
		System.out.println("==================================");
		System.out.println("=============테스트성공=============");
		System.out.println("==================================");
		
		return "test"; // ViewResolver 에게 전송할 화면이름
		// ViewResolver 는 전송받은 화면이름을 가지고 보여줄 화면 페이지를 호출
		// prefix + "화면이름" + suffix 이라는 파일을 호출
		// /WEB-INF/views/ test .jsp 라는 파일을 호출
		
	}
	
	
//	@RequestMapping("getBoardList.do")
//	public void getBoardList() {
		
//		return "getBoardList"; // /WEB-INF/views/getBoardList.jsp
		// return 을 생략하여 void의 형태로 만들면
		// mapping으로 작성한 이름에 따라 파일로 이동
//	}
	
//	@RequestMapping("insertBoard.do")
//	public String insertBoard() {
//		
//		return "insertBoard";
//	}
	
	@RequestMapping("getBoard.do")
	public String getBoard() {
		System.out.println("getBoard");
		return "getBoard";
	}
	
	// 위 에 작성한 메소드의 형태는 다 동일합니다
	// mapping 된 값에 의해 단순하게 페이지를 이동 ( 맵핑되면 호출에 의해 리턴만 하는 작업 )
	// 데이터베이스를 접근하지도 않고, 파라미터도 굳이 필요하지않고, 새로운 로직도 필요하지않고 등등...
	// 단순하게 페이지를 이동하는 경우가 많아지면 귀찮게 메소드가 많아집니다.
	// 맵핑으로 적은 ("/{step}.do") 조건에만 맞으면 무조건 호출되는 메소드 
	// 구체적으로 작성한 ~~~.do 라는 맵핑이 없다면 무조건 호출, 맵핑명과 호출명이 동일한 메소드가 있냐없냐
	// jsp파일에서 선택한 호출명 == @RequestMapping(맵핑명)
	// 1. 동일한 메소드가 잇을경우에는 해당 메소드를 실행
	// 2. 동일한 메소드가 없으면 "/{step}.do" 맵핑이 있는 메소드를 실행 (단 조건이 맞아야함)
//	@RequestMapping("/{step}.do")	
//	public String viewPage( @PathVariable String step) {
//		// 단순하게 페이지를 이동하는 경우에 호출되는 메소드
//		// 요청한 페이지의 경로이름을 변수화 : {변수명}  >> 현재는 {step} 으로 설정  
//		// @PathVariable : 사용자가 입력한 요청명을 변수화 
//		// 변수로 화용하여 단순하게 페이지이동할때 사용하는 메소드를 구성
//		System.out.println("step >> "+ step);
//		return step; // /WEB-INF/views/ step에 들어간 파일명 .jsp
//	}
	
	@RequestMapping("/{step}.do")	
	public void viewPage2( @PathVariable String step) {
		System.out.println("step >> "+ step);
		// 리턴생략이 되면 step 들어온 변수가 파일명으로 적용
	}
	
	// @Controller : view(화면)와 Model(로직,DB접속)을 연결하는 역할
	// @RequestMapping 사용자의 요청에 대한 응답을 하기 위해 미리 맵핑, 호출받기위해
	//
	//	>> 요청을 받고 응답하기 전까지 상황에서 여러가지 로직을 구현
	//	>> 1. DB 저장
	//	>> 2. 값을 변경, 수정
	//	>> 3. 단순 응답
	//
	// return / ModelAndView를 통해서 응답 페이지 정보를 사용자에게 전달 (ViewResolver를 통해서)
	
	// 회원가입 >> 사용자가 입력한 값이 정상적인 값읹 체크, JS / JAVA / DB 언어에서 체크
		// 사용자가 입력한 값을 DB에서 체크를 하려면 
		// JS 언어에서 데이터를 준비해서 JAVA에게 주고
		// JAVA 언어에서 데이터를 준비해서 DB에게 줘야 체크가 가능합니다.
		// 오류가 발생하면 다시 역순으로 돌아오면서 JS언어를 이용하여 오류를 표시해아함
	// 사용자가 입력한 값이 정상적인 값인지 체크를 할때 각 언어 마다 할수있는 부분을 체크하는것이 효율적
	// 입력값 공백, null체크 / 입력된 비밀번호 2개 동일여부 / 개인정보동의체크 ... >>JS 언어로 체크(VIEW)
	// DB로 값을 이동, DB결과를 판단 >> Model(JAVA,DB) + Controller(JAVA)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
