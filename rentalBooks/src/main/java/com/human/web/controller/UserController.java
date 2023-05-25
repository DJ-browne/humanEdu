package com.human.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.human.web.dao.UserDao;
import com.human.web.dao.UserDaoImpl;
import com.human.web.service.UserService;
import com.human.web.service.UserServiceImpl;
import com.human.web.domain.*;

// java를 효율적이로 코딩하기 위해 필요한 구조가 mvc 디자인 패턴
// M odel : 자바를 이용해서 db에 연결하는 과정에 대한 파일들, 로직
// V iew : jsp, html, cssm js등 화면에 출력하고자 하는 파일, 페이지
// C ontroller : 화면과 로직에 대해서 연결해주는 파일, 연결점
@Controller
public class UserController {
	
	// @Autowired : 스프링의 빈 컨테이너 안에 있는 객체를 탐색해주는 키워드
	// 빈 컨테이너 : servlet-context.xml 에서 만든 객체들에서 UserDao객체명을 가진 bean을 가져와서 쓴다
	@Autowired
	private UserServiceImpl userService;
	// 우리가 매번 new를 통한 인스턴스 생성 혹은 싱글톤패턴을 만들 필요가 없어짐
	
	// controller : 화면과 로직에 대해서 연결해주는 파일
	// getBookList : 화면에서 요청할 이름, 키워드, 호출이름
	// return : 요청이 들어오면 보여줄 파일, 화면, 페이지
	
	// 로직없이 단순 화면 변경을 담당하는 맵핑 메소드
	@RequestMapping("/{url}")
	public String viewPage(@PathVariable String url) {

		return url;
	}

	
	// 화면에서 요청할 이름은 getBookList 이다
	@RequestMapping("getBookList")
	public String getBookList(Model model, UserVO vo) {

		// 1. 검색어들을 위한 변수를 만들어도되고
		// 2. vo라는 변수를 이용해도되고
		
		// 1. 사용자가 검색어를 아예 안썼을때 >> ""
		// 2. 사용자가 검색어를 올바르게 썼을때 >> 
		// 3. 페이지에 처음 들어왔을때 >> null
		
		
		if (vo.getBookSearch() == null && vo.getTopSelect() == null) {
			// 처음 로딩했을때 db갈필요없음
			return "searchBook";
		} else {
			
			// 필요하다면 model에 대해 구현 (로직, java를 이용해서 db에 연결하는 과정)
			// Service도 만들고 DAO도 만드는것이 가장 좋다
			// 각각의 파일들에게 코드를 분업화
			List<UserVO> bList = userService.getBookList(vo);
			model.addAttribute("list", bList);
			
			// getBookList 요청이 들어오면 보여줄 페이지이름
			return "searchBook"; // WEB-INF/views/test.jsp
			// 추후에는 보여줄 페이지를 searchBook으로 변경
			
			// 위와 같은 경로가 만들어지는 이유 : servlet-context.xml에 설정되어잇음
			// - org.springframework.web.servlet.view.InternalResourceViewResolver
		}
		
	}
	
	@RequestMapping("ajax")
					// 1. 원래는 페이지로 리턴하는데 ajax을 써서 페이지로 보이지않고 데이터로 보여주겠다를 하려고
	@ResponseBody   // 2. responsebody annotaion 을 붙인다
	public HashMap<String, List<UserVO>> ajax(UserVO vo) {
		
		List<UserVO> bList = userService.getBookList(vo);
		// List 형태
//		System.out.println("리스트형태 : " + bList);
		// JSON 형태
//		{bookid : 1, booktitle : ...}
		
		// {
		//  0 : {bookid : 1, booktitle : ...},
		//  1: {bookid : 1, booktitle : ...}
		
		// }
		
		// HashMap<String, List<UserVO>> map = new HashMap<String, List<UserVO>>();
		// map.put("jsonList", bList);
		
//		return "ajax데이터"; public String일때 문자열로 받을때
		
//		return bList;  // 이 코드가 정상적으로 진행되도록 구현(*) List형태가 자바스크립에서 문제가 없어야함
		// [{} {} ] : 리턴이 list인 경우 다음과 같은 형태로 전달
		
		// 가장 올바른 방법 : json > java에서 hashMap의 형태로 구현이 된다
		// hashMap의 형태로 리턴하여 json으로 변환
		
		 //            0번째에 있는 list가 들어가야하니까 값을 vo list로 줌(더 큰 Object로 줘도됨)
		 HashMap<String, List<UserVO>> map = new HashMap<String, List<UserVO>>();
		 map.put("jsonList", bList);
		 return map;
		
	}
	
	@RequestMapping("getBookingInfo")
	@ResponseBody // 2. responsebody annotaion 을 붙인다
	public String getBookingInfo(UserVO vo) {
		userService.getBookList(vo);
		
		// 1. 원래는 페이지로 리턴하는데 ajax을 써서 페이지로 보이지않고 데이터로 보여주겠다를 하려고
		return "1";
	}
	
	
	@RequestMapping("loginAction")
	public String login(UserVO vo, HttpSession session, Model model) {
		UserVO result = userService.idCheck_Login(vo);
		
		if(result == null) {
			model.addAttribute("msg", "입력하신 정보가 틀립니다.");
			return "redirect:/login";
		} else {
			session.setAttribute("userid", result.getUserid() );
			session.setAttribute("username", result.getUsername() );
			session.setAttribute("sessionTime", new Date().toLocaleString());
		}
		
		return "redirect:/main";
	}
	
	@RequestMapping("joinAction")
	@ResponseBody	
	public String userInsert(UserVO vo) {
		
		int result = userService.userInsert(vo);
//		String resultString = Integer.toString(result);
		// int를 String으로 형변화해서 return해야할때 위처럼 쓰거나
		// 아래 처럼 빈 String ""를 + 해주면 int가 String으로 변한다
		return result+"";
	}
	
	@RequestMapping("updateAction")
	public String userUpdate(UserVO vo) {
			userService.updateBoard(vo);
			
		return "redirect:/main";
		
	}
	
	@RequestMapping("reservation")
	public String userReservation(UserVO vo, HttpSession session) {
		int result = userService.memberInfo(vo);
				
		return "redirect:/main";
		
	}

	@RequestMapping("bookingAction")
	@ResponseBody	
	public String bookingInfo(UserVO vo) {
		
		int result = userService.memberInfo(vo);
		
//		String resultString = Integer.toString(result);
		// int를 String으로 형변화해서 return해야할때 위처럼 쓰거나
		// 아래 처럼 빈 String ""를 + 해주면 int가 String으로 변한다
		return result+"";
	}
	
	
	@RequestMapping("getAllList")
	@ResponseBody
	public HashMap<String, List<UserVO>> getAllList(UserVO vo) {
	List<UserVO> bList = userService.getAllList();
	
	HashMap<String, List<UserVO>> map = new HashMap<String, List<UserVO>>();
	 map.put("bookList", bList);
	
	return map;
	
	}
	
	
	@RequestMapping("changeAction")
	public String changeInfo(UserVO vo) {
			userService.changeInfo(vo);
			
		return "redirect:/myBooking";
		
	}
	
	

	
	
}
