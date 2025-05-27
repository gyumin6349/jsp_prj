<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="scope의 사용"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/jsp/external_file.jsp"/>
<style type="text/css">
#container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
span{background-color: #E7C059; font-weight: bold;}
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
<jsp:useBean id="counter" class="day0508.Counter" scope="page"/>
<jsp:setProperty property="cnt" value="1" name="counter" />

<jsp:useBean id="counter2" class="day0508.Counter" scope="request"/>
<jsp:setProperty property="cnt" value="1" name="counter2" />

<jsp:useBean id="counter3" class="day0508.Counter" scope="session"/>
<jsp:setProperty property="cnt" value="1" name="counter3" />

<jsp:useBean id="counter4" class="day0508.Counter" scope="application"/>
<jsp:setProperty property="cnt" value="1" name="counter4" />



<h3>당신은 이 페이지에 
<span><jsp:getProperty property="cnt" name="counter"/></span>번째 방문자입니다.</h3>

<jsp:forward page="req.jsp"/>
</div>
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>


</body>
</html>