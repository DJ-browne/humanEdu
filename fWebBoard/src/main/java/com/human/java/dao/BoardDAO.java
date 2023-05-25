package com.human.java.dao;

import java.util.HashMap;
import java.util.List;

import com.human.java.domain.BoardVO;

public interface BoardDAO {

	   // CRUD 기능 구현
	   // 글 등록
	   void insertBoard(BoardVO vo);
	      
	   // 글 수정
	   void updateBoard(BoardVO vo);
	   
	   // 글 삭제
	   void deleteBoard(BoardVO vo);
	   
	   // 글 상세 조회
	   BoardVO getBoard(BoardVO vo);
	   
	   // 글 목록 조회
	   List<BoardVO> getBoardList(HashMap map);
}
