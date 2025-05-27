<%@page import="kr.co.sist.file.FileService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%@ include file="../common/site_config.jsp" %>     --%>
<%-- <%@ include file="../common/jsp/login_chk.jsp" %> --%>
<%
FileService fs = new FileService();
pageContext.setAttribute("fileList", fs.fileList());//scope객체에 넣어준다~
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file/file_list.jsp</title>
<c:import url="http://192.168.10.89/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container { min-height: 600px; margin-top: 30px; margin-left: 20px}
 #subTitleDiv { margin: 20px}
 #subTitleDiv > #subTitleSpan { font-size:30px; font-weight: bold; color:black}
 
 a{ text-decoration: none; color: #333 }
 a:hover{ color: #0000FF }
 
</style>
<script type="text/javascript">
$(function(){

});//ready


</script>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="http://192.168.10.89/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="subTitleDiv"><span id="subTitleSpan">업로드 파일목록</span></div><hr>
<div id="container">

<div>
<table class="table table-hover">
<thead class="table table-red">
	<tr>
	<th>번호</th>
	<th>파일명</th>
	<th>파일크기(byte)</th>
	<th>업로드일</th>
	</tr>
</thead>
<tbody>

<c:if test="${ empty fileList }">
<tr colspan="4" style="text-align: center">아직 업로드된파일이 없습니닷</tr>
</c:if>

<c:forEach var="file" items="${ fileList }" varStatus="i">
<tr>
<td><c:out value="${ i.count }"/></td>
<%-- <td><a href="http://192.168.10.88/jsp_prj/upload/${ file.fileName }"><c:out value="${ file.fileName }"/></a></td> --%>
<td><a href="download.jsp?fileName=${ file.fileName }"><c:out value="${ file.fileName }"/></a></td>
<td><c:out value="${ file.length }"/></td>
<td><fmt:formatDate value="${ file.lastModified }" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
</tr>
</c:forEach>


</tbody>
<tfoot>
</tfoot>
</table>
</div>


</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.89/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>