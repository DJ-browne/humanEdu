package board.service;

import board.model.*;

public class ModifyArticleService {
	
	private static ModifyArticleService instance;
	public static ModifyArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new ModifyArticleService();
		}
		return instance;
	}
	
	public int update( BoardRec rec ) throws BoardException{
		
		// rec 입력받은것을 나중에는 체크하면서 진행, null 일 경우도 잇기때문에
//		System.out.println(rec.getArticleId());
		
		// DB update
		int result = BoardDao.getInstance().update(rec);
	
		return result;
		
	}
}
