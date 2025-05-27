<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="입력값을 받아서,,, 처리하는 JSP"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day0430/unique_name_process.jsp</title>

<!-- favicon 설정 -->
<link rel="shortcut icon" href="http://192.168.10.88/jsp_prj/common/images/favicon.ico"/>
<!--  bootstrap CDN -->
<link rel="stylesheet" type="text/css"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
</style>
<!-- jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script type="text/javascript">
$(function(){

});//ready

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
<h1><%= request.getMethod() %>방식입니당</h1>
<%

//	입력되는 파라미터들의,,, 일괄 인코딩 적용( POST방식으로 한글입력받는 JSP에서 쓴다~~)
	request.setCharacterEncoding("UTF-8");

//	_jspService()에 생성 => 내장객체 사용 가능.
//	사용자가,,, HTML Form Control에 입력한 값을,,, 받는 일	
//	=uej6t&=etuj&=CPLT.url&=5월+1일+근로자의+날+안쉼.&=flag&=오라클&ta=ujetyr
	String txtParam = request.getParameter("txt");//<input type="txt" name="txt"
	String passParam = request.getParameter("pass");//<input type="password" name="pass"
	String fileParam = request.getParameter("file");//<input type="file" name="file"
	String hidParam = request.getParameter("hid");//<input type="hidden" name="hid"
	String flagParam = request.getParameter("flag");//<input type="checkbox" name="flag"
	String selParam = request.getParameter("sel");//<select name="sel"
	String taParam = request.getParameter("ta");//<textarea name="ta"


// 	if("POST".equals(request.getMethod())){ //요청방식이 POST일때,,, 
// 		txtParam = new String(txtParam.getBytes("8859_1"), "UTF-8");
// 	}//end if
	
%>

<div>

<div id="divParam">
<table class="table table-hover">

<thead>
<th colspan="2">request내장객체를 사용한,,, HTML Form Control입력값</th>
</thead>

<tbody>
<tr>
<%-- 다양한 encoding 방식들~~~ --%>
<%-- <td>type="text"</td><td><%= txtParam%></td> --%>
<%-- <td>type="text"</td><td><%= URLDecoder.decode(txtParam, "UTF-8")%></td> --%>
<%-- <td>type="text"</td><td><%= URLDecoder.decode( URLEncoder.encode(txtParam, "8859_1"), "UTF-8") %></td> --%>
<%-- <td>type="text"</td><td><%= new String(txtParam.getBytes("8859_1"), "UTF-8") %></td> --%>
<td>type="text"</td><td><%= txtParam %></td>
</tr>
<tr>
	<td>type="password"</td><td><%= passParam%></td>
</tr>
<tr>
	<td>type="file"</td><td><%= fileParam%></td>
</tr>
<tr>
	<td>type="hidden"</td><td><%= hidParam%></td>
</tr>
<tr>
	<td>type="checkbox"</td><td><%= flagParam%></td>
</tr>
<tr>
	<td>&lt;select&gt;</td><td><%= selParam%></td>
</tr>
<tr>
	<td>&lt;textarea&gt;</td><td><%= taParam%></td>
</tr>

</tbody>

<tfoot>
</tfoot>

</table>


<a href ="javascript:history.back()" class="btn btn-danger">뒤로가기</a><br>
</div><!--divParam-->


</div><!--container-->
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