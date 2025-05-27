<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>

<% String name = new Random().nextBoolean()?"강태일":""; %>
<%= name %>님 안녕하세요?

<%!
	public String addr(){
	return "우리집";
}
%>