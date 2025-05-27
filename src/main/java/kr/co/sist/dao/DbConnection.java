package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbConnection {
	private static DbConnection dbCon;
	private static Context ctx;
	private DbConnection() {
		
	}
	
	public static DbConnection getInstance() {
		if(dbCon == null) {
			dbCon = new DbConnection();
			try {
				//1. JNDI 사용 객체 생성
				ctx = new InitialContext();
			} catch (NamingException e) {
				e.printStackTrace();
			}
		}//end of
		
		return dbCon;
	}//getInstance
	
	public Connection getDbConn() {
		Connection con = null;
		//2. 이름으로(JNDI) DBCP에서 DB를 연결하고 있는 객체(DataSource)를 얻는다.
		try {
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/dbcp");
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch(SQLException se) {
			se.printStackTrace();
		}//end if
		
		return con;
	}//getDbcon
	
	public void dbClose(ResultSet rs, Statement stmt, Connection conn) throws SQLException{
		try {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
		}finally {
			if(conn!=null) {conn.close();}
		}//end if
	}
	
}
