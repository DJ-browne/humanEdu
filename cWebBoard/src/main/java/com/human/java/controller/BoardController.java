package com.human.java.controller;

import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.human.java.domain.BoardVO;
import com.human.java.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired  // 밑에 객체를 쓰려고 하기때문에 bean에서 가져온다 autowired로
	private BoardService boardService; // 쓸애를 데려온다
	
	
	
	
	// 공통적으로 사용할 Mapping 메소드
	// 단순한 페이지 이동을 위한 메소드	
	@RequestMapping("/{step}.do") 
	// .do 앞에있는 애를 변수화 시켰다 step에는 어떤 거를 클릭하고 그 클릭에 어떤게 연결된건지에 따라 바뀐다 
	public String viewPage(@PathVariable String step) {
		System.out.println(" === step "+ step + " 진입 ===");
		return step;  // 즉 return되는 step은 파일명이다  ex) insertBoard.do / saveBoard.do
	}

	@RequestMapping(value="getBoardList.do") // value 생략해도됨
	public String getBoardList(Model model) {
		System.out.println("=== getBoardList.do 집입 ===");
		
		// DB접근
		List<BoardVO> bList = boardService.getBoardList(null);
		
		model.addAttribute("boardList", bList);
		
		return "getBoardList";
	}
	
//	@RequestMapping("insertBoard.do") 
//		public String insertBoard() {
//			// 굳이 할 기능이 없다 >> 단순이동, 페이지 전환 기능만 존재, 요청에 대한 응답
//			// 굳이 필요 없으니께 {step}.do 맵핑을 통해서 진행되도록 하기위해 굳이 맵핑을 할 필요가 없다
//			return "insertBoard";
//		}
	
	@RequestMapping("saveBoard.do")
	public String saveBoard(BoardVO vo) {
		System.out.println("=== saveBoard.do 집입 ===");
		System.out.println("## file이름 : "+ vo.getB_fname()+" ##");
		System.out.println("## file크기 : "+ vo.getB_fsize()+" ##");
		
		// vo라는 변수에 값이 담기는지 확인하는 버릇
//		System.out.println(vo.getB_name());
		
		boardService.insertBoard(vo);
		
		return "saveBoard";
	}
	
	@RequestMapping("getBoard.do") 
		public String getBoard(BoardVO vo, Model model) {
			System.out.println("=== getBoard.do 집입 ===");
			System.out.println("=> 가져온 번호 : "+vo.getB_id());
			
			// vo에는 게시글번호 담김
			model.addAttribute("board",boardService.getBoard(vo));
			
			return "getBoard";
		
	}
	
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		System.out.println(" == deleteBoard.do 집입 ==");
		
		boardService.deleteBoard(vo);
		
		return "redirect:getBoardList";
	}
	
	@RequestMapping("updateBoard.do")
	public String updateBoard(BoardVO vo) {
		System.out.println(" == updateBoard.do 집입 ==");
		
		boardService.updateBoard(vo);
		
		return "redirect:getBoardList";
	}
	
}
