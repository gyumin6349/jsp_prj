<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="분기"%>

 <%
 String serverName=request.getServerName();
 String movePage="eng.jsp";
 
 if("localhost".equals(serverName)){
	 movePage="kor.jsp";
 }//end if
 %>
 <jsp:forward page="<%= movePage %>"/>
 