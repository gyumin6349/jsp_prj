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
아이디 : <%= request.getParameter("idValue") %><br>
비밀번호 : <%= request.getParameter("passValue") %><br>
이름 : <%= request.getParameter("nameValue") %><br>
생일 : <%= request.getParameter("birthValue") %><br>
연락처 : <%= request.getParameter("contactValue") %><br>
휴대폰 : <%= request.getParameter("phoneValue") %><br>
이메일 : <%= request.getParameter("email1Value") %>@<%= request.getParameter("email2Value") %><br>
성별 : <%= request.getParameter("gender") %><br>
소재지 : <%= request.getParameter("domain") %><br>
우편번호 : <%= request.getParameter("zipcode") %><br>
주소 : <%= request.getParameter("addr") %> <%= request.getParameter("addr2")%><br>
자기소개 : <%= request.getParameter("explainValue") %><br>
<a href="javascript:history.back()">뒤로</a>
</div>
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>


</body>
</html>