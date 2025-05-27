package kr.co.sist.member;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import kr.co.sist.cipher.DataDecryption;
import kr.co.sist.cipher.DataEncryption;
import kr.co.sist.member.login.LoginResultDTO;

public class MyPageService {
	public boolean modifyMember(MyPageDTO mpDTO, HttpSession session) {
		boolean flag = false;
		MyPageDAO mpDAO = MyPageDAO.getInstance();
		try {
			//세션에서 아이디를 꺼내와서 DTO에 설정
			
			mpDTO.setId(((LoginResultDTO)session.getAttribute("userData")).getId());
			String key="abcdef0123456789";
			DataEncryption de = new DataEncryption(key);
			System.out.println(mpDTO);
			//이미지를 선택하지 않았을 때
			if(mpDTO.getImgName().isEmpty()) {
				mpDTO.setImgName("default.jpg");
			}//end if
			try {
				mpDTO.setTel(de.encrypt(mpDTO.getTel()));
			} catch (Exception e) {
				e.printStackTrace();
			}
			mpDAO.updateMember(mpDTO);
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
}
