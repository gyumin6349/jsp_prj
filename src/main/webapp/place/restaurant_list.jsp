<%@page import="kr.co.sist.place.RestDTO"%>
<%@page import="kr.co.sist.place.PlaceService"%>
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

<jsp:useBean id="pDTO" class="kr.co.sist.place.PlaceDTO" scope="page"/>
<jsp:setProperty name="pDTO" property="*"/> 

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
<header data-ps-theme="dark">
<c:import url="http://192.168.10.89/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="subTitleDiv"><span id="subTitleSpan">맛집 리스트</span></div><hr>
<div id="container">
<%
PlaceService ps = new PlaceService();

int totalCount=0;//총 게시물의 수
totalCount=ps.totalCount(pDTO);

int pageScale=0;//한 화면에 보여줄 게시물의 수
pageScale=ps.pageScale();

int totalPage=(int)Math.ceil(totalCount/pageScale);

// int totalPage=( totalCount / pageScale );

if(totalCount % pageScale != 0){
	totalPage++;
}//end if
	
//페이지 네이션과 관련있는,,, 시작번호(startNum)

int startNum;//시작 번호
//System.out.println(pDTO.getCurrentPage());//pDTO의 currentPage=1 해주자~
startNum=ps.startNum(pageScale, pDTO);

int endNum;//끝 번호
endNum=ps.endNum(pageScale, pDTO);

List<RestDTO> restaurantList = ps.searchRestaurant(pDTO);
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
pageContext.setAttribute("startNum", pDTO.getStartNum());
pageContext.setAttribute("endNum",  pDTO.getEndNum());
pageContext.setAttribute("restaurantList",  restaurantList);
pageContext.setAttribute("currentPage",  currentPage);
pageContext.setAttribute("fieldText",  pDTO.getFieldText());


%>


<hr>

맛집 전체 <c:out value="${totalCount}"/>건

<div style="text-align: right; ">
<a href="write_rest_frm.jsp" class="btn btn-info btn-sm">당신의 맛집</a>
</div>

<div style="width: 900px; height: auto" >
	<table class="table table-hover">
	<thead class="table table-light" style="text-align:center">
	<tr>
		<th style="width:30px">번호</th>
		<th style="width:120px">식당명</th>
		<th style="width:80px">메인 메뉴</th>
		<th style="width:150px">작성자</th>
		<th style="width:150px">작성일</th>
	</tr>
	</thead>
	<tbody>
	<c:if test="${ empty restaurantList }">
	<tr><td colspan="5">
	<span style="font-size: 36px; font-weight: bold; color:red">등록된 맛집이없습니다..</span>
	<img src="http://192.168.10.89/jsp_prj/login/images/login_fail.jpg"
		style="width: 100%" height="300px"/>
		<br>
		<a href="write_rest_frm.jsp">맛집등록하기</a>
	</td></tr>
	</c:if>
	<%
	StringBuilder searchQueryString=new StringBuilder();
	if(pDTO.getKeyword() != null && !pDTO.getKeyword().isEmpty()){
		searchQueryString.append("&field=").append(pDTO.getField()).append("&keyword=").append(pDTO.getKeyword());
	}//endif

	pageContext.setAttribute("queryStr", searchQueryString);
	
	%>
	<c:forEach var="restDTO" items="${ restaurantList }" varStatus="i">
	<tr style="text-align:center">
	<td><c:out value="${totalCount-(pDTO.currentPage-1)*pageScale-i.index }"/></td>
	<td><a href="rest_detail.jsp?num=${ restDTO.rest_num }&currentPage=${pDTO.currentPage}${ queryStr}"><c:out value="${ restDTO.restaurant }"/></a></td>
	<td><c:out value="${restDTO.menu}"/></td>
	<td><c:out value="${ restDTO.id }"/></td>
	<td><fmt:formatDate value="${ restDTO.input_date}"
		pattern="yyyy-MM-dd a HH:mm:ss"/></td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	<div id="searchDiv" style="text-align: center;">
	
	<form action="restaurant_list.jsp" id="searchFrm" method="get">
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

PaginationDTO paginationDTO = new PaginationDTO(3, pDTO.getCurrentPage(), totalPage, 
		"restaurant_list.jsp", pDTO.getField(), pDTO.getKeyword());

%>
<%= BoardUtil.pagination(paginationDTO) %>
</div>


</div>

</div><!--container-->
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.89/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>