<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" info=""%>
<%
	String name = "이장훈";
	int age = 25;
	
	//1. JSONobject 생성 : Map 기반
	JSONObject json = new JSONObject();
	
	//2. 값 할당 - 입력 한 값은 순서대로 추가되지 않는다.
	//map 기반이라 put(키, 밸류) 메서드 사용
	json.put("name", name);
	json.put("age", age);
	
	//3. 값을 가진 JSONobject객체를 String으로 얻는다.
	String jsonStr=json.toJSONString();
	
%>
<%= jsonStr %>