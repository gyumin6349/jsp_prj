<%@page import="kr.co.sist.member.login.LoginService"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="lDTO" class="kr.co.sist.member.login.LoginDTO" scope="page"/>
<jsp:setProperty name="lDTO" property="*"/>
<%
if("POST".equals(request.getMethod().toUpperCase())){
	LoginService ls = new LoginService();
	boolean flag = ls.loginProcess(lDTO, session);
	
	%>
{"loginResult" : <%= flag %>}
<% 	
}//if
%>


