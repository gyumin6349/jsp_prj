<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" info=""%>
<%
//ajax에서 전달하는 parameter 받기
String name = request.getParameter("name");
String age = request.getParameter("myAge");

int nowYear = Calendar.getInstance().get(Calendar.YEAR);

StringBuilder msg = new StringBuilder();
msg.append(name).append("님 안녕하세요? 나이는" ).append(age).append("살입니다.");


JSONObject jsonObj = new JSONObject();
jsonObj.put("method", request.getMethod());
jsonObj.put("msg", msg.toString());
jsonObj.put("birth", nowYear- Integer.parseInt(age)+1);


%>
<%= jsonObj.toJSONString()%>