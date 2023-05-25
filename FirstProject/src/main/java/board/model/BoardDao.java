package board.model;


import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class BoardDao
{
	
	// Single Pattern 
	private static BoardDao instance;
	
	// DB 연결시  관한 변수 
	private static final String 	dbDriver	=	"oracle.jdbc.driver.OracleDriver";
	private static final String		dbUrl		=	"jdbc:oracle:thin:@127.0.0.1:1521:orcl";
	private static final String		dbUser		=	"seung";
	private static final String		dbPass		=	"1234";
	
	
	private Connection	 		con;	
	
	//--------------------------------------------
	//#####	 객체 생성하는 메소드 
	public static BoardDao	getInstance() throws BoardException
	{
		if( instance == null )
		{
			instance = new BoardDao();
		}
		return instance;
	}
	
	private BoardDao() throws BoardException
	{
	
		try{
			
			/********************************************
				1. 오라클 드라이버를 로딩
					( DBCP 연결하면 삭제할 부분 )
			*/
			Class.forName( dbDriver );	
		}catch( Exception ex ){
			throw new BoardException("DB 연결시 오류  : " + ex.toString() );	
		}
		
	}
	
	
	//--------------------------------------------
	//#####	 게시글 입력전에 그 글의 그룹번호를 얻어온다
	public int getGroupId() throws BoardException
	{
		PreparedStatement ps = null;
		ResultSet rs = null;
		int groupId=1;
		try{
			con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );
			String sql		= "SELECT seq_group_id_article.nextval as group_id FROM dual";  
			ps		= con.prepareStatement( sql );
			rs = ps.executeQuery();
			if( rs.next())
			{				
				groupId = rs.getInt("group_id");
			}
			
			return groupId;
		}catch( Exception ex ){
			throw new BoardException("게시판 ) 게시글 입력 전에 그룹번호 얻어올 때  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}		
	}

	//--------------------------------------------
	//#####	 게시판에 글을 입력시 DB에 저장하는 메소드 
	public int insert( BoardRec rec ) throws BoardException
	{
		
		/************************************************
		*/
		ResultSet rs = null;
		Statement stmt	= null;
		PreparedStatement ps = null;
		try{

			con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
			
			String sql = "INSERT INTO article  "
					+ " ( article_id, group_id, sequence_no, posting_date, read_count, writer_name, password, title, content )"
					+ " VALUES "
					+ " ( seq_article_id_article.nextval, ?, ?, sysdate, 0, ?, ?, ?, ?)"; 
			
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, rec.getGroupId());
			ps.setString(2, rec.getSequenceNo());
			ps.setString(3, rec.getWriterName());
			ps.setString(4, rec.getPassword());
			ps.setString(5, rec.getTitle());
			ps.setString(6, rec.getContent());
			
			int insertCount = ps.executeUpdate();
			
			if ( insertCount > 0 ) {
				System.out.println(">>입력완료<<");
				// 현재 시퀀스 번호를 가져오는 조회문을 사용 하여 
				// article_id 글번호 값을 DB로 부터 조회
				sql = "SELECT seq_article_id_article.currval as CNT FROM dual";
//				sql = "SELECT article_id as CNT FROM article WHERE ROWNUM = 1 ORDER BY article_id DESC ";
				
				stmt = con.createStatement();
				
				rs = stmt.executeQuery(sql);
				if ( rs.next() ) {
					return rs.getInt(1);		// 첫번째 컬럼 값 : 방금 입력한 데이터의 글번호
//					rs.getInt("CNT");	// CNT 컬럼명 값
				}				
			}
			
			return -1;
		
		}catch( Exception ex ){
			throw new BoardException("게시판 ) DB에 입력시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( stmt != null ) { try{ stmt.close(); } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
		
	}

	//--------------------------------------------
	//#####	 전체 레코드를 검색하는 함수
	// 리스트에 보여줄거나 필요한 컬럼 : 게시글번호, 그룹번호, 순서번호, 게시글등록일시, 조회수, 작성자이름,  제목
	//							( 내용, 비밀번호  제외 )
	// 순서번호(sequence_no)로 역순정렬
	public List<BoardRec> selectList() throws BoardException
	{
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<BoardRec> mList = new ArrayList<BoardRec>();
		boolean isEmpty = true;
		
		try{
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			String sql = "SELECT * FROM article ORDER BY sequence_no desc";
			
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				isEmpty = false;
				
				BoardRec rec = new BoardRec();
				
				rec.setArticleId(rs.getInt("article_Id"));
				rec.setGroupId(rs.getInt("group_id"));
				rec.setSequenceNo(rs.getString("sequence_no"));
				rec.setPostingDate(rs.getString("posting_date"));
				rec.setReadCount(rs.getInt("read_count"));
				rec.setWriterName(rs.getString("writer_name"));
				rec.setPassword(rs.getString("password"));
				rec.setTitle(rs.getString("title"));		
				
				mList.add(rec);
				
			}
			
			if( isEmpty ) return Collections.emptyList();
			
			return mList;
		}catch( Exception ex ){
			throw new BoardException("게시판 ) DB에 목록 검색시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}		
	}
	
	//--------------------------------------------
	//#####	 게시글번호에 의한 레코드 검색하는 함수
	public BoardRec selectById(int id) throws BoardException
	{
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		BoardRec rec = new BoardRec();
		
		try{
			
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			String sql = "SELECT * FROM article WHERE article_id = ?";
			
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				rec.setArticleId(rs.getInt("article_Id"));
				rec.setGroupId(rs.getInt("group_id"));
				rec.setSequenceNo(rs.getString("sequence_no"));
				rec.setPostingDate(rs.getString("posting_date"));
				rec.setReadCount(rs.getInt("read_count"));
				rec.setWriterName(rs.getString("writer_name"));
				rec.setPassword(rs.getString("password"));
				rec.setTitle(rs.getString("title"));
				rec.setContent(rs.getString("content"));	
				
			}
			
			return rec;
		}catch( Exception ex ){
			throw new BoardException("게시판 ) DB에 글번호에 의한 레코드 검색시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}		
	}

	//--------------------------------------------
	//#####	 게시글 보여줄 때 조회수 1 증가
	public void increaseReadCount( String article_id ) throws BoardException
	{

		PreparedStatement ps = null;
		try{
			con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
			
			String sql = "UPDATE article SET read_count = read_count+1 WHERE article_Id = ?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, article_id);
			
			ps.executeUpdate();
		
		}catch( Exception ex ){
			throw new BoardException("게시판 ) 게시글 볼 때 조회수 증가시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
		
	}
	//--------------------------------------------
	//#####	 게시글 수정할 때
	//		( 게시글번호와 패스워드에 의해 수정 )
	public int update( BoardRec rec ) throws BoardException
	{

		PreparedStatement ps = null;
		try{
			
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			String sql = "UPDATE article  "
					+ "  SET title = ?, content = ? "
					+ "  WHERE article_Id = ? AND password = ?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, rec.getTitle());
			ps.setString(2, rec.getContent());
			ps.setInt(3, rec.getArticleId());
			ps.setString(4, rec.getPassword());

			return ps.executeUpdate(); // 나중에 수정된 수를 리턴하시오.
		
		}catch( Exception ex ){
			throw new BoardException("게시판 ) 게시글 수정시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
		
	}
	
	
	//--------------------------------------------
	//#####	 게시글 삭제할 때
	//		( 게시글번호와 패스워드에 의해 삭제 )
	public int delete( int article_id, String password ) throws BoardException
	{

		PreparedStatement ps = null;
		try{
			
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			String sql = "DELETE FROM article WHERE article_id = ? and password = ?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, article_id);
			ps.setString(2, password);

			return ps.executeUpdate(); // 나중에 수정된 수를 리턴하시오.
		
		}catch( Exception ex ){
			throw new BoardException("게시판 ) 게시글 수정시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
		
	}
	
	
	//----------------------------------------------------
	//#####  부모레코드의 자식레코드 중 마지막 레코드의 순서번호를 검색
	//       ( 제일 작은 번호값이 마지막값임)
	public String selectLastSequenceNumber( String maxSeqNum, String minSeqNum ) throws BoardException
	{
		PreparedStatement ps = null;
		ResultSet rs = null;

		try{
			con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );
			String sql		= "SELECT min(sequence_no) as minseq FROM article WHERE sequence_no < ? AND sequence_no >= ?";  
			ps		= con.prepareStatement( sql );
			ps.setString(1, maxSeqNum);
			ps.setString(2, minSeqNum);
			rs = ps.executeQuery();
			if( !rs.next())
			{				
				return null;
			}
			
			return rs.getString("minseq");
		}catch( Exception ex ){
			throw new BoardException("게시판 ) 부모와 연관된 자식 레코드 중 마지막 순서번호 얻어오기  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}			
	}
}