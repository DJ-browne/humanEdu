package com.human.java.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.java.dao.BoardDAO;
import com.human.java.domain.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	// Spring에서는 bean + bean container를 활용
	// bean + bean container를 활용하여 미리 만들어 놓은 객체를 호출하여 사용하는 방식
	//        >> Autowired, component-scan
	
	@Autowired // new변수를 객체화 시켜줘~ autowired~~
 	private BoardDAO boardDAO; 
	// 전역변수로 사용한 이유는 모든 메소드가 사용해야하니까 new를 한거와 같은거 
	
	
	@Override
	public String timeTest() {
		// Service의 역할 : Controller와 DAO의 중간다리 연결체
		// 1. 단순하게 이동
		// 2. Controller에서 넘겨준 데이터를 추가, 변경, 삭제하여 DAO에게 전달
		// 3. DAO에서 넘겨준 데이터를 추가, 변경, 삭제하여 Controller에게 전달
		return boardDAO.timeTest();
	}

	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
		
	}

	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
		
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		
		boardDAO.deleteBoard(vo);
		
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		
		return boardDAO.getBoard(vo);
	}

	@Override
	// interface에서 무언가를 변경하거나 더하면 여기 구현체로 와서 똑같이 변경해주어야한다
	public List<BoardVO> getBoardList(HashMap map) {  
		// 서비스에서 할 역할 : 글목록을 조회하기 위해서는 DB를 접근해야함 > boardDAO와 연결
		// 조회기능 : DB에서 필요한값(파라미터, 인자) / DB에서 출력되는 값 (return)
		
		return boardDAO.getBoardList(map);
	}

}
