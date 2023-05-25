package com.human.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.web.dao.UserDaoImpl;
import com.human.web.domain.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDaoImpl userDao;

	@Override
	public UserVO idCheck_Login(UserVO vo) {
		
		return userDao.userLogin(vo);
	}

	@Override
	public int userInsert(UserVO vo) {
		
		// id만 체크
		
		UserVO checkvo= userDao.idCheck(vo);
		if (checkvo == null) {
			return userDao.userInsert(vo);
		} else {
			// 아이디가 있으면 99를 리턴해라
			return 99;
		}
	}
	

	@Override
	public List<UserVO> getBookList(UserVO vo) {
		
		
		return userDao.getBookList(vo);
	}
	

	@Override
	public int memberInfo(UserVO vo) {
		
		 int result = userDao.memberInfo(vo);
		if ( result == 1) {
			// db UPDATE >> 
			userDao.bookingUpdate(vo);
		} 
			
			return result;
	}

	@Override
	public int changeInfo(UserVO vo) {
		int result = userDao.changeInfo(vo);
		System.out.println(result);
		if (result == 1) {
			userDao.bookingDelete(vo);
			System.out.println(vo);
			
		}
		
		return result;
	}

	@Override
	public void updateBoard(UserVO vo) {
		userDao.userUpdate(vo);
		
	}

	@Override
	public void deleteBoard(UserVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserVO getBoard(UserVO vo) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void userUpdate(UserVO vo) {
		// TODO Auto-generated method stub
		
	}

	public List<UserVO> getAllList() {
		// TODO Auto-generated method stub
		return userDao.getAllList();
	}
	
	
	
}

