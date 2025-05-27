package day0516;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class EmpService {
	
	public String searchEmp(int deptno) {
		String strJSON="";
		List<EmpDTO> list = null;
		
		EmpDAO eDAO = EmpDAO.getInstance();
		try {
			list=eDAO.selectAllDept(deptno);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			//1. JSONOBJ 생성
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("resultFlag", !list.isEmpty());//검색 정보가 존재
			jsonObj.put("putDate", sdf.format(new Date()));
			jsonObj.put("dataLength", list.size());
			
			//2. 데이터 채우기
			//JsonArray 생성
			JSONArray jsonArr = new JSONArray();
			
			JSONObject jsonTemp=null;
			for(EmpDTO eDTO : list) {
				//DB에서 검색된 데이터로 JSONobject을 생성하여 JSONArray에 할당
				jsonTemp = new JSONObject();
				jsonTemp.put("empno", eDTO.getEmpno());
				jsonTemp.put("ename", eDTO.getEname());
				jsonTemp.put("job", eDTO.getJob());
				//날짜를 그대로 출력JSONobject에 할당하면 사용하는 곳에서 error 발생
				//jsonTemp.put("hiredate", eDTO.getHireDate()); error
				jsonTemp.put("hiredate", sdf.format(eDTO.getHireDate())); //날짜 -> 문자열로 바꿔줘야 error안남
			
				
				jsonTemp.put("sal", eDTO.getSal());
				
				
				jsonArr.add(jsonTemp);
			}//end for
			//JSONarray를 JSONobject에 할당
			jsonObj.put("data", jsonArr);
			
			strJSON=jsonObj.toJSONString();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}//end catch
		
		
		return strJSON;
		
	}//jsonObj
}
