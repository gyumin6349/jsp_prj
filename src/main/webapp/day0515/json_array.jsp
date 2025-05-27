<%@page import="day0515.Dept"%>
<%@page import="java.util.List"%>
<%@page import="day0515.DeptService"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" info=""%>
<%

DeptService ds = new DeptService();

List<Dept> list = ds.searchAllDept();
	//1. jsonarray 생성)
	//list 기반 
	JSONArray jsonArr = new JSONArray();//list
	
	JSONObject jsonTemp=null;
	for(Dept deptDTO : list){
	//2. data를 사용하여 JSONObject 생성
		jsonTemp = new JSONObject();
		jsonTemp.put("deptno", deptDTO.getDeptno());
		jsonTemp.put("dname", deptDTO.getDname());
		jsonTemp.put("loc", deptDTO.getLoc());
	//3. jsonobject을 jsonarry배치
		jsonArr.add(jsonTemp);	
	
	}
	
	
		
	//4. Jsonarray 값 출력
	String strJSON = jsonArr.toJSONString();
%>
<%= strJSON %>