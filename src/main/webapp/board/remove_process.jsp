<%@page import="kr.co.sist.board.BoardService"%>
<%@page import="java.util.Random"%>
<%@page import="kr.co.sist.member.login.LoginResultDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/jsp/site_config.jsp"%>
<%@ include file="../common/jsp/login_chk.jsp" %>  


<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bDTO" class="kr.co.sist.board.BoardDTO" scope="page" />
<jsp:setProperty name="bDTO" property="*"/>
<%
//useBean으로 입력되는 parameter는 num만 존재
bDTO.setId( ((LoginResultDTO)session.getAttribute("userData")).getId());
out.println(request.getParameter("num"));




BoardService bs = new BoardService();
pageContext.setAttribute("removeFlag", bs.deleteBoard(bDTO));


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }"/></title>
<c:import
   url="${url }/common/jsp/external_file.jsp" />

<style type="text/css">
#container {
   min-height: 600px;
   margin-top: 30px;
   margin-left: 20px
}
</style>

<script type="text/javascript">
<c:choose>
	<c:when test="${removeFlag}">
	alert("글삭제 완료");
	location.href="${url}/board/board_list.jsp";
	</c:when>
	<c:otherwise>
	alert("글삭제 실패");
	</c:otherwise>
</c:choose>
</script>
</head>
<body>
</body>
</html>