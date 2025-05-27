<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%
String method=request.getMethod();

if(!"GET".equals(method.toUpperCase())){
	response.sendRedirect("http://192.168.10.89/jsp_prj/day0513/index.jsp");
	return;
}//end if
%>