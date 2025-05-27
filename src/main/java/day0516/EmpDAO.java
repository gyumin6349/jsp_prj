package day0516;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import kr.co.sist.dao.DbConnection;

public class EmpDAO {

	private static EmpDAO dDAO;
	private EmpDAO() {
		
	}//DeptDAO()
	
	public static EmpDAO getInstance() {
		if(dDAO == null) {
			dDAO = new EmpDAO();
		}
		
		return dDAO;
	}//DeptDAO
	
	public List<EmpDTO> selectAllDept(int deptno) throws SQLException{
		List<EmpDTO> list = new ArrayList<EmpDTO>();
		
		DbConnection dbCon = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//1. JNDI 사용 객체 생성
		
		 
		//2. DBCP에서 DateSOurce 얻기
		//3. Connection 얻기
		con = dbCon.getDbConn();
		//4. 쿼리문 생성객체 얻기
		String selectAllDept="select empno, ename, job, hiredate, sal from emp where deptno= ? ";
		//5. 바인드변수에 값할당
		pstmt=con.prepareStatement(selectAllDept);
		pstmt.setInt(1, deptno);
		//6. 쿼리문 수행 후 결과얻기
		rs=pstmt.executeQuery();
		
		EmpDTO eDTO = null;
		while(rs.next()) {
			eDTO=new EmpDTO();
			eDTO.setEmpno(rs.getInt("empno"));
			eDTO.setEname(rs.getString("ename"));
			eDTO.setJob(rs.getString("job"));
			eDTO.setHireDate(rs.getDate("hiredate"));
			eDTO.setSal(rs.getInt("sal"));
			list.add(eDTO);
		}
		}finally {
		//7. 연결끊기
		dbCon.dbClose(rs, pstmt, con);
		}
		
		return list;
	}
}
