<%@page import="kr.co.sist.board.BoardUtil"%>
<%@page import="kr.co.sist.board.PaginationDTO"%>
<%@page import="kr.co.sist.board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ include file="../common/jsp/site_config.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../common/jsp/login_chk.jsp" %>
<jsp:useBean id="rDTO" class="kr.co.sist.board.RangeDTO" scope="page"/>
<jsp:setProperty name="rDTO" property="*"/> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_list.jsp</title>
<c:import url="http://192.168.10.89/jsp_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 #subTitleDiv { margin: 20px}
 #subTitleDiv > #subTitleSpan { font-size:30px; font-weight: bold }
 
 #div1{font-size: 24px}
 #div1 > span {font-weight: bold; color: blue}
 
 a{text-decoration: none; color:#333}
 a:hover{text-decoration: underline; color:#DFDFDF}
</style>
<script type="text/javascript">
$(function(){
	$("#btnSearch").click(function(){
		var keyword=$("#keyword").val();
		if(keyword == ""){
			alert("검색 키워드는 필수 입력");
			return;
		}
			$("#searchFrm").submit();
	});
});//ready
</script>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="http://192.168.10.89/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="subTitleDiv"><span id="subTitleSpan">자유게시판 만들기</span></div><hr>
<div id="container">
<%
BoardService bs = new BoardService();

int totalCount=0;//총 게시물의 수
totalCount=bs.totalCount(rDTO);

int pageScale=0;//한 화면에 보여줄 게시물의 수
pageScale=bs.pageScale();

int totalPage=(int)Math.ceil(totalCount/pageScale);

// int totalPage=( totalCount / pageScale );

if(totalCount % pageScale != 0){
	totalPage++;
}//end if
	
//페이지 네이션과 관련있는,,, 시작번호(startNum)

int startNum;//시작 번호
//System.out.println(rDTO.getCurrentPage());//rDTO의 currentPage=1 해주자~
startNum=bs.startNum(pageScale, rDTO);

int endNum;//끝 번호
endNum=bs.endNum(pageScale, rDTO);

List<BoardDTO> boardList = bs.searchBoard(rDTO);
// List<BoardDTO> boardList = null;//회원정보가 없는 경우~


String currentPage=request.getParameter("currentPage");
// System.out.println(tempPage);


pageContext.setAttribute("totalCount", totalCount);
pageContext.setAttribute("pageScale", pageScale);
pageContext.setAttribute("totalPage", totalPage);
/*
pageContext.setAttribute("startNum", startNum);
pageContext.setAttribute("endNum", endNum);
*/
pageContext.setAttribute("startNum", rDTO.getStartNum());
pageContext.setAttribute("endNum",  rDTO.getEndNum());
pageContext.setAttribute("boardList",  boardList);
pageContext.setAttribute("currentPage",  currentPage);
pageContext.setAttribute("fieldText",  rDTO.getFieldText());

session.setAttribute("cntFlag", true);

%>

<div id="div1">
총게시물의 수: <span>${ totalCount }</span><br>
한 화면에 보여줄 게시물의 수: <span>${ pageScale }</span><br>
필요한 페이지의 수(쪽번호) : <span>${ totalPage }</span><br>
pagination을 위한,,, 시작 번호 : <span>${ startNum }</span><br>
pagination을 위한,,, 끝 번호 : <span>${ endNum }</span><br>
</div>
<hr>

전체 <c:out value="${totalPage}"/>페이지에서,,,
현재 <c:out value="${currentPage}"/>페이지 입니다!

<div style="text-align: right; ">
<a href="http://192.168.10.89/jsp_prj/board/write_frm.jsp" class="btn btn-info btn-sm">글작성</a>
</div>

<div style="width: 900px; height: auto" >
	<table class="table table-hover">
	<thead class="table table-light" style="text-align:center">
	<tr>
		<th style="width:30px">번호</th>
		<th style="width:120px">제목</th>
		<th style="width:80px">작성자</th>
		<th style="width:150px">작성일</th>
		<th style="width:50px">조회수</th>
	</tr>
	</thead>
	<tbody>
	<c:if test="${ empty boardList }">
	<tr><td colspan="5">
	<span style="font-size: 36px; font-weight: bold; color:red">게시글이 존재하지 않습니다ㅜㅜ</span>
	<img src="http://192.168.10.89/jsp_prj/login/images/login_fail.jpg"
		style="width: 100%" height="300px"/>
	</td></tr>
	</c:if>
	<%
	StringBuilder searchQueryString=new StringBuilder();
	if(rDTO.getKeyword() != null && !rDTO.getKeyword().isEmpty()){
		searchQueryString.append("&field=").append(rDTO.getField()).append("&keyword=").append(rDTO.getKeyword());
	}//endif

	pageContext.setAttribute("queryStr", searchQueryString);
	
	%>
	<c:forEach var="bDTO" items="${ boardList }" varStatus="i">
	<tr style="text-align:center">
	<td><c:out value="${totalCount-(rDTO.currentPage-1)*pageScale-i.index }"/></td>
	<td><a href="board_detail.jsp?num=${ bDTO.num }&currentPage=${rDTO.currentPage}${ queryStr}"><c:out value="${ bDTO.subject }"/></a></td>
	<td><c:out value="${ bDTO.id }"/></td>
	<td><fmt:formatDate value="${ bDTO.input_date}"
		pattern="yyyy-MM-dd a HH:mm:ss"/></td>
	<td><c:out value="${ bDTO.cnt }"/></td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	<div id="searchDiv" style="text-align: center;">
	
	<form action="board_list.jsp" id="searchFrm" method="get">
	<select name="field" id="field" >
	<c:forEach var="field" items="${fieldText}" varStatus="i">
	<option value="${i.index }"><c:out value="${field }"/></option>
	</c:forEach>
	
	</select>
	<input type="text" name="keyword" id="keyword"/>
	<input type="text" style="display:none"/>
	
	<input type="button" value="검색" id="btnSearch" class="btn btn-success btn-sm"/>
	</form>
	</div>
<!-- <div style="font-size:24px" id="paginationDiv"> -->
<%-- <c:forEach var="i" begin="1" end="${ totalPage }" step="1"> --%>
<%-- [ <a href="board_list.jsp?currentPage=${i}"><c:out value="${i}"/></a> ] --%>
<%-- </c:forEach> --%>
<!-- </div> -->

<div id="paginationDiv" style="font-size:20px; text-align:center;">
<%

PaginationDTO pDTO = new PaginationDTO(3, rDTO.getCurrentPage(), totalPage, 
		"board_list.jsp", rDTO.getField(), rDTO.getKeyword());

%>
<%= BoardUtil.pagination(pDTO) %>
</div>


</div>

</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.89/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>