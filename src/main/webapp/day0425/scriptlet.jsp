<%@page import="java.time.LocalDate"%>
<%@page import="day0425.DataDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- favicon 설정 -->
<link rel="shortcut icon" href="http://192.168.10.88/jsp_prj/common/images/favicon.ico"/>
<!--  bootstrap CDN -->
<link rel="stylesheet" type="text/css"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 .span{ font-weight: bold; font-size:24px; color:aqua}
 td{ text-align: center; cursor:pointer;}
 td:hover{ background-color: aqua; }
</style>
<!-- jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script type="text/javascript">

</script>
</head>
<body>
<header data-bs-theme="dark">
  <div class="collapse text-bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-md-7 py-4">
          <h4>템플릿</h4>
          <p class="text-body-secondary">모름.</p>
        </div>
        <div class="col-sm-4 offset-md-1 py-4">
          <h4>Contact</h4>
          <ul class="list-unstyled">
            <li><a href="https://google.com" class="text-white">구글에서 찾기</a></li>
            <li><a href="https://chatgpt.com/" class="text-white">지피티 찾기</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container">
      <a href="index.jsp" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>템플릿</strong>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>
</header>
<main>
<div id="container">
<% //scriptlet: _jspService() 안으로 생성될 코드들,,, ,,,
	String name="이장훈";
%>
<% for(int i =1; i < 7 ; i++) { %>
<h<%=i%>><%= name %></strong>입니다.</h<%=i%>>
<% }//end for %>
<input type="text" placeholder="<%= name %>"/><br>

<%
	int sum=0;
	for(int j=1; j<101; j++){
		sum+=j;
	}//end for
%>

<div>
1~100까지의 합은 <span class="span"><%=sum%></span>입니다.
</div>
<script type="text/javascript">
// function result(var inputI, var inputJ){
function result(inputI, inputJ){
	var rst= inputI * inputJ;
	alert(inputI+" x "+inputJ+"= "+rst);	
}//result
</script>


<div>
	<table class="table table-bordered">
		<thead>
		</thead>
		<tbody>
			<% for(int j=1; j<10; j++){ %>
			<tr>
				<% for(int i=1; i<10; i++){ %>
				<td onclick="result(<%=i%>, <%=j%>)"><%=i%> x <%=j%></td>
				<% }//end for %>
			</tr>
			<% }//end for %>
		</tbody>
	</table>
</div>

<%
List<DataDTO> list=new ArrayList<DataDTO>(); 
list.add(new DataDTO("img_1.jpg", "뭐지?", "너는 아냐?", "https://chatgpt.com"));
list.add(new DataDTO("img_2.jpg", "뭐지2?", "너는 아냐2?", "https://google.com"));
list.add(new DataDTO("img_3.jpg", "뭐지3?", "너는 아냐3?", "https://www.yogiyo.co.kr/mobile/#/"));		
%>
<div>
<% for(DataDTO dto : list){ %>
<div class="card" style="width: 18rem; float: left; margin-right: 50px">
  <img src="http://192.168.10.88/jsp_prj/common/images/<%=dto.getImg() %>"
  		style="width: 100%" height="160px"
  		class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title"><%=dto.getTitle() %></h5>
    <p class="card-text"><%=dto.getInfo() %></p>
    <a href="<%=dto.getUrl() %>" class="btn btn-primary">가쥬아~~</a>
  </div>
</div>
<% }//end 개선된for %>
</div>
<div style="clear:both">

<%--	
<%
	LocalDate ld=LocalDate.now();//현재 시간 얻기
	int nowYear=ld.getYear();
%>
<select id="year">
	<option value="none1">---선택---</option>
	<% for(int tmpYear=nowYear; tmpYear>1949; tmpYear--){  %>
	<option value="<%= tmpYear %>"><%= tmpYear %></option>
	<%} %>
</select>
--%>

<%
	LocalDate ld=LocalDate.now();//현재 시간 얻기
	int nowYear=ld.getYear();
	int nowMonth=ld.getMonthValue();
	LocalDate lastOfDay = ld.withDayOfMonth(ld.lengthOfMonth());
	int nowDay = lastOfDay.getDayOfMonth();
	int nowDay2 = ld.getDayOfMonth();
%>


<%-- 
<select id="year" style="width: 200px; height: 50px; font-size:40px">
	<option value="none1">---선택---</option>
	<% for(int tmpYear=nowYear-2; tmpYear<nowYear+3; tmpYear++){
		if(tmpYear==nowYear){ %>
			<option value="<%= tmpYear %>" selected="selected"><%= tmpYear %></option>
		<% }else{ %>
			<option value="<%= tmpYear %>" ><%= tmpYear %></option>
		<% }
	} %>
</select>
--%>
<select id="year" style="width: 200px; height: 50px; font-size:25px">
	<option value="none1">---선택---</option>
<%
	int optionYear=0;	
	String selected="";
	
	for(int tmpYear=-2; tmpYear<3; tmpYear++){
	optionYear=nowYear+tmpYear;
	selected="";
	
		if(optionYear == nowYear){
			selected=" selected='selected'";
		}//end if
%>
	<option value="<%= optionYear %>"<%=selected%>><%= optionYear %></option>
	<% }//end for %>
</select>
<select id="month" style="width: 200px; height: 50px; font-size:25px">
	<option value="none1">---선택---</option>
<%
	
	for(int month=1; month<13; month++){
	
%>
	<option value="<%= month %>"<%= month== nowMonth ?"selected ='selected'": selected %>><%= month %></option>
	<% }//end for %>
</select>월
<select id="day">
	<option value="none">---선택---</option>
	<% for(int i = 1; i<=nowDay; i++){
		
		
%>
<option value="<%= i %>"<%= i == nowDay2 ?"selected='selected'":selected %>><%= i %></option>
	<%}%>
</select>일	
</div>


</div>
</main><!-- float만 그런다 -> clear:both -->
<footer style="clear:both" class="text-body-secondary py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1"><strong style="font-size: 18px">2강의실</strong> 서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 8층 쌍용교육센터 <strong>Tel_02-3482-4632~5</strong> </p>
  </div>
</footer>


</body>
</html>