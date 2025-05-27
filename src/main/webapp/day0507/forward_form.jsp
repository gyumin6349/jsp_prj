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
	$("#btn").click(function(){
		$("#frm").submit();
	});//click
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
String serverName=request.getServerName();
String nameLabel="name", ageLabel="age", btnLabel="submit";
if("localhost".equals(serverName)){
	nameLabel="이름";
	ageLabel="나이";
	btnLabel="전송";
}

%>
<form action="forward_process.jsp" id="frm" name="name" method="get">
<label><%= nameLabel%></label>
<input type="text" name="name" id="name"/><br/>
<label><%= ageLabel%></label>
<input type="text" name="age" id="age"/><br/>
<a href="http://localhost:11108/jsp_prj/day0507/forward_form.jsp">국내</a>
<a href="http://192.168.10.89/jsp_prj/day0507/forward_form.jsp">국외</a>
<br/>
<input type="button" id="btn" value="<%= btnLabel%>" class="btn btn-success"/><br/>
</form>
</div>

</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>


</body>
</html>