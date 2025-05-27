package kr.co.sist.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kr.co.sist.dao.DbConnection;

public class MyPageDAO {
	private static MyPageDAO mpDAO;
	
	private MyPageDAO() {
		
	}
	
	public static MyPageDAO getInstance() {
		if(mpDAO == null) {
			mpDAO = new MyPageDAO();
		}
		return mpDAO;
	}
	
	public void updateMember(MyPageDTO mpDTO) throws SQLException {
		DbConnection dbConn = DbConnection.getInstance();
		
		PreparedStatement pstmt = null;
		Connection conn=null;
		try {
		//1. JNDI 사용객체 생성
		//2. DBCP에서 연결 객체 얻기(DataSource)
		//3. Connection얻기
			conn=dbConn.getDbConn();
		//4. 쿼리문 생성객체 얻기
			StringBuilder updateWebMember = new StringBuilder();
			updateWebMember
			.append(" update web_member set ")
			.append(" BIRTH=?, TEL=?, profile_img=?  ")
			.append(" where id= ?  ");
			
			pstmt=conn.prepareStatement(updateWebMember.toString());
		//5. 바인드변수에 값 할당
			pstmt.setString(1, mpDTO.getBirth());
			pstmt.setString(2, mpDTO.getTel());
			pstmt.setString(3, mpDTO.getImgName());
			pstmt.setString(4, mpDTO.getId());
			
			pstmt.executeUpdate();
		//6. 쿼리문 수행 후 결과 얻기
		}finally {
		//7. 연결 끊기
			dbConn.dbClose(null, pstmt, conn);
		}
	}// insertMember
}
