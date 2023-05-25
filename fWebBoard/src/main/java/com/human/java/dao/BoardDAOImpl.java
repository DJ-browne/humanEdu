package com.human.java.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.batch.MyBatisBatchItemWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.java.domain.BoardVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	@Override
	public void insertBoard(BoardVO vo) {
		mybatis.selectOne("boardDAO.insertBoard",vo);
		
	}

	@Override
	public void updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("boardDAO.getBoard", vo);
	}

	@Override
	public List<BoardVO> getBoardList(HashMap map) {
		// TODO Auto-generated method stub
		return mybatis.selectList("boardDAO.getBoardList");
	}

}
