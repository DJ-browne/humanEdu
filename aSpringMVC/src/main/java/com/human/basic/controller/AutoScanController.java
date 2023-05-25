package com.human.basic.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.human.basic.model.MemberVO;


@Controller
public class AutoScanController {

	// 일반 메소드 >> 기능을 사용하고 값을 리턴하는 메소드
	// 이 메소드는 text() 메소드를 호출해야 실행된다
	public String test() {
		
		return "autoScan";
		// return 문자열값을 반환 >> 호출한 대상에게 문자열을 전송
	}
	
	//@RequestMapping : 요청에 대한 주소를 작성해놓고 주소가 요청이 되면 컨트롤러에 의해 실행하는 메소드
	// 메소드명으로 호출하는것이 아니라 @Controller에 의해 미리 맵핑된 value에 의해 호출되는 메소드
	@RequestMapping(value = "/autoScan")
	public String autoScan(HttpSession session, Model model) {
		System.out.println("/autoScan 호출됨");
		
		MemberVO vo = new MemberVO();
		vo.setId("hong");
		vo.setName("홍길동");
		vo.setAge(20);
		// Model : request & session 처럼 내장된 객체, 파라미터를 통해서 선언만하면 자동생성되는 객체
		// 데이터를 주고받을때 사용하는 일회성 객체
		session.setAttribute("id", "hong");
		model.addAttribute("vo",vo);
		
		
		return "autoScan";
		// return 접속을 할 페이지의 이름 : 요청에 대한 응답할 페이지명
		
		// @RequestMapping (value = "요청할페이지명") : 페이지명은 정확하지 않아도 된다
		// return을 통해서 응답할 페이지명 : 페이지명이 실제로 존재해야한다
		// ViewResolver의 설정에 따라서 파일의 위치를 판단 : spring/allServlet/servlet-context.xml
		
		// prefix속성값 + 응답할페이지명 + suffix속성값에 의한 파일을 응답페이지로 설정
		// /WEB-INF/views/autoScan.jsp 라는 파일을 응답페이지로 설정
	}
	
}
