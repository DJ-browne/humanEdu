package com.human.java.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.java.domain.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	@Override
	public MemberVO idCheck(MemberVO vo) {
		
		return null;
	}

	@Override
	public int memberInsert(MemberVO vo) {
		System.out.println(">>>>> DAO 도착");
		
		return mybatis.insert("memberDAO.userInsert",vo);
	}

	@Override
	public MemberVO memberLogin(MemberVO vo) {
		System.out.println(">>>>> DAO memberLogin 도착");
		return mybatis.selectOne("memberDAO.memberLogin",vo);
		
	}

	@Override
	public List<MemberVO> memberInfo() {

		return mybatis.selectList("memberDAO.memberInfo");
	}

}
