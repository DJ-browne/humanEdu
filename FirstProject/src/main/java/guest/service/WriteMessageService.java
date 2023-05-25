package guest.service;

import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;

public class WriteMessageService {

	// 싱글톤 패턴을 생성
	private static WriteMessageService instance;
	
	public static WriteMessageService	getInstance() throws MessageException
	{
		if( instance == null )
		{
			instance = new WriteMessageService();
		}
		return instance;
	}
	
	private WriteMessageService()
	{
		
	}
	
	public void write( Message rec ) throws MessageException
	{
		// rec ?
		System.out.println(">> Service Write 진입");
		System.out.println("rec : " + rec);
		MessageDao mDao = MessageDao.getInstance();
		mDao.insert(rec);
	
		System.out.println(">> Service Write 종료");
	}
}
