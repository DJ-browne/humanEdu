package board.service;

import java.text.DecimalFormat;
import java.util.Date;

import board.model.BoardDao;
import board.model.BoardException;
import board.model.BoardRec;


public class ReplyArticleService {
	
	private static ReplyArticleService instance;
	public static ReplyArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new ReplyArticleService();
		}
		return instance;
	}
	
	public BoardRec reply( String pId,  BoardRec rec ) throws BoardException{
		
		int parentId = 0;
		if( pId != null ) parentId = Integer.parseInt(pId);


		BoardDao dao = BoardDao.getInstance();
		// 부모게시글의 레코드를 얻어옴
		BoardRec parent = dao.selectById(parentId);
		
		// 부모게시글을 체크
		checkParent(parent, parentId);
		
		// 답변글에 순서번호 구하기
		// 부모의 그룹ID / 순서번호 		>> 글을 작성할때 생성되는 코드
		String maxSeqNum = parent.getSequenceNo();
		System.out.println("최대 >> " + maxSeqNum); // 부모의 시퀀스
		String minSeqNum = getSearchMinSeqNum( parent );

		System.out.println("최소 >> " + minSeqNum); // 부모의 순서번호중 가장 작은숫자
		
		String lastChildSeq = dao.selectLastSequenceNumber( maxSeqNum, minSeqNum );
		// 실제 저장된 가장 작은 데이터
		System.out.println("순서번호 가장 작은 데이터 >> " + lastChildSeq);
		
		// 부모의 시퀀스 번호와 실제 저장된 데이터를 이용하여 나(답글)의 순서번호를 설정 		
		String sequenceNumber = getSequenceNumber( parent,lastChildSeq);
		System.out.println("자신의 순서번호 레벨 >> " + sequenceNumber);
		
		rec.setGroupId(parent.getGroupId()); // 부모의 그룹번호와 동일하게 지정
		rec.setSequenceNo(sequenceNumber);	 // 위에서 구한 답변글의 순서번호 지정
		rec.setPostingDate( (new Date()).toString());	 // 등록일
		
		int articleId = dao.insert(rec);
		rec.setArticleId(articleId);
		
		return rec;
		
	}
	
	
	/*
	 * 부모글이 존재하는지 부모글이 마지막 3단계인지 확인하는 함수
	 */
	private void checkParent( BoardRec parent, int pId ) throws BoardException
	{
		
		if( parent == null ) throw new BoardException("부모글이 존재하지 않음 : " + pId );
		
		int parentLevel = parent.getLevel();
		if( parentLevel == 3 ) throw new BoardException("3단계 마지막 레벨 글에는 답변을 달 수 없습니다.");
	
	}
	
	
	private String getSearchMinSeqNum( BoardRec parent )
	{
		String parentSeqNum = parent.getSequenceNo();
		DecimalFormat dFormat = new DecimalFormat("0000000000000000");//16개자리
		long parentSeqLongValue = Long.parseLong(parentSeqNum);
		long searchMinLongValue = 0;
		
		// parent : 부모의 데이터를 가지고 있는 객체
		switch( parent.getLevel())
		{
		case 0 : searchMinLongValue = parentSeqLongValue / 1000000L * 1000000L; break;
		case 1 : searchMinLongValue = parentSeqLongValue / 10000L * 10000L; break;
		case 2 : searchMinLongValue = parentSeqLongValue / 100L * 100L; break;
		}
		return dFormat.format(searchMinLongValue);
	}
	
	
	private String getSequenceNumber( BoardRec parent, String lastChildSeq ) throws BoardException
	{
		long parentSeqLong	= Long.parseLong( parent.getSequenceNo());
		int  parentLevel	= parent.getLevel();
		System.out.println("부모의 순서번호 레벨 >> " + parentLevel);
		long decUnit = 0;
		if		( parentLevel == 0 ){	decUnit = 10000L;	}
		else if	( parentLevel == 1 ){	decUnit = 100L;		}
		else if ( parentLevel == 2 ){	decUnit = 1L;		}
		
		String sequenceNumber = null;
		
		DecimalFormat dFormat = new DecimalFormat("0000000000000000");
		if( lastChildSeq == null ){			// 답변글이 없다면
			sequenceNumber = dFormat.format(parentSeqLong-decUnit);
		} else {							// 답변글이 있다면, 마지막 답변글인지 확인
			String orderOfLastChildSeq = null;
			if( parentLevel == 0 ){
				orderOfLastChildSeq = lastChildSeq.substring(10,12); // 98
				sequenceNumber = lastChildSeq.substring(0, 12) + "9999";
			}else if( parentLevel == 1 ){
				orderOfLastChildSeq = lastChildSeq.substring(12,14);
				sequenceNumber = lastChildSeq.substring(0, 14) + "99";				
			}else if( parentLevel == 2 ){
				orderOfLastChildSeq = lastChildSeq.substring(14,16);
				sequenceNumber = lastChildSeq;			
			}
			
			if( orderOfLastChildSeq.equals("00")){
				throw new BoardException("마지막 자식 글이 이미 존재합니다.");
			}

			long seq = Long.parseLong(sequenceNumber) - decUnit;
			sequenceNumber = dFormat.format(seq);
			
			return sequenceNumber; 
		}
		return sequenceNumber;
		
	}
}
