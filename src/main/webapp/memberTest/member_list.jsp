<%@page import="kr.co.sist.member.MemberService"%>
<%@page import="java.lang.reflect.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://192.168.10.89/jsp_prj/common/jsp/external_file.jsp"/>
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
<c:import url="http://192.168.10.89/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<div>
<h2>회원리스트</h2>
<!-- role은 로그인했을 때 관리자의 role을 검색하여 session에 할당하여 필요한 곳에 사용한다.-->
<a href="member_list.jsp?role=a">관리자A(암호화)</a>
<a href="member_list.jsp?role=b">관리자B(이름, 이메일만 확인 가능)</a>
<a href="member_list.jsp?role=c">관리자C(이름, 이메일, 전화번호 확인가능)</a>
</div>
<div>
<%
String role = request.getParameter("role");
if(role==null || role.equals("")){
	role="a";
}//end if

MemberService ms = new MemberService();
pageContext.setAttribute("memberList", ms.searchAllMember(role));

%>
<table class="table table-hover">
<thead>
<tr>
<th>번호</th>
<th>아이디</th>
<th>이름</th>
<th>생년월일</th>
<th>전화번호</th>
<th>이메일</th>
<th>성별</th>
<th>가입일</th>
</tr>

</thead>
<tbody>
<c:if test="${empty memberList }">
<tr>
<td colspan="8">회원정보가 존재하지 않습니다.</td>
</tr>
</c:if>
<c:forEach var="mDTO" items="${memberList }" varStatus="i">
<tr>
<td><c:out value="${i.count }"/></td>
<td><c:out value="${mDTO.id }"/></td>
<td><c:out value="${mDTO.name }"/></td>
<td><c:out value="${mDTO.birth }"/></td>
<td><c:out value="${mDTO.tel }"/></td>
<td><c:out value="${mDTO.useEmail }"/></td>
<td><c:out value="${mDTO.gender }"/></td>
<td><fmt:formatDate value="${mDTO.input_date }" pattern="yyyy-MM-dd EEEE HH:mm"/></td>
</tr>

</c:forEach>
</tbody>
</table>

</div>
</div>
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.89/jsp_prj/common/jsp/footer.jsp"/>
</footer>


</body>
</html>