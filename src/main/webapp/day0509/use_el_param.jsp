<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="EL을 사용한 web parameter를 처리"%>
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
$("#btnPost").click(function(){
 $("#frm").submit();
});
});//ready


</script>
</head>
<body>
<header data-bs-theme="dark">
<jsp:include page="../common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<h2>EL을 사용한 web parameter 처리</h2>


<form name="frm" id="frm" action="use_el_param_process.jsp" method="post">

<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d101291.71203820429!2d126.96316295820314!3d37.49928500000001!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca1c32408f9b7%3A0x4e3761a4f356d1eb!2z7IyN7Jqp6rWQ7Jyh7IS87YSw!5e0!3m2!1sko!2skr!4v1746690179160!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

<ul><!-- autofocus="autofocus": 커서를 HTML Form Control 위치 시킬때 -->
<li><label>text</label><input type="text" name="txt" autofocus="autofocus"/></li>
<li><label>나이</label><input type="text" name="age"/></li>
<li><label>password</label><input type="password" name="pass"/></li>
<li><label>file</label><input type="file" name="file"/></li>
<li><label>hidden</label>
	<input type="hidden" name="hid" value="5월은 쉬는 날 끝"/></li>
<li><label>checkbox</label>
	<input type="checkbox" name="flag" value="flag"/></li>
<li><label>select</label>
	<select name="sel">
		<option value="자바">자바</option>
		<option value="오라클">Oracle</option>
		<option value="JDBC">JDBC</option>
		<option value="HTML">HTML</option>
	</select>
</li>
<li><label>textarea</label>
<textarea name="ta"></textarea>
</li>
 <li>
 	<label>checkbox</label>
 	<input type="checkbox" name="lang" value="Java"/>Java SE
 	<input type="checkbox" name="lang" value="C/C++"/>C/C++
 	<input type="checkbox" name="lang" value="JSP"/>JSP
 	<input type="checkbox" name="lang" value="PyThon"/>PyThon
 	<input type="checkbox" name="lang" value="ASP"/>ASP
 </li>
<li>
<input type="button" value="POST전송" class="btn btn-success" id="btnPost"  />
</li>
</ul>
</form>

</div>
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>


</body>
</html>