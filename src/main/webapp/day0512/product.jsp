<%@page import="day0512.ProductService"%>
<%@page import="java.util.List"%>
<%@page import="day0512.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    List<ProductDTO> list = new ProductService().searchPrd();
    request.setAttribute("data", list);
%>
<c:if test="${empty data }">
<h2>준비된 상품이 ㅇㅅㅇ</h2>
<img src="../common/images/img_5.jpg"/>
</c:if>

<c:if test="${not empty data }">
<h2>상품</h2>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://192.168.10.89/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 .card { width: 18rem; float: left; margin-right: 10px }
 .card-img-top { width: 280px; height: 160px }
</style>
</head>
<body>
<header data-bs-theme="dark">
 <c:import url="http://192.168.10.89/jsp_prj/common/jsp/header.jsp"/>
</header>
<main> 
<div id="container">

<div>
<c:forEach var="pDto" items="${data}">
  <div class="card">
    <img src="http://localhost/jsp_prj/common/images/${pDto.img}" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">${pDto.prd}</h5>
      <p class="card-text">${pDto.code}   </p>
      <p class="card-text"><fmt:formatDate value="${pDto.date }" pattern="MM-dd-yyyy HH:mm"/></p>
    <a href="#void" class="btn btn-primary"><fmt:formatNumber value="${pDto.price}" pattern="###,###,###"/>원</a>
    </div>
  </div>
</c:forEach>
</div>

</div>
</main>
<footer class="text-body-secondary py-5">
 <c:import url="http://192.168.10.89/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>
