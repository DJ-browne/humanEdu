package com.human.java.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.batch.MyBatisBatchItemWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.java.domain.BoardVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	
	@Override
	public void insertBoard(BoardVO vo) {
		mybatis.insert("boardDAO.insertBoard", vo); // 몇개의 행이 들어왔냐를 보기때문에 int
		
	}

	@Override
	public void updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("boardDAO.deleteBoard", vo);
		
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		
		return mybatis.selectOne("boardDAO.getBoard", vo);
	}

	@Override
	public List<BoardVO> getBoardList(HashMap map) {
		// DB 연결
//		mybatis.selectOne("boardDAO.getTime");
		
		return mybatis.selectList("boardDAO.getBoardList");
	}

}
