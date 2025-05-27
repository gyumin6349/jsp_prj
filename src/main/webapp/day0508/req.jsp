<%@page import="day0508.Counter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/jsp/external_file.jsp"/>
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
<jsp:include page="../common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
forward로 이동한 페이지<br>
<%
	Counter cnt=(Counter)pageContext.getAttribute("counter");
	Counter cnt2=(Counter)request.getAttribute("counter2");
	Counter cnt3=(Counter)session.getAttribute("counter3");
	Counter cnt4=(Counter)application.getAttribute("counter4");
%>
page scope : <%= cnt%><br>
request scope : <%= cnt2%><br>
session scope : <%= cnt3%><br>
application scope : <%= cnt4%><br>

<a href="req2.jsp">이동</a>
</div>
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>


</body>
</html>