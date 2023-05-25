package com.human.java.service;

import java.util.HashMap;
import java.util.List;

import com.human.java.domain.MemberVO;

public interface MemberService {

	public MemberVO idCheck_Login( MemberVO vo);
	
	public int userInsert(MemberVO vo );
	
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
