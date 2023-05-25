package guest.service;

import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;

import java.util.List;

public class ListMessageService {

	//-------------------------------------------------------------------
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 3;	// 한페이지당 레코드 수
	
	private static ListMessageService instance;
	
	public static ListMessageService	getInstance() throws MessageException
	{
		if( instance == null )
		{
			instance = new ListMessageService();
		}
		return instance;
	}
	
	private ListMessageService()
	{
		
	}
	
	public List <Message> getMessageList() throws MessageException
	{
		// 전체 레코드를 검색해 온다면
		List <Message> mList = MessageDao.getInstance().selectList();			
		return mList;
	}
	
	// 페이징
	
	public int getTotalPage() throws MessageException
	{	
		// 페이지갯수 = 전체 데이터의 갯수 / 보여줄갯수 
		// pageTotalCount = 전체 데이터의 갯수 / 페이지별 보여줄 갯수
		// pageTotalCount =  totalRecCount / countPerPage
		
		// 데이터베이스 담긴 전체 레코드 갯수
		totalRecCount = MessageDao.getInstance().getTotalCount();
		
		pageTotalCount =  totalRecCount / countPerPage;
		if( totalRecCount % countPerPage > 0 ) pageTotalCount++;
				
		return pageTotalCount;
	}
	
	public List <Message> getMessageList(int pageNum) throws MessageException
	{
		// 현재 페이지 번호에 의한 레코드를 검색
		// 한페이지에 표현할 게시글 수를 5로 잡았을 경우
		// 1번 : 1 ~ 5 행
		// 2번 : 6 ~ 10 행
		// 3번 : 11 ~ 15 행
		
		// 한페이지에 표현할 게시글 수를 3로 잡았을 경우
		// 1번 : 1 ~ 3 행
		// 2번 : 4 ~ 6 행
		// 3번 : 7 ~ 9 행

		// countPerPage : 보여줄 게시글 갯수
		int firstRow = (pageNum-1) * countPerPage + 1;
		int endRow = pageNum * countPerPage ;
		
		List <Message> mList = MessageDao.getInstance().selectList(firstRow, endRow);			
		return mList;
	}
	
	
}
