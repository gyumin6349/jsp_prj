
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.member.MemberService"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
   pageEncoding="UTF-8" info=""%>
<%
	String id = request.getParameter("id");
	MemberService ms = new MemberService();
	boolean idFlag=!ms.searchId(id);
	
%>
{"idFlag":<%= idFlag %>}