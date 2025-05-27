<%@page import="day0515.Dept"%>
<%@page import="java.util.List"%>
<%@page import="day0515.DeptService"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%
DeptService ds = new DeptService();

List<Dept> list = ds.searchAllDept();

// 1. JSONArray 생성. [ ]
JSONArray jsonArr = new JSONArray(); // 자바의 List 기반
JSONObject jsonTemp = null;
for (Dept deptDto : list) {
// 2. data를 사용하여 JSONObject 생성
	jsonTemp = new JSONObject();
	jsonTemp.put("deptno", deptDto.getDeptno());
	jsonTemp.put("dname", deptDto.getDname());
	jsonTemp.put("loc", deptDto.getLoc());
	
// 3. JSONObject를 JSONArr 배치
	jsonArr.add(jsonTemp);
} // end for

// 4. JSONArray값을 출력
String strJSON = jsonArr.toJSONString();
%>
<%= strJSON %>
