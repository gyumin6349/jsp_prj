<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://192.168.10.89/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
#container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
</style>
<script type="text/javascript">
$(function(){

});//ready	
</script>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="http://192.168.10.89/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<%
int num = 20_250_512;
pageContext.setAttribute("num", num);

Date date = new Date();
pageContext.setAttribute("date", date);
%>
일반 숫자 : <c:out value="${ num }"/><br>
0 패턴 : <fmt:formatNumber value = "${ num }" pattern="0,000,000,000"/><br>
# 패턴 : <fmt:formatNumber value = "${ num }" pattern="#,###,###,###"/><br>

형식없는 날짜 : <c:out value="${ date }"/><br>
형식 설정 : <fmt:formatDate value="${ date }" pattern="yyyy-MM-dd a hh(HH:KK:kk):mm:ss"/><br>
</div>
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.89/jsp_prj/common/jsp/footer.jsp"/>
</footer>


</body>
</html>