<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="useBean action 태그로 웹 파라미터 한번에 받기"%>
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
<!-- 객체 생성 및 사용 범위 설정 -->
<jsp:useBean id="param" class="day0508.Param" scope="page"/>
<!-- setter method 호출 모든 파라메터 받기 -->
<jsp:setProperty property="*" name="param"/>

<%-- <%= param %> --%>
<ul>

<li><label>text</label> : <jsp:getProperty property="txt" name="param"/></li>
<li><label>age</label> : <jsp:getProperty property="age" name="param"/></li>
<li><label>pass</label> : <jsp:getProperty property="pass" name="param"/></li>
<li><label>file</label> : <jsp:getProperty property="file" name="param"/></li>
<li><label>hidden</label> : <jsp:getProperty property="hid" name="param"/></li>
<li><label>checkbox 하나</label> : <!-- 체크박스가 하나인경우 checked 되면 value가 checked 되지 않았으면 null -->
<jsp:getProperty property="flag" name="param"/></li>
<li><label>select</label> : <jsp:getProperty property="sel" name="param"/></li>
<li><label>text Area</label> : <jsp:getProperty property="ta" name="param"/></li>
<li><label>checkbox 여러개</label> : <jsp:getProperty property="lang" name="param"/></li>
<li><%= Arrays.toString(param.getLang()) %></li>
<li>
<%
String [] lang = param.getLang();
if(lang!=null){
for(int i = 0; i<lang.length; i++){
%>
<span style="background-color:<%= i%2==0?"#E7C059":"#5A90D0"%>"><%= lang[i]%></span>
<%
}//end for
}//end if%>
</li>
</ul>
</div>
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>


</body>
</html>