package com.human.java.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.ListModel;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.human.java.domain.MemberVO;
import com.human.java.service.MemberService;

@Controller
@RequestMapping("/user") // 이 컨트롤러는 /user경로가 호출될때 실행되는 컨트롤러
public class MemberController {

	@Autowired
	private MemberService memberService;

//  잘못된 맵핑 상태 : 폴더를 누락하여 맵핑이 제대로 되지않고, 보여줄페이지(리턴)도 제대로 되지않은 상태
//  @RequestMapping(value="userLogin.do") // user/userLogin.do 맵핑과 다른 값 : Error
//  public String userLogin() {
//     
//     System.out.println("## userLogin.do 진입");
//
//     // WEB-INF/views/리턴값.jsp
//     return "userLogin";          // WEB-INF/views/userLogin.jsp
//  }

//	// 폴더가 있을 경우 잘한 맵핑
////	@RequestMapping(value = "user/userLogin.do")
//	// Controller 자체에 Mapping이 생길경우 맵핑주소 변경된다
//	@RequestMapping(value = "/userLogin.do")
//	public String userLogin() {
//
//		System.out.println("## userLogin.do 진입");
//
//		// WEB-INF/views/리턴값.jsp
//		return "user/userLogin"; // WEB-INF/views/user/userLogin.jsp
//	}
//
////	@RequestMapping("user/userJoin.do")
//	@RequestMapping("/userJoin.do")
//	public String userJoin() {
//		System.out.println("## userJoin.do 진입");
//		
//		return "user/userJoin";
//	}

	// 위 코드는 단순이동이기때문에 맵핑을 하나로 합치자
	// 로직없이 단순 화면 변경을 담당하는 맵핑 메소드
	@RequestMapping("/{url}.do")
	public String viewPage(@PathVariable String url) {
		System.out.println(">>>>> 이동 : " + url);

		return "/user/" + url;
	}

	@RequestMapping("/userInsert.do")
	public ModelAndView userInsert(MemberVO vo) {
		System.out.println(">>>>>userInsert.do 진입");

		// 데이터베이스에 등록 작업
		int result = memberService.userInsert(vo);
		System.out.println("결과 " + result);
		String msg = "가입이 되지 않았습니다";
		if (result > 0)
			msg = vo.getUserName() + "님 가입을 축하드립니다.";

		// message와 result를 화면에 전달 >> Model & ModelAndView
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/userJoin_ok");
		mv.addObject("message", msg);
		mv.addObject("result", result);

		return mv;
		// modelandview는 model하고 같이 화면에 정보를 보여줄때 쓰는데 modelandview는 보여줄 페이지랑
		// 보여줄 정보를 따로 정해서 불러서 넣을수있고 return을 페이지주소가 아닌 값을 다 넣은 변수(mv위에예로는)를
		// 불러온다
	}

	@RequestMapping("/login.do")
	public String login(MemberVO vo, HttpSession session) {

		System.out.println(">>>>> login.do 진입");

		// 로그인 :
		// 1. 로그인화면에 아이디와 비밀번호를 임력
		// 2. 로그인 버튼을 누른다 (화면 (view, *.jsp에서 일어난일) >> (Controller로 전달, 파라미터) )
		System.out.println(">>>>> id : " + vo.getUserId());
		System.out.println(">>>>> password : " + vo.getUserPass());

		// 3. 아이디와 비밀번호가 맞는지 확인한다 >> 회원가입시 사용한 아이디와 비밀번호를 비교 (DB에 있는 값)
		// >> Service > DAO > Mapper > DB 를 통해서 확인
//		memberService.idCheck_Login(vo);
		MemberVO result = memberService.idCheck_Login(vo);
		// DB 조회 > 결과가 있냐 없냐
		System.out.println(result);
		// 4. 맞으면 성공 (객체 생성) / 틀리면 실패(null)
//		System.out.println(result.getUserId()); // 아이디비밀번호 실패시 오류난다 NullPointerException
		if (result == null) {
			return "/user/userLogin";
		} else {
			System.out.println("[ " + result.getUserId() + " ] 로그인 성공");
			
			// 로그인이 성공됐을때 session을 등록
			session.setAttribute("userName", result.getUserName());
			session.setAttribute("userId", result.getUserId());
			session.setAttribute("sessionTime", new Date().toLocaleString());
			
			return "/user/Main";
		}

	}
	
	@RequestMapping("/memberInfo.do")
	public String memberInfo(Model model, HttpSession session) {
		
		// Controller에서도 session제어가 가능하다 (session안에 데이터가 있냐 없냐 구분)
		if (session.getAttribute("userId") == null) {
			return "redirect:/user/userLogin.do";
		}
		
		
		
		// 회원정보 탐색
		// 1. 메인화면에서 회원정보 클릭 >> Controller 에게 전달할 값 존재여부 (X , 파라미터 존재 노노)
		// 2. Service > DAO > Mapper > DB를 통해서 회원정보를 리턴(반환, 조회)
		// -- 회원정보 : 개인정보냐 전체정보냐
		List<MemberVO> mList = memberService.memberInfo();
		
		// 3. 화면에 전달
		model.addAttribute("list", mList);
		
		return "/user/memberInfo";
	}
	
	@RequestMapping("logOut.do")
	public ModelAndView logOut(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		// 로그아웃 : 로그인이 아닌 상태
		session.removeAttribute("sessionTime"); // 한개 삭제
		session.removeAttribute("userName"); // 한개 삭제
		session.removeAttribute("userId"); // 한개 삭제
		
//		session.invalidate(); // 초기화 , 모든 세션을 제거하기때문에 주의
		mv.setViewName("/user/userLogin");
		
		return mv;
	}
	
	
	

}
