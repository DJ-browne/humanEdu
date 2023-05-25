package com.human.java.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.java.dao.BoardDAO;
import com.human.java.domain.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	
	
	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
		
	}

	@Override
	public void updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		
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
	public List<BoardVO> getBoardList(HashMap map) {
		// DB 연결
		return boardDAO.getBoardList(map);
	}

}
