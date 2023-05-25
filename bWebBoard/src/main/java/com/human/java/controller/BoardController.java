package com.human.java.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.human.java.domain.BoardVO;
import com.human.java.service.BoardService;

@Controller
public class BoardController {

	// new하는 대신 bean에서 부터 가져오자
	// bean container에서 BoardService 라는 bean 객체를 생성해서 주입
	@Autowired
	private BoardService boardService;

	@RequestMapping("test.do")
	public String test() { 

		// 메소드가 실행이 되면 어떠한 작업을 할것인지 코딩
		// DB와 관련된 작업을 하거나
		// 자바에서만 관련된 작업을 하거나
		// 아무 작업 없이 지나가거나

		System.out.println("============");
		System.out.println("===테스트고===");
		System.out.println("============");

		// DB 연결 > Mybatis와 @Component (Service / Repository)
		// 1. bean container 생성 > 자동으로 생성됐다 > servlet-context.xml
		// servlet-context.xml에서 component-scan를 실행했기때문에 그 상황에 맞춰서 파일을 구성

		// Controller의 역할 : 사용자의 요청에 따라 맵핑된 메소드를 실행하고 (@RequestMapping)
		// 사용자에게 응답할 페이지의 정보를 보여주는것 (return "페이지명")
		// 이외의 작업은 다른 자바파일에게 전달 > service 라는 클래스파일이 하겠다
		// text() 메소드에서 Service클래스를 호출하려면 객체가 필요하다
		// 이전에는 new를 통해서 객체를 생성했다 > Spring에서는 bean + bean container를 활용
		// bean + bean container를 활용하여 미리 만들어 놓은 객체를 호출하여 사용하는 방식
		// >> Autowired, component-scan
		// 테스트용도의 작업

		boardService.timeTest();

//		System.out.println(boardService.timeTest());

		// /WEB-INF/views/test.jsp 파일로 사용자에게 응답
		return "test"; // view resolver 통해서 이 메소드가 종료할때 사용자에게 보여줄 화면페이지파일
		
		// index.jsp 첫 페이지에서 요청이 들어오면 controller에서 응답하고 그 응답을 return으로 함
	
	}

	@RequestMapping("getBoardList.do")
	public String getBoardList(Model model, String searchCondition, String searchKeyword) {
                                    // BoardVO에서 가져오고 싶으면 얘네 둘을 추가 하던가 이렇게 낱개로 입력
			// BoardVO에 자꾸 많은 걸 생성하면 무거워짐 그래서 키워드만들 위하는거니까 저렇에 파라미터로 받아오는거 괜찮음
		System.out.println("=======================");
		System.out.println("========목록진입=========");
		System.out.println("=======================");
		
		System.out.println("조건 : " + searchCondition);
		System.out.println("키워드 : " + searchKeyword);
		
		// >>>>> mybatis의 특정상 하나의 자료형만 입력가능하기때문에 여러개의 값을 전달해야하는 상황에는
		// 배열의 형태로 변경해서 쓴다 
		
		HashMap map = new HashMap(); // hashmap 배열은 내가 넣고 싶은 키와 값을 줄수있다
		map.put("searchCondition", searchCondition);
		map.put("searchKeyword", searchKeyword);

		// controller에서 할 역할 : 글목록을 조회하기 위해서는 DB를 접근해야한다
		// 조회 기능 : DB에서 필요한 값 (파라미터,인자) / DB에서 출력되는 값
		List<BoardVO> bList = boardService.getBoardList(map); // 단순하게 검색만 할때
		for (BoardVO v : bList) {
//			System.out.println(v);
		}
		
		// 데이터를 화면에 전달 : model 객체를 이용 > 파라미터에 작성
		// addAttribute("화면에서사용할변수명", 저장할값);
		model.addAttribute("boardList",bList);
		
		
		
		
		// 사용자에게 보여줄 페이지
		// view resolver를 통해서 맵핑된 메소드가 종료할때 사용자에게 보여줄 화면페이지
		// /WEB-INF/views/ + 파일명+.jsp 의 파일을 응답용 페이지로 호출
		return "getBoardList";

	}
	
	@RequestMapping("insertBoard.do")
	public String insertBoard() {
		// 목록 페이지 > 글쓰기 버튼 > 글등록페이지 응답
		// 컨트롤러에서 할 역할 : 단순하게 페이지 이동만
		// 목록 > 버튼클릭 > 페이지 요청
		// 요청할때 사용자가 입력한 값도 없고, DB를 접근할 이유도 없으니 단순 이동(페이지호출)
		return "insertBoard";
	}
	
	@RequestMapping("saveBoard.do")
	//jsp의 useBean과 똑같은 기능 > BoardVO : 액션태그처럼 VO와 name속성명이 같으면 자동으로 입력
	public String saveBoard(BoardVO vo) { 
		// the role of Controller : Save values in DB that a user inserted 
		// send a request to boardService
		
//		BoardVO vo = new BoardVO();
//		vo.setTitle(title);
//		vo.setWriter(writer);
//		vo.setContent(content);
		
	     System.out.println(">제목  : " + vo.getTitle() );
	     System.out.println(">작성  : " + vo.getWriter() );
	     System.out.println(">내용  : " + vo.getContent() );
		
		// boardService호출
		boardService.insertBoard(vo);
		
		// page shown after saving info > 목록페이지
//		return "getBoardList"; // this one is simply just showing the list page
		
		return "redirect:/getBoardList.do"; // 컨트롤러 내에 있는 맵핑된 메소드를 직접 호출
	}
	
	@RequestMapping("getBoard.do")
	public void getBoard(Model model, BoardVO vo) {
		//     String seq (바로 seq로 가져옴) / BoardBO vo (vo.getSeq)
				
//		// 디비까지 갔다가 새로 업데이트된 정보를 가지고왔으므로 얘를 변수에 담아놓고
//		BoardVO vv = boardService.getBoard(vo); 
		
		// model을 이용해 담아논애를 화면에 보여준다
		model.addAttribute("board",boardService.getBoard(vo)); 
		
//		return "getBoard";

		
//	@RequestMapping("getBoard.do")
//	public String getBoard(Model model, BoardVO vo) {
//		//     String seq (바로 seq로 가져옴) / BoardBO vo (vo.getSeq)
//		
//		// 데이터 베이스에 가서 데이터를 가져와야함
//		// 게시글 번호를 가지고 데이터를 조회해서 화면(view)에 전달
//		// 게시글 번호를 가지고 : saveBoard 만들때
//		//     >>> 가지고 가는 방법 : 파라미터와 인자
//		// 데이터를 조회해서 화면(view)에 전달 : getBoardList 만들때
//		//     >>> 조회해서 화면 전달 : return, Model 객체
	
//		// 디비까지 갔다가 새로 업데이트된 정보를 가지고왔으므로 얘를 변수에 담아놓고
//		BoardVO vv = boardService.getBoard(vo); 
//		model.addAttribute("board",vv); // model을 이용해 담아논애를 화면에 보여준다
		
//		return "getBoard";
				
		
	}
	
	@RequestMapping("deleteBoard.do") 
	public String deleteBoard(BoardVO vo) {
		
		boardService.deleteBoard(vo);
		
		
		// redirect:/ 를 사용하면 컨트롤 내에 있는 맵핑된 메소드를 즉시 호출하는 키워드
		return "redirect:/getBoardList.do";
	}
	
	@RequestMapping("updateBoard.do")
	public String updateBoard(BoardVO vo) {
		
		boardService.updateBoard(vo);
		
		return "redirect:/getBoardList.do";
	}
	
	
}
