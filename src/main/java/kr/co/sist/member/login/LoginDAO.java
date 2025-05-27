package kr.co.sist.member.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConnection;

public class LoginDAO {
	
	private static LoginDAO lDAO;
	
	private LoginDAO() {
		
	}
	
	public static LoginDAO getInstance() {
		if(lDAO == null) {
			lDAO = new LoginDAO();
		}
		
		return lDAO;
	}
	
	
	public LoginResultDTO selectLogin(LoginDTO lDTO) throws SQLException {
		LoginResultDTO lrDTO = null;
		
		DbConnection dbConn = DbConnection.getInstance();
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection conn=null;
		try {
		//1. JNDI 사용객체 생성
		//2. DBCP에서 연결 객체 얻기(DataSource)
		//3. Connection얻기
			conn=dbConn.getDbConn();
		//4. 쿼리문 생성객체 얻기
			StringBuilder selectLoginInfo = new StringBuilder();
			selectLoginInfo
			.append(" select name, email   ")
			.append(" from web_member   ")
			.append(" where id=? and pass=?   ");
			
			pstmt=conn.prepareStatement(selectLoginInfo.toString());
		//5. 바인드변수에 값 할당
			pstmt.setString(1, lDTO.getId());
			pstmt.setString(2, lDTO.getPass());
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {
				lrDTO = new LoginResultDTO(); 
				lrDTO.setId(lDTO.getId());//파라미터로 입력된 아이디 사용.
				lrDTO.setName(rs.getString("name")); //암호화된 데이터
				lrDTO.setEmail(rs.getString("email")); //암호화된 데이터
				
			}//검색결과가 있으면 lrDTO객체에 값 생성
			
			
			//검색 결과가 있으면 true 없으면 false
		}finally {
		//7. 연결 끊기
			dbConn.dbClose(rs, pstmt, conn);
		}
		return lrDTO;
	}// selectId
}
