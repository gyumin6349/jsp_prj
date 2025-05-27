package kr.co.sist.place;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.board.BoardDTO;
import kr.co.sist.dao.DbConnection;

public class PlaceDAO {
	private static PlaceDAO pDAO;
	private PlaceDAO() {
		
	}
	
	public static PlaceDAO getInstance() {
		if(pDAO == null) {
			pDAO = new PlaceDAO();
		}//if
		return pDAO;
	}//getInstance
	
	public void insertRestaurant(RestDTO rDTO)throws SQLException{
		DbConnection dbConn = DbConnection.getInstance();
		
		PreparedStatement pstmt = null;
		Connection conn=null;
		try {
		//1. JNDI 사용객체 생성
		//2. DBCP에서 연결 객체 얻기(DataSource)
		//3. Connection얻기
			conn=dbConn.getDbConn();
		//4. 쿼리문 생성객체 얻기
			StringBuilder insertRest = new StringBuilder();
			insertRest
			.append(" insert into restaurant ")
			.append(" (rest_num, restaurant, menu, price, info, lat, lng, ip, id)   ")
			.append(" values(seq_rest.nextval, ?,?,?,?,?,?,?,?)  ");
							
			
			pstmt=conn.prepareStatement(insertRest.toString());
		//5. 바인드변수에 값 할당
			pstmt.setString(1, rDTO.getRestaurant());
			pstmt.setString(2, rDTO.getMenu());
			pstmt.setInt(3, rDTO.getPrice());
			pstmt.setString(4, rDTO.getInfo());
			pstmt.setDouble(5, rDTO.getLat());
			pstmt.setDouble(6, rDTO.getLng());
			pstmt.setString(7, rDTO.getIp());
			pstmt.setString(8, rDTO.getId());
			
			
			pstmt.executeUpdate();
		//6. 쿼리문 수행 후 결과 얻기
		}finally {
		//7. 연결 끊기
			dbConn.dbClose(null, pstmt, conn);
		}
	}// insertMember
	
	public int selectTotalCount(PlaceDTO pDTO) throws SQLException {
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
			StringBuilder selectCount = new StringBuilder();
			selectCount
			.append(" select count(rest_num) cnt   ")
			.append(" from restaurant   ");
			
			//검색키워드가 존재
			if(pDTO.getKeyword() != null && !"".equals(pDTO.getKeyword())) {
				selectCount.append(" where instr(").append(pDTO.getFieldName())
				.append(" , ? ) != 0 ");
			}
			
//			System.out.println(selectIdQUery);
			pstmt=conn.prepareStatement(selectCount.toString());
		//5. 바인드변수에 값 할당
			if(pDTO.getKeyword() != null && !"".equals(pDTO.getKeyword())) {
			pstmt.setString(1, pDTO.getKeyword());
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
	
	public List<RestDTO> selectRestaurant(PlaceDTO pDTO)throws SQLException{
		List<RestDTO> list = new ArrayList<RestDTO>();
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
				.append(" select rest_num, restaurant, menu, input_date, id from ")
				.append(" (select rest_num, restaurant, menu, input_date, id, row_number() over(order by input_date desc) rnum   ")
				.append(" from restaurant   ");
				
				if(pDTO.getKeyword() != null && !"".equals(pDTO.getKeyword())) {
					selectBoard.append(" where instr(").append(pDTO.getFieldName())
					.append(", ?) != 0 ");
				}//end if
				
				selectBoard.append(" ) where rnum between ? and ? ");
				
				pstmt=conn.prepareStatement(selectBoard.toString());
			
				//5. 바인드변수에 값 할당
				int bindInd=1;
				
				if(pDTO.getKeyword() != null && !"".equals(pDTO.getKeyword())) {
					pstmt.setString(bindInd++, pDTO.getKeyword());
				}//end if
				pstmt.setInt(bindInd++, pDTO.getStartNum());
				pstmt.setInt(bindInd++, pDTO.getEndNum());
				
				//6. 쿼리문 수행 후 결과 얻기
				rs=pstmt.executeQuery();
//				System.out.println(selectBoard);
				RestDTO rDTO = null;
				while(rs.next()) {
					rDTO = new RestDTO();
					rDTO.setRest_num(rs.getInt("rest_num"));
					rDTO.setRestaurant(rs.getString("restaurant"));
					rDTO.setMenu(rs.getString("menu"));
					rDTO.setInput_date(rs.getDate("input_date"));
					rDTO.setId(rs.getString("id"));
					
					list.add(rDTO);
				}

			}finally {
			//7. 연결 끊기
				dbConn.dbClose(rs, pstmt, conn);
			}
		
		
		
		return list;
	}//selectRestaurant
	
	public RestDTO selectOneRest(int rest_num)throws SQLException{
		RestDTO rDTO= null;
		
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
			StringBuilder selectOneRest = new StringBuilder();
			selectOneRest
			.append(" select restaurant, menu, price, info, id, input_date, ip, lat, lng ")
			.append(" from restaurant   ")
			.append(" where rest_num=?  ");
			
			pstmt=conn.prepareStatement(selectOneRest.toString());
		//5. 바인드변수에 값 할당
			pstmt.setInt(1, rest_num);
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) { //검색 결과가 있으면 true 없으면 false
				rDTO = new RestDTO();
				rDTO.setRestaurant(rs.getString("restaurant"));
				rDTO.setMenu(rs.getString("menu"));
				rDTO.setPrice(rs.getInt("price"));
				rDTO.setId(rs.getString("id"));
				rDTO.setInfo(rs.getString("info"));
				rDTO.setInput_date(rs.getDate("input_date"));
				rDTO.setIp(rs.getString("ip"));
				rDTO.setLat(rs.getDouble("lat"));
				rDTO.setLng(rs.getDouble("lng"));

				//bDTO.setContent(rs.getString("content"));
				//CLOB은 긴 문자열을 저장함으로 별도의 Stream을 연결하여 값을 읽어들임
			}//end if
			
		}finally {
		//7. 연결 끊기
			dbConn.dbClose(rs, pstmt, conn);
		}

		return rDTO;
	}//selectOneRest
	
	
}	
