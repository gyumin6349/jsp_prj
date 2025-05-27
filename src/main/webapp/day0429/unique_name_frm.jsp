<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="입력값을 받는,,, 폼"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TITLE</title>

<!-- favicon 설정 -->
<link rel="shortcut icon" href="http://192.168.10.89/jsp_prj/common/images/favicon.ico"/>
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
	
	$("#btnGet").click(function(){
		//전송하기 전에,,, 입력값에대한 유효성검증
		$("#frmGet").submit();//submit
	});//click
	
	$("#btnPost").click(function(){
		//전송하기 전에,,, 입력값에대한 유효성검증
		$("#frmPost").submit();//submit
	});//click
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
  <div class="navbar navbar-dark bg-dark shadow-sm" >
    <div class="container" >
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

<div>
<h3>name속성에 이름이 유일한 HTML Form Control 값 전달 ( GET방식 )</h3>
<form name="frmGet" id="frmGet"
action="http://192.168.10.89/jsp_prj/day0430/unique_name_process.jsp"
method="GET">
<ul><!-- autofocus="autofocus": 커서를 HTML Form Control 위치 시킬때 -->
<li><label>text</label><input type="text" name="txt" autofocus="autofocus"/></li>
<li><label>password</label><input type="password" name="pass"/></li>
<li><label>file</label><input type="file" name="file"/></li>
<li><label>hidden</label>
	<input type="hidden" name="hid" value="5월 1일 근로자의 날 안쉼."/></li>
<li><label>checkbox</label>
	<input type="checkbox" name="flag" value="flag"/></li>
<li><label>select</label>
	<select name="sel">
		<option value="자바">자바</option>
		<option value="오라클">Oracle</option>
		<option value="JDBC">JDBC</option>
		<option value="HTML">HTML</option>
	</select>
</li>
<li><label>textarea</label>
<textarea name="ta"></textarea>
</li>
<li>
<input type="button" value="GET전송" class="btn btn-success" id="btnGet"  />
</li>
</ul>
</form>
</div>

<div>
<h3>name속성에 이름이 유일한 HTML Form Control 값 전달 ( POST방식 )</h3>
<form name="frmPost" id="frmPost"
action="../day0430/unique_name_process.jsp"
method="POST">
<ul><!-- autofocus="autofocus": 커서를 HTML Form Control 위치 시킬때 -->
<li><label>text</label><input type="text" name="txt" autofocus="autofocus"/></li>
<li><label>password</label><input type="password" name="pass"/></li>
<li><label>file</label><input type="file" name="file"/></li>
<li><label>hidden</label>
	<input type="hidden" name="hid" value="5월 1일 근로자의 날 안쉼."/></li>
<li><label>checkbox</label>
	<input type="checkbox" name="flag" value="flag"/></li>
<li><label>select</label>
	<select name="sel">
		<option value="자바">자바</option>
		<option value="오라클">Oracle</option>
		<option value="JDBC">JDBC</option>
		<option value="HTML">HTML</option>
	</select>
</li>
<li><label>textarea</label>
<textarea name="ta"></textarea>
</li>
<li>
<input type="button" value="POST전송" id="btnPost" class="btn btn-success" />
</li>
</ul>
</form>
</div>



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