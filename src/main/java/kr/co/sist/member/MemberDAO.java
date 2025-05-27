package kr.co.sist.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import kr.co.sist.dao.DbConnection;

public class MemberDAO {
	private static MemberDAO mDAO;
	private Context ctx;
	private MemberDAO() {

	}

	public static MemberDAO getInstance() {
		if (mDAO == null) {
			mDAO = new MemberDAO();
		}

		return mDAO;
	}// getInstance

	/**
	 * 입력 받은 아이디를 검색하는 
	 * @param id 검색할 아이디
	 * @return 검색된 아이디
	 * @throws SQLException
	 */
	public boolean selectId(String id) throws SQLException {
		 boolean flag = false;
		
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
			StringBuilder selectIdQUery = new StringBuilder();
			selectIdQUery
			.append(" select id   ")
			.append(" from web_member   ")
			.append(" where id=?   ");
			
			pstmt=conn.prepareStatement(selectIdQUery.toString());
		//5. 바인드변수에 값 할당
			pstmt.setString(1, id);
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			flag=rs.next(); //검색 결과가 있으면 true 없으면 false
		}finally {
		//7. 연결 끊기
			dbConn.dbClose(rs, pstmt, conn);
		}
		return flag;
	}// selectId

	public void insertMember(MemberDTO mDTO) throws SQLException {
		DbConnection dbConn = DbConnection.getInstance();
		
		PreparedStatement pstmt = null;
		Connection conn=null;
		try {
		//1. JNDI 사용객체 생성
		//2. DBCP에서 연결 객체 얻기(DataSource)
		//3. Connection얻기
			conn=dbConn.getDbConn();
		//4. 쿼리문 생성객체 얻기
			StringBuilder insertWebMember = new StringBuilder();
			insertWebMember
			.append(" insert into web_member ")
			.append(" (ID, PASS, NAME, BIRTH, TEL, EMAIL, GENDER, ZIPCODE, ADDR, ADDR2, INTRO, IP)   ")
			.append(" values(?,?,?,?,?,?,?,?,?,?,?,?)  ");
			
			pstmt=conn.prepareStatement(insertWebMember.toString());
		//5. 바인드변수에 값 할당
			pstmt.setString(1, mDTO.getId());
			pstmt.setString(2, mDTO.getPass());
			pstmt.setString(3, mDTO.getName());
			pstmt.setString(4, mDTO.getBirth());
			pstmt.setString(5, mDTO.getTel());
			pstmt.setString(6, mDTO.getUseEmail());
			pstmt.setString(7, mDTO.getGender());
			pstmt.setString(8, mDTO.getZipcode());
			pstmt.setString(9, mDTO.getAddr());
			pstmt.setString(10, mDTO.getAddr2());
			pstmt.setString(11, mDTO.getIntro());
			pstmt.setString(12, mDTO.getIp());
			
			pstmt.executeUpdate();
		//6. 쿼리문 수행 후 결과 얻기
		}finally {
		//7. 연결 끊기
			dbConn.dbClose(null, pstmt, conn);
		}
	}// insertMember
	
	public List<MemberDTO> selectAllMember()throws SQLException{
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		DbConnection dbConn = DbConnection.getInstance();
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			//1. JNDI 사용객체 생성
			//2. DBCP에서 연결 객체 얻기(DataSource)
			//3. Connection얻기
				conn=dbConn.getDbConn();
			//4. 쿼리문 생성객체 얻기
				StringBuilder selectIdQUery = new StringBuilder();
				selectIdQUery
				.append(" select id, name, birth, tel, email, gender, zipcode, addr, addr2, intro, ip, input_date")
				.append(" from web_member   ");
				
				pstmt=conn.prepareStatement(selectIdQUery.toString());
			//5. 바인드변수에 값 할당
			//6. 쿼리문 수행 후 결과 얻기
				rs=pstmt.executeQuery();
				
				MemberDTO mDTO = null;
				while(rs.next()) {
					mDTO = new MemberDTO();
					mDTO.setId(rs.getString("id"));
					mDTO.setName(rs.getString("name"));
					mDTO.setBirth(rs.getString("birth"));
					mDTO.setTel(rs.getString("tel"));
					mDTO.setUseEmail(rs.getString("email"));
					mDTO.setGender(rs.getString("gender"));
					mDTO.setInput_date(rs.getDate("input_date"));
					
					list.add(mDTO);
				}

			}finally {
			//7. 연결 끊기
				dbConn.dbClose(rs, pstmt, conn);
			}
		
		
		
		return list;
	}
	
	public MemberDTO selectOneMember(String id)throws SQLException{
		MemberDTO mDTO = null;
		DbConnection dbConn = DbConnection.getInstance();
		ResultSet rs = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			//1. JNDI 사용객체 생성
			//2. DBCP에서 연결 객체 얻기(DataSource)
			//3. Connection얻기
				conn=dbConn.getDbConn();
			//4. 쿼리문 생성객체 얻기
				StringBuilder selectIdQUery = new StringBuilder();
				selectIdQUery
				.append(" select name, birth, tel, gender, ip, input_date, profile_img")
				.append(" from web_member   ")
				.append(" where id = ?");
				
				pstmt=conn.prepareStatement(selectIdQUery.toString());
			//5. 바인드변수에 값 할당
				pstmt.setString(1, id);
			//6. 쿼리문 수행 후 결과 얻기
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					mDTO = new MemberDTO();
					mDTO.setName(rs.getString("name"));
					mDTO.setBirth(rs.getString("birth"));
					mDTO.setTel(rs.getString("tel"));
					mDTO.setGender(rs.getString("gender"));
					mDTO.setIp(rs.getString("ip"));
					mDTO.setInput_date(rs.getDate("input_date"));
					mDTO.setProfile_img(rs.getString("profile_img"));
					
				}

			}finally {
			//7. 연결 끊기
				dbConn.dbClose(rs, pstmt, conn);
			}
		
		
		
		return mDTO;
	}
	
	
	
	
}
