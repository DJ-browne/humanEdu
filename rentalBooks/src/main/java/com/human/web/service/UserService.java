package com.human.web.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.web.dao.UserDao;
import com.human.web.domain.UserVO;


public interface UserService {
	

	public UserVO idCheck_Login( UserVO vo);
	
	
	public int userInsert(UserVO vo);
	
	
	// CRUD 기능 구현
		// 글 등록
	

		// 글 수정
		void updateBoard(UserVO vo);

		// 글 삭제
		void deleteBoard(UserVO vo);

		// 글 상세 조회
		UserVO getBoard(UserVO vo);

		// 글 목록 조회
		List<UserVO> getBookList(UserVO vo);


		void userUpdate(UserVO vo);


		public int memberInfo(UserVO vo);


		int changeInfo(UserVO vo);


	
	
}

