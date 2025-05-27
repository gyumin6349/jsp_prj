package kr.co.sist.member.login;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.sist.cipher.DataDecryption;
import kr.co.sist.cipher.DataEncryption;

public class LoginService {

	public boolean loginProcess(LoginDTO lDTO, HttpSession session) {
		boolean flag = false;
		
		LoginDAO lDAO = LoginDAO.getInstance();
		try {
			//비밀번호를 일방향 Hash
			
			lDTO.setPass(DataEncryption.messageDigest("SHA-256", lDTO.getPass()));
			LoginResultDTO lrDTO = lDAO.selectLogin(lDTO);
			flag = lrDTO!=null; //검색결과있을땐 true
			if(flag){//로그인 성공
				//이름은 암호화상태
				//이메일 복호화
				String key = "abcdef0123456789";
				DataDecryption dd = new DataDecryption(key);
				try {
					lrDTO.setEmail(dd.decrypt(lrDTO.getEmail()));
					lrDTO.setName(dd.decrypt(lrDTO.getName()));
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				//세션에 로그인한 결과 할당
				session.setAttribute("userData", lrDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(NoSuchAlgorithmException nae ){
			nae.printStackTrace();	//end catch
		}
		  
		
		
		
		
		return flag;
	}//loginProcess
}//class
