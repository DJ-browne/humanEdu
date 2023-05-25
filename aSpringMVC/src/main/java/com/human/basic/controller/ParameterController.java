package com.human.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ParameterController {
	
	
	// 응답할 화면(return)과 응답할때 필요한 값(Model)로 별도로 저장
//	@RequestMapping(value = "param.do")
//	public String test(Model model, String id, int age) {
//		
//		
//		// 사용자가 요청과 동시에 전달하는 값은 메소드의 파라미터로 저장
//		// *주의 : 파라미터명은 사용자가 전달값의 속성명과 동일
//		System.out.println("입력된 id >> " + id);
//		System.out.println("입력된 age >> " + age);
//		
//		// 저장된 데이터를 다시 응답페이지에 전달하기 위해서는
//		// Model, request, session 이라는 객체를 활용
//		model.addAttribute("id", id);
//		model.addAttribute("age", age);
//		
//		return "02_param";
//	}
	
	// 화면과 응답할때 필요한 값을 하나로 모은 형태 : ModelAndView
	@RequestMapping(value = "param.do")
	public ModelAndView test(String id, int age) {
		
		
		// 사용자가 요청과 동시에 전달하는 값은 메소드의 파라미터로 저장
		// *주의 : 파라미터명은 사용자가 전달값의 속성명과 동일
		System.out.println("입력된 id >> " + id);
		System.out.println("입력된 age >> " + age);
		
		// 저장된 데이터를 다시 응답페이지에 전달하기 위해서는
		// Model, request, session 이라는 객체를 활용
		
		// Model이라는 객체에 화면에 대한 정보도 포함한 형태 : ModelAndView
		ModelAndView m = new ModelAndView();
		
		m.setViewName("02_param");
		m.addObject("id", id);
		m.addObject("age", age);
		
		return m;
	}
	
	@RequestMapping(value = "02_param")
	public void test2() {
		// return 이 생략된 상태
		// return 생략이 되면 value 값과 동일한 파일명으로 자동 return (응답)
		
	}

}
