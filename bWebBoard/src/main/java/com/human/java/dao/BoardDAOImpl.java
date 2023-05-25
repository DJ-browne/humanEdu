package com.human.java.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.java.domain.BoardVO;

@Repository("boardDAO") // Repository라고 component화 했음
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public String timeTest() {
		// DB 연결해야함 여기에 >> mybatis 이용해서 SQL문장과도 분리
		// 코드 한 줄 mybatis.메소드();
		// selectOne : 한줄조회하는 명령어
		// selectOne(mapper의 네임스페이스.태그id)
		// String str = mybatis.selectOne("testMapper.getTime");
		// return str;

		return mybatis.selectOne("testMapper.getTime");
	}

	@Override
	public void insertBoard(BoardVO vo) {
		System.out.println("-> 데이터 입력");
		// insert(mapper의 네임스페이스.태그id , 전달할값)
		mybatis.insert("boardDAO.insertBoard",vo);

	}

	@Override
	public void updateBoard(BoardVO vo) {
		mybatis.update("boardDAO.updateBoard", vo);

	}

	@Override
	public void deleteBoard(BoardVO vo) {
		
		mybatis.delete("boardDAO.deleteBoard", vo);

	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		
		return mybatis.selectOne("boardDAO.getBoard",vo);
	}

	@Override
	public List<BoardVO> getBoardList(HashMap map) {

		// DAO에서 할 역할 : 글목록을 조회하기 위해서는 DB를 접근해야함 > mybatis 객체를 통해서DB에 쿼리실행
		// 조회 기능 : DB에서 필요한값(파라미터, 인자) / DB에서 출력되는 값 (return)
		System.out.println("-> DAO호출");
		System.out.println("-> 조건 : " + map.get("searchCondition"));
		System.out.println("-> 키워드 : " + map.get("searchKeyword"));
		

		// selectList(mapper의 네임스페이스.태그id , 전달할값) >> DB결과를 리턴, List형태로
		return mybatis.selectList("boardDAO.getBoardList",map);
		
		// mybatis의 구조상 여러개를 줄수없다 하나만 전달할수있는데 근데 주고싶은게 두개네? 리스트로 여러개를 하나로 
	}

}
