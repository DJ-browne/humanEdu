package member.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//Data Access Object : 데이터베이스와 접근하기 위한 객체
public class MemberDao {

	
	// DB 연결시  관한 변수 
	private static final String 	dbDriver	=	"oracle.jdbc.driver.OracleDriver";
	private static final String		dbUrl		=	"jdbc:oracle:thin:@127.0.0.1:1521:orcl";
	private static final String		dbUser		=	"seung";
	private static final String		dbPass		=	"1234";

		
	private static MemberDao memberDao;
	
	public static MemberDao getInstance() throws MemberException
	{
		if( memberDao == null )
		{
			memberDao =  new MemberDao();
		}
		return memberDao;
	}
	

	private MemberDao() throws MemberException
	{
			
		try{
			
			/********************************************
				1. 드라이버를 로딩
							
			*/
			Class.forName(dbDriver);
		}catch( Exception ex ){
			throw new MemberException("DB 연결시 오류  : " + ex.toString() );	
		}
	}
	
	/*******************************************
	 * * 회원관리테이블 MEMBERTEST 에  회원정보를 입력하는 함수
	 * @param rec
	 * @throws MemberException
	 */
	public void insertMember( Member rec ) throws MemberException
	{	
		// Member rec = mm;
		System.out.println("***** insertMember 진입 *****");
		try {
			 // 0. 연결 객체 얻어오기	
			Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			 // 1. sql 문장 만들기 ( insert문 )
			String sql = "INSERT INTO memberTest(id, password, name, tel, addr ) "
					+ "     VALUES ( ?, ?, ?, ?, ? )";
			 // 2. sql 전송 객체 만들기
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, rec.getId() );
			ps.setString(2, rec.getPassword() );
			ps.setString(3, rec.getName() );
			ps.setString(4, rec.getTel() );
			ps.setString(5, rec.getAddr() );
			
			 // 3. sql 전송
			ps.executeUpdate();
			
			 // 4. 객체 닫기
			ps.close();
			conn.close();
			 
		} catch ( Exception ex ){
			throw new MemberException("멤버 입력시 오류  : " + ex.toString() );			
		}			
	}
	
	/**********************************************************
	 * * 회원관리테이블 MEMBERTEST에서 기존의 id값과 중복되는지 확인하는 함수
	 */
	public boolean isDuplicatedId( String id ) throws MemberException
	{	
		//  String id = id ;
		System.out.println("***** isDuplicatedId 진입 *****");
		boolean flag = false;
		
		try{

			// 0. 연결 객체 얻어오기	
			Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			
			// 1. sql 문장 만들기
			String sql = "SELECT * FROM memberTest WHERE id = ?";
			
			// 2. sql 전송 객체 만들기
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			
			// 3. sql 전송 > 리턴값(ResultSet) 반환
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				flag = true;
			}
			
		}catch( Exception ex ){
			throw new MemberException("중복아이디 검사시 오류  : " + ex.toString() );			
		}
			
		return flag;
	}
}
