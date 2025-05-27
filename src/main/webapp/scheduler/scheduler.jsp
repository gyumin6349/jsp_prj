<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="달력 형태"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- favicon 설정 -->
<link rel="shortcut icon" href="http://192.168.10.89/jsp_prj/common/images/favicon.ico"/>
<!--  bootstrap CDN -->
<link rel="stylesheet" type="text/css"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 
 a{text-decoration:none; color:#333}
 #calendarWrap{width: 895px;}
 #calendarHeader{text-align:center; font-size:25px; font-weight:bold;
 			color:#333; margin-bottom:20px;}
 .prevMonth, .nextMonth {color:#848AA3; font-size: 27px;}
 .btnToday{font-size:20px; border: 1px solid #CECECE; background-color:#E3E3E3}
 
 .calTab {border : 1px solid #CECECE; margin:0px auto;}
 .calTab > thead > tr > th{width:120px; height:30px; 
 			border : 1px solid #CECECE; text-align:center;}
 .calTab > tbody > tr > td{width:120px; height:80px; 
 			border : 1px solid #CECECE; vertical-align: top;
 			padding-left:5px; font-weight:bold;}

 .sunTitle {background-color: #FF6C6C; color:#FFFFFF}
 /* .weekTitle {} */
 .satTitle {background-color: #6CC0FF; color:#FFFFFF}
 /* 요일별 색 */
 .sunColor{color:#FF6C6C}
 .weekColor{color:#333}
 .satColor{color:#6CC0FF}
 /* 오늘의 바닥색 */
 .todayBgColor{background-color: #E9F4FB}
 .weekBgColor{background-color: #FFFFFF}

</style>
<!-- jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script type="text/javascript">
$(function(){
	
});//ready

function moveCalendar(flag, year, month){
	if(flag == 'p'){
		year=month-1==0?year-1:year;
		month=month-1==0?12:month-1;
	}//end if
	
	if(flag == 'n'){
		year=month+1==13?year+1:year;
		month=month+1==13?1:month+1;
	}//end if
	
	//년과 월을 설정
	$("#year").val(year);
	$("#month").val(month);
	
	//전송
	$("#calFrm").submit();
}//moveCalendar

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
<div id="calendarWrap">
<%
	Calendar sysCal = Calendar.getInstance(); // 시스템 날짜 기준\
	
	int flagYear= sysCal.get(Calendar.YEAR);
	int flagMonth= sysCal.get(Calendar.MONTH)+1;
	
	
	int sysYear = sysCal.get(Calendar.YEAR);
	int sysMonth = sysCal.get(Calendar.MONTH); // 0~11
	int sysDay = sysCal.get(Calendar.DAY_OF_MONTH);

	Calendar cal=Calendar.getInstance();//시스템의 현재 날짜 정보를 가지고 있다.
	int nowDay=cal.get(Calendar.DAY_OF_MONTH);
	//매개변수로 입력되는 년,월을 받기
	
	String paramYear=request.getParameter("year");
	String paramMonth=request.getParameter("month");
	
	if(paramYear != null){//입력되는 년,월을 사용하여
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.set(Calendar.YEAR, Integer.parseInt(paramYear));
		cal.set(Calendar.MONTH, Integer.parseInt(paramMonth)-1);
	}

	//시스템의 현재 년,월,일 얻기
	int nowYear=cal.get(Calendar.YEAR);
	int nowMonth=cal.get(Calendar.MONTH)+1;
%>
<form action="scheduler.jsp" method="post" id="calFrm">
<input type="hidden" name="year" id="year"/>
<input type="hidden" name="month" id="month"/>
</form>
<div id="calendarHeader">
<%-- <a href="scheduler.jsp?year=<%= nowMonth-1==0?nowYear-1:nowYear%>&month=<%=nowMonth-1==0?12:nowMonth-1%>"><span title="이전 월" class="prevMonth">&lt;</span></a>
<span class="mainDate"><%=nowYear %>.<%=nowMonth %></span>
<a href="scheduler.jsp?year=<%=nowMonth+1==13?nowYear+1:nowYear%>&month=<%=nowMonth+1==13?1:nowMonth+1%>"><span title="다음 월" class="nextMonth">&gt;</span></a>
<span title="오늘" class="btnToday">
<a href="scheduler.jsp">오늘</a>
</span> --%>
<a href="javascript:moveCalendar('p',<%= nowYear %>,<%= nowMonth%>)"><span title="이전 월" class="prevMonth">&lt;</span></a>
<span class="mainDate"><%=nowYear %>.<%=nowMonth %></span>
<a href="javascript:moveCalendar('n',<%=nowYear%>,<%=nowMonth%>)"><span title="다음 월" class="nextMonth">&gt;</span></a>
<span title="오늘" class="btnToday">
<a href="javascript:moveCalendar('t',<%= flagYear %>,<%= flagMonth%>)">오늘</a>
</span>
</div>

<div id="calendarContainer">
<table class="calTab">
<thead>
<tr>
	<th class="sunTitle">일</th>
	<th class="weekTitle">월</th>
	<th class="weekTitle">화</th>
	<th class="weekTitle">수</th>
	<th class="weekTitle">목</th>
	<th class="weekTitle">금</th>
	<th class="satTitle">토</th>
</tr>
</thead>
<tbody>
<tr>
<% //1일의 요일 - 1일을 출력하기 전 공백 설정
	cal.set(Calendar.DAY_OF_MONTH, 1); //1일로 설정
	int blankTdCnt=cal.get(Calendar.DAY_OF_WEEK);
	String dayColorCss=""; //요일별 색
	String todayCss=""; //오늘의 바닥색
	
	//log("-------------blankTdCnt---------------"+blankTdCnt);
	for(int blankTd=1; blankTd<blankTdCnt; blankTd++){
		%>
		<td class="blankTd"></td>
		<% 
	}//end for
	
	//1일부터 마지막 날까지 출력
	for(int tempDay=1; ; tempDay++){
		//현재 날을 가지고 있는 달력 객체에 1일부터 설정
		//(Calendar 특성 : 현재 월에 없는 날짜가 들어가면 자동으로 다음 달 1일로 설정)
		cal.set(Calendar.DAY_OF_MONTH, tempDay);
		//설정된 날짜로 얻어낸 날짜와 임시로 증가하는 날짜가 다르면 (다음달 1일)
		
		if(cal.get(Calendar.DAY_OF_MONTH) != tempDay){
		//마지막 날이면 빈 td를 만들고, 반복문을 빠져나간다.
			for(int blankTd=cal.get(Calendar.DAY_OF_WEEK);
					blankTd < Calendar.SATURDAY+1; blankTd++){
				%> <td class="blankTd" ></td> <% 
			}
			break;
		}//end if
		
		//날짜 별 색 설정
		dayColorCss="weekColor";
		switch(cal.get(Calendar.DAY_OF_WEEK)){
		case Calendar.SATURDAY : dayColorCss="satColor"; break;
		case Calendar.SUNDAY : dayColorCss="sunColor"; break;
		}//end switch
		
		//오늘의 바닥색
		todayCss="weekBgColor";
		if (nowYear == sysYear && nowMonth == sysMonth + 1 && tempDay == sysDay) {
		    todayCss = "todayBgColor"; // 이번 달이라면 오늘 강조
		}
		//날짜를 출력
		%>
		<td class="<%= dayColorCss%> <%=todayCss%>"><%=tempDay %></td>
		<% 
		//토요일이면 줄을 변경(Calendar.DAY_OF_WEEK);
		switch(cal.get(Calendar.DAY_OF_WEEK) ){
			case Calendar.SATURDAY:
			%>
			</tr>
			<tr>
			<% 
		}
	}
%>
</tr>
</tbody>
</table>
</div>
</div>

</div>
</main>
<footer class="text-body-secondary py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1"><strong style="font-size: 18px">2강의실</strong> 서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 8층 쌍용교육센터 <strong>Tel_02-3482-4632~5</strong> </p>
  </div>
</footer>


</body>
</html>