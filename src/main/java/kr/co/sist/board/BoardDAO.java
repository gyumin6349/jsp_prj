package kr.co.sist.board;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.member.MemberDTO;

public class BoardDAO {
	private static BoardDAO bDAO;
	
	private BoardDAO() {
		
	}//boardDAO
	
	public static BoardDAO getInstance() {
		if(bDAO == null) {
			bDAO = new BoardDAO();
		}
		
		return bDAO;
	}//getInstance

	public int selectTotalCount(RangeDTO rDTO) throws SQLException {
		int cnt = 0;
		
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
			.append(" select count(num) cnt   ")
			.append(" from board   ");
			
			//검색키워드가 존재
			if(rDTO.getKeyword() != null && !"".equals(rDTO.getKeyword())) {
				selectIdQUery.append(" where instr(").append(rDTO.getFieldName())
				.append(" , ? ) != 0 ");
			}
			
//			System.out.println(selectIdQUery);
			pstmt=conn.prepareStatement(selectIdQUery.toString());
		//5. 바인드변수에 값 할당
			if(rDTO.getKeyword() != null && !"".equals(rDTO.getKeyword())) {
			pstmt.setString(1, rDTO.getKeyword());
			}
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) { //검색 결과가 있으면 true 없으면 false
				cnt = rs.getInt("cnt");
			}
		}finally {
		//7. 연결 끊기
			dbConn.dbClose(rs, pstmt, conn);
		}
		return cnt;
	}// selectId
	
	
	/**
	 * 시작번호와 끝번호 사이에 있는 레코드를 얻는 일을 한다.
	 * @param rDTO
	 * @return
	 * @throws SQLException
	 */
	public List<BoardDTO> selectBoard(RangeDTO rDTO)throws SQLException{
		List<BoardDTO> list = new ArrayList<BoardDTO>();
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
				StringBuilder selectBoard = new StringBuilder();
				selectBoard
				.append(" select num, subject, id, input_date, cnt from ")
				.append(" (select num, subject, id, input_date, cnt, row_number() over(order by input_date desc) rnum   ")
				.append(" from board   ");
				
				if(rDTO.getKeyword() != null && !"".equals(rDTO.getKeyword())) {
					selectBoard.append(" where instr(").append(rDTO.getFieldName())
					.append(", ?) != 0 ");
				}
				
				selectBoard.append(" ) where rnum between ? and ? ");
				
				pstmt=conn.prepareStatement(selectBoard.toString());
			
				//5. 바인드변수에 값 할당
				int bindInd=1;
				
				if(rDTO.getKeyword() != null && !"".equals(rDTO.getKeyword())) {
					pstmt.setString(bindInd++, rDTO.getKeyword());
				}//end if
				pstmt.setInt(bindInd++, rDTO.getStartNum());
				pstmt.setInt(bindInd++, rDTO.getEndNum());
				
				//6. 쿼리문 수행 후 결과 얻기
				rs=pstmt.executeQuery();
//				System.out.println(selectBoard);
				BoardDTO bDTO = null;
				while(rs.next()) {
					bDTO = new BoardDTO();
					bDTO.setNum(rs.getInt("num"));
					bDTO.setSubject(rs.getString("subject"));
					bDTO.setId(rs.getString("id"));
					bDTO.setInput_date(rs.getDate("input_date"));
					bDTO.setCnt(rs.getInt("cnt"));
					
					list.add(bDTO);
				}

			}finally {
			//7. 연결 끊기
				dbConn.dbClose(rs, pstmt, conn);
			}
		
		
		
		return list;
	}
	
	/**
	 * 게시글 추가하는 일 
	 * @param bDTO
	 * @throws SQLException
	 */
	public void insertBoard(BoardDTO bDTO)throws SQLException{
			DbConnection dbConn = DbConnection.getInstance();
			
			PreparedStatement pstmt = null;
			Connection conn=null;
			try {
			//1. JNDI 사용객체 생성
			//2. DBCP에서 연결 객체 얻기(DataSource)
			//3. Connection얻기
				conn=dbConn.getDbConn();
			//4. 쿼리문 생성객체 얻기
				StringBuilder insertBoard = new StringBuilder();
				insertBoard
				.append(" insert into board ")
				.append(" (num, subject, content, id, ip)   ")
				.append(" values(seq_board.nextval, ?,?,?,?)  ");
								
				
				pstmt=conn.prepareStatement(insertBoard.toString());
			//5. 바인드변수에 값 할당
				pstmt.setString(1, bDTO.getSubject());
				pstmt.setString(2, bDTO.getContent());
				pstmt.setString(3, bDTO.getId());
				pstmt.setString(4, bDTO.getIp());
				
				
				pstmt.executeUpdate();
			//6. 쿼리문 수행 후 결과 얻기
			}finally {
			//7. 연결 끊기
				dbConn.dbClose(null, pstmt, conn);
			}
		}// insertMember
	
		public BoardDTO selectOneBoard(int num)throws SQLException{
			BoardDTO bDTO = null;
			
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
				StringBuilder selectOneBoard = new StringBuilder();
				selectOneBoard
				.append(" select subject, content, id, input_date, ip, cnt  ")
				.append(" from board   ")
				.append(" where num=?  ");
				
				pstmt=conn.prepareStatement(selectOneBoard.toString());
			//5. 바인드변수에 값 할당
				pstmt.setInt(1, num);
			//6. 쿼리문 수행 후 결과 얻기
				rs=pstmt.executeQuery();
				if(rs.next()) { //검색 결과가 있으면 true 없으면 false
					bDTO = new BoardDTO();
					bDTO.setNum(num);
					bDTO.setSubject(rs.getString("subject"));
					bDTO.setId(rs.getString("id"));
					bDTO.setIp(rs.getString("ip"));
					bDTO.setInput_date(rs.getDate("input_date"));
					bDTO.setCnt(rs.getInt("cnt"));

					//bDTO.setContent(rs.getString("content"));
					//CLOB은 긴 문자열을 저장함으로 별도의 Stream을 연결하여 값을 읽어들임
					StringBuilder tempContent = new StringBuilder();
					String lineData = "";
					
					Clob clob = rs.getClob("content");
					if(clob!= null) {
					
					try(BufferedReader br= new BufferedReader(
							rs.getClob("content").getCharacterStream())) {
						
						while((lineData=br.readLine()) != null) {
							tempContent.append(lineData).append("\n");
						}
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						tempContent.append("글 내용 읽기 실패");
					}//end catch
					bDTO.setContent(tempContent.toString());
					
				}//end if
				}
			}finally {
			//7. 연결 끊기
				dbConn.dbClose(rs, pstmt, conn);
			}

			return bDTO;
		}//selectOneBoard

		/**
		 * 조회수 변경
		 * @param num
		 * @return
		 * @throws SQLException
		 */
		public int updateCnt(int num)throws SQLException{
			int rowCnt =0;
			BoardDTO bDTO = new BoardDTO();
			DbConnection dbConn = DbConnection.getInstance();
			
			PreparedStatement pstmt = null;
			Connection conn=null;
			try {
			//1. JNDI 사용객체 생성
			//2. DBCP에서 연결 객체 얻기(DataSource)
			//3. Connection얻기
				conn=dbConn.getDbConn();
			//4. 쿼리문 생성객체 얻기
				StringBuilder updateCnt = new StringBuilder();
				updateCnt
				.append(" update board ")
				.append(" set cnt=cnt+1 where num=?  ");
								
				
				pstmt=conn.prepareStatement(updateCnt.toString());
			//5. 바인드변수에 값 할당
				pstmt.setInt(1, num);
				
				
				rowCnt = pstmt.executeUpdate();
			//6. 쿼리문 수행 후 결과 얻기
			}finally {
			//7. 연결 끊기
				dbConn.dbClose(null, pstmt, conn);
			}
			
			return rowCnt;
		}//updateCnt
		
		public int deleteBoard(BoardDTO bDTO)throws SQLException{
			int rowCnt = 0;
			DbConnection dbConn = DbConnection.getInstance();
			
			PreparedStatement pstmt = null;
			Connection conn=null;
			try {
			//1. JNDI 사용객체 생성
			//2. DBCP에서 연결 객체 얻기(DataSource)
			//3. Connection얻기
				conn=dbConn.getDbConn();
			//4. 쿼리문 생성객체 얻기
				StringBuilder deleteBoard = new StringBuilder();
				deleteBoard
				.append(" delete from board ")
				.append(" where num=?  and id=?");
								
				
				pstmt=conn.prepareStatement(deleteBoard.toString());
			//5. 바인드변수에 값 할당
				pstmt.setInt(1, bDTO.getNum());
				pstmt.setString(2, bDTO.getId());
				
				
				rowCnt=pstmt.executeUpdate();
			//6. 쿼리문 수행 후 결과 얻기
			}finally {
			//7. 연결 끊기
				dbConn.dbClose(null, pstmt, conn);
			}
			return rowCnt;
		}//delete
		
		public int updateBoard(BoardDTO bDTO)throws SQLException{
			int rowCnt = 0;
			DbConnection dbConn = DbConnection.getInstance();
			
			PreparedStatement pstmt = null;
			Connection conn=null;
			try {
			//1. JNDI 사용객체 생성
			//2. DBCP에서 연결 객체 얻기(DataSource)
			//3. Connection얻기
				conn=dbConn.getDbConn();
			//4. 쿼리문 생성객체 얻기
				StringBuilder updateBoard = new StringBuilder();
				updateBoard
				.append(" update board set content=? ")
				.append(" where num=?  and id=?");
								
				
				pstmt=conn.prepareStatement(updateBoard.toString());
			//5. 바인드변수에 값 할당
				pstmt.setString(1, bDTO.getContent());
				pstmt.setInt(2, bDTO.getNum());
				pstmt.setString(3, bDTO.getId());
				
				
				rowCnt=pstmt.executeUpdate();
			//6. 쿼리문 수행 후 결과 얻기
			}finally {
			//7. 연결 끊기
				dbConn.dbClose(null, pstmt, conn);
			}
			return rowCnt;
		}//delete
}
