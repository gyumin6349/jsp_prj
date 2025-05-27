<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSTL의,,, if를 써보자~"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0512/jstl_if.jsp</title>
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

<c:if test="true">
이것이 보여집니다~~
</c:if>
<hr>
<c:if test="false">
이것은 안보여집니다
</c:if>
<hr>
<c:if test="${ empty param.param }">
<strong>아래의 링크를 클릭해주세요.</strong>
<a href="http://localhost/jsp_prj/day0512/jstl_if.jsp?param=test">요청</a>
</c:if>
<hr>


</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>
</body>
</html>