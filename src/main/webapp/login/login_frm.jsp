<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ include file="../common/jsp/site_config.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
	
<!-- favicon 설정 -->
<link rel="shortcut icon" href="http://192.168.10.89/jsp_prj/common/images/favicon.ico"/>
<!--  bootstrap CDN -->
<link rel="stylesheet" type="text/css"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.145.0">
    <title>로그인 폼</title>
 
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sign-in/">

    <script src="color-modes.js"></script>

<!--     <link href="bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7"> -->
    <link href="bootstrap.min.css" rel="stylesheet">

   
<meta name="theme-color" content="#712cf9">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }

      .bd-mode-toggle {
        z-index: 1500;
      }

      .bd-mode-toggle .bi {
        width: 1em;
        height: 1em;
      }

      .bd-mode-toggle .dropdown-menu .active .bi {
        display: block !important;
      }
    </style>

    <!-- Custom styles for this template -->
    <link href="sign-in.css" rel="stylesheet">
  </head>
  <body class="d-flex align-items-center py-4 bg-body-tertiary">


<script type="text/javascript">
window.onload=function(){
	document.getElementById("floatingInput").addEventListener("keyup",enter);
	document.getElementById("floatingPassword").addEventListener("keyup",enter);
	document.getElementById("btnLogin").addEventListener("click",chkNull);

}

function enter(evt){
	//alert(evt.which+" / "+evt.keyCode)s
	if(evt.which==13){//엔터가 눌려지면
		chkNull();
	}//end if
	
}

function chkNull(){
	
		var obj=document.loginFrm;
		var id=obj.id.value;
		var pass=obj.pass.value;

		if(id == ""){
			alert("아이디는 필수 입력 입니다.");
			obj.id.focus();
			return;
		}//end if
		if(pass == ""){
			alert("비밀번호는 필수 입력 입니다.");
			obj.pass.focus();
			return;
		}//end if
		
		loginProcess( id, pass);
		
	//document.getElementById("output").innerHTML=evt.which;
}

function loginProcess(id, pass){
	var param={id:id, pass:pass };
	$.ajax({
		url:"login_process.jsp",
		type:"POST",
		data: param,
		dataType:"JSON",
		error:function( xhr ){
			alert("로그인작업이 정상적으로 수행되지 않았습니다.\n잠시 다시시도해주세요.");
			console.log( xhr.status );
		},
		success:function( jsonObj ){
			if( jsonObj.loginResult ){
				location.href="${url}/day0513/index.jsp";
			}else{
				var output = "<img src='images/login_fail.jpg' style='width:200px'";
				output+="<br>아이디나 비밀번호를 확인해주세요.";
				$("#loginFail").html(output);
				return;
			}
		}
		
	});//ajax
}//loginProcess
</script>
    

    
<main class="form-signin w-100 m-auto">
  <form name="loginFrm" action="#void">
    <h1 class="h3 mb-3 fw-normal">로그인</h1>

    <div class="form-floating">
      <input type="text" class="form-control" value="shjobo3" name="id" id="floatingInput" placeholder="아이디">
      <label for="floatingInput">아이디</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" value="tla1120" name="pass" id="floatingPassword" placeholder="비밀번호">
      <label for="floatingPassword">비밀번호</label>
    </div>
	<div id="loginFail"></div>
    <button class="btn btn-primary w-100 py-2" id="btnLogin" type="button">로그인</button>
    <p class="mt-5 mb-3 text-body-secondary">&copy;안녕하세요</p>
  </form>
</main>

    </body>
</html>
 
