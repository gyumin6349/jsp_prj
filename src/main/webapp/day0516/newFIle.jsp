<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" info=""%>
<%
	Set<String> set = System.getenv().keySet();
	Iterator<String> ita = set.iterator();
	String key ="";
	while(ita.hasNext()){
		key=ita.next();
		out.println("<li>"+key+":"+System.getenv(key)+"</li>");
	}
%>