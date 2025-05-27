<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0512/jstl_forEach2.jsp</title>
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
//1. 배열생성
String[] names={"이장훈", "박인배", "양준수", "이호빈", "주현석"};
//2. scope객체 저장 => EL에서 사용할 수 있다.
//이걸 바로 못쓰니까->scope객체
//이 페이지에서만 쓸꺼니까 pageContext
pageContext.setAttribute("names", names);
%>
<!-- //3. 출력 -->
<h4>varStatus의 index, count, first, last</h4>
<ul>
<c:forEach var="name" items="${ names }" varStatus="i">
<li>
<c:out value="${ i.index }   ${ i.count }   ${ i.first }   ${ i.last }"/>
<c:out value="${ name }"/>
</li>
<c:if test="${ i.last }">
<h4>총: <c:out value="${ i.count }"/>명</h4>
</c:if>

</c:forEach>
</ul>

<a href="jstl_forEach2.jsp?name=kim&name=lee&name=park&name=choi">요청</a>
<div>
<c:forEach var="name" items="${ paramValues.name }" varStatus="i">



<input type="radio" name="name" value="${ name }"/>
<c:out value="${ i.count }"/>. <c:out value="${ name }"/>
</c:forEach>
</div>

</div><!--container-->

</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>
</body>
</html>