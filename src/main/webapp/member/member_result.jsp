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
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="member" class="day0508.memberDTO" scope="page"/>
<jsp:setProperty property="*" name="member"/>
<ul>
<li><label>id</label> : <jsp:getProperty property="idValue" name="member"/></li>
<li><label>pass</label> : <jsp:getProperty property="passValue" name="member"/></li>
<li><label>name</label> : <jsp:getProperty property="nameValue" name="member"/></li>
<li><label>birth</label> : <jsp:getProperty property="birthValue" name="member"/></li>
<li><label>contact</label> : <jsp:getProperty property="contactValue" name="member"/></li>
<li><label>phone</label> : <jsp:getProperty property="phoneValue" name="member"/></li>
<li><label>email</label> : <jsp:getProperty property="email1Value" name="member"/>@<jsp:getProperty property="email2Value" name="member"/></li>
<li><label>gender</label> : <jsp:getProperty property="gender" name="member"/></li>
<li><label>domain</label> : <jsp:getProperty property="domain" name="member"/></li>
<li><label>zipcode</label> : <jsp:getProperty property="zipcode" name="member"/></li>
<li><label>address</label> : <jsp:getProperty property="addr" name="member"/></li>
<li><label>explain</label> : <jsp:getProperty property="explainValue" name="member"/></li>

</ul>
<a href="javascript:history.back()">뒤로가기</a>

</div>
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>


</body>
</html>