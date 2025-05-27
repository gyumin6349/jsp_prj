<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 확인</title>
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
<style type="text/css"> 
  #wrap { position:relative; margin:0 auto; }
  #background { width:502px; height:353px; background: #FFFFFF url(http://192.168.10.89/html_prj/js0418/images/id_background.png) no-repeat; }
  #inputDiv { width:324px; position:absolute; top:100px; left:50px; }
  #inputDiv2 {
    width: 100%;
    position: absolute;
    top: 180px;
    left: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 10px;
  }
</style>

<script type="text/javascript">
$(function() {
	$('#btn2').css("display", "none");
	
  // 중복확인 버튼 클릭
  $('#btn').click(function() {
    const id = $('input[name="id"]').val();
    $('#showID').text(id);
    alert(id+"는 사용가능한 아이디 입니다!!!");
    $('#showID').css("font-size", "48");
    $('#showID').css("font-weight", "bold");
    $('#showID').css("color", "blue");
    
    $('input[name="id"]').val('');
   
    $('#btn2').css("display", "block");
  });

  // 사용 버튼 클릭
  $('#btn2').click(function() {
    const id = $('#showID').text();
    if (id === "") {
      alert("값을 입력해주세요");
      return;
    }
    opener.document.frm.id.value = id;
    window.close();
  });
});
</script>
</head>
<body>
<div id="wrap">
  <div id="background">
  
    <div id="inputDiv">
      <form name="subFrm">
        <label for="id">아이디</label>
        <input type="text" name="id" id="id" autofocus="autofocus"/>
       
        <input type="button" value="중복확인" class="btn btn-primary btn-sm" id="btn"/><br>
      </form>
    </div><!-- inputDiv -->
    
    <div id="inputDiv2">
      <form name="subFrm2">
        <span id="showID"></span>
        <input type="button" value="사용" class="btn btn-success btn-sm" id="btn2"/>
      </form>
    </div><!-- inputDiv2 -->
    
  </div><!-- background -->
</div><!-- wrap -->
</body>
</html>