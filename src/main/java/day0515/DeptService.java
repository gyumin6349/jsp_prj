package day0515;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class DeptService {
	public List<Dept> searchAllDept(){
		List<Dept> list = null;
		
		DeptDAO dDAO = DeptDAO.getInstance();
		try {
			list=dDAO.selectAllDept();
			//list = new ArrayList<Dept>(); //조회된 결과가 없음
		}catch(SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}
	
	public String jsonObj() {
		String strJSON="";
		List<Dept> list = null;
		
		DeptDAO dDAO = DeptDAO.getInstance();
		try {
			list=dDAO.selectAllDept();
			
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
			for(Dept deptDTO : list) {
				//DB에서 검색된 데이터로 JSONobject을 생성하여 JSONArray에 할당
				jsonTemp = new JSONObject();
				jsonTemp.put("deptno", deptDTO.getDeptno());
				jsonTemp.put("dname", deptDTO.getDname());
				jsonTemp.put("loc", deptDTO.getLoc());
				
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
