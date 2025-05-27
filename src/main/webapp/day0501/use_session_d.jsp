<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="로그아웃"
    %>
<%@ include file="../common/jsp/login_chk.jsp" %>
<%
// 	session.removeAttribute("name");
	session.invalidate();%>
	
	<!-- 방법3)--><%
	response.sendRedirect("use_session_a.jsp");
	%>
	<%
	/*
	out.println( session.getAttribute("connectTime") );
	out.println( session.getAttribute("ip") );
	out.println( session.getAttribute("name") );
	*/
	
	/*
	String currentName = (String)session.getAttribute("name");
	String currentCreationTime = (String)session.getAttribute("connectTime");
	String currentIpAddress = (String)session.getAttribute("ip");
	*/
%>

<%--<!--
세션 사용자명: <%=currentName %><br>
세션 생성시각: <%=currentCreationTime %><br>
세션 IP주소 : <%=currentIpAddress %><br>
-->--%>

<!-- 방법1)
<meta http-equiv="refresh" content="0;use_session_a.jsp">
-->

<!-- 방법2)
<script type="text/javascript">
	alert("로그아웃 하셨음");
	location.href="use_session_a.jsp";
</script>
-->

