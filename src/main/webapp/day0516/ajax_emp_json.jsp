<%@page import="day0516.EmpService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" info=""%>
<%
String paramDeptno = request.getParameter("deptno");
int deptno=0;
deptno=Integer.parseInt(paramDeptno);
EmpService es = new EmpService();
%>
<%= es.searchEmp(deptno)%>