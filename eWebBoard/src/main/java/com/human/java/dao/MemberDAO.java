package com.human.java.dao;

import java.util.HashMap;
import java.util.List;

import com.human.java.domain.MemberVO;

public interface MemberDAO {

	/**
	 * id 중복체트 기능 구현
	 */	
	MemberVO  idCheck( MemberVO vo );
	
	/**
	 * 회원가입기능 구현
	 */
	int memberInsert(MemberVO vo);
	
	/**
	 * 로그인 확인 기능 구현
	 */
	MemberVO memberLogin(MemberVO vo);
	
	public List<MemberVO> memberInfo();
	
	 // CRUD 기능 구현
	   // 글 등록
	   void insertBoard(MemberVO vo);
	      
	   // 글 수정
	   void updateBoard(MemberVO vo);
	   
	   // 글 삭제
	   void deleteBoard(MemberVO vo);
	   
	   // 글 상세 조회
	   MemberVO getBoard(MemberVO vo);
	   
	   // 글 목록 조회
	   List<MemberVO> getBoardList(HashMap map);
}
