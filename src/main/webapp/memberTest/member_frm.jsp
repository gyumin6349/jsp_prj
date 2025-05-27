<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function findZipcode() {
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addr").value = roadAddr;
            document.getElementById("addr2").focus();
            // document.getElementById("addr2").value = data.jibunAddress;
            
           
        }
    }).open();
}

	



$(function(){

	$('#chkID').click(function() {
	    var left = window.screenX + 200;
	    var top  = window.screenY + 150;
	    window.open('id_dup.jsp', 'id', 'width=512,height=313,left=' + left + ',top=' + top);
	  });
	
	

	  $('#chkPass').blur(function() {
	    var pass    = $('#pass').val();
	    var chkPass = $('#chkPass').val();
	    if (pass !== chkPass) {
	      alert('비밀번호가 일치하지 않습니다.');
	      $('#pass, #chkPass').val('');
	      $('#pass').focus();
	    }
	  });

	  $('#btnZipcode').click(findZipcode);

	  $('#selfIntro').keyup(function() {
	    var text = $(this).val();
	    if (text.length > 500) {
	      alert('500자 초과');
	      $(this).val(text.substring(0, 500));
	    }
	    $('#wordCount').text($(this).val().length);
	  });
	
	  
	  $('#btnConfirm').click(function() {
		    if ($('[name="id"]').val() == "") {
		      alert('아이디는 필수 입력입니다.');
		      $('[name="id"]').focus(); return;
		    }
		    if ($('[name="pass"]').val() == "") {
		      alert('비밀번호는 필수 입력입니다.');
		      $('[name="pass"]').focus(); return;
		    }
		    if ($('[name="name"]').val() == "") {
		      alert('이름은 필수 입력입니다.');
		      $('[name="name"]').focus(); return;
		    }
		    if ($('[name="tel"]').val() == "") {
		      alert('휴대폰은 필수 입력입니다.');
		      $('[name="tel"]').focus(); return;
		    }
		    if ($('[name="tel"]').val().length <11) {
			      alert('휴대폰 번호는 11글자 이상 필수 입력입니다.');
			      $('[name="tel"]').focus(); return;
			    }
		    
		    if ($('[name="email"]').val() == "") {
		      alert('이메일은 필수 입력입니다.');
		      $('[name="email"]').focus(); return;
		    }
		    if ($('[name="zipcode"]').val() == "") {
		      alert('우편번호는 필수 입력입니다.');
		      $('[name="zipcode"]').focus(); return;
		    }
		    if ($('[name="addr"]').val() == "") {
		      alert('주소는 필수 입력입니다.');
		      $('[name="addr"]').focus(); return;
		    }
		    
		    $("#frm").submit();
		  });
	  
	  $("#id").keyup(function(evt){
		  
		  var id=$("#id").val();
		  if(id.length>5){
			  var param= {id : id};
			  $.ajax({
				  url:"ajax_id_dup.jsp",
			  	  type:"get",
			  	  data:param,
			  	  dataType:"JSON",
			  	  error:function(xhr){
			  		  alert("버튼 눌러 팝업창으로 중복 검사 ㄱㄱ");
			  		  console.log(xhr.status);
			  	  },
			  	  success:function(jsonObj){
			  		  var msg="이미 사용중";
			  		  var color="#FF0000";
			  		  if(jsonObj.idFlag){
			  			  msg="사용가능"
			  			  color="#0000FF";
			  		  }
			  		  
			  		  var output="<span style='color:"+color+"'>"+msg+"</span>";
			  		  $("#idOutput").html(output);  
			  	  }

			  })//ajax
		  }else{
			  $("#idOutput").html("아이디 검증하셈");
		  }
		  
	  });//keyup
	
});//ready


</script>
</head>
<body>
<header data-bs-theme="dark">
<jsp:include page="../common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
	<h2>회원가입 양식</h2>
	
	<iframe src="../member/scrollbar.html" 
	style="border: 0px; width: 1420px;height: 200px"></iframe>
	
	
	<form action="member_process.jsp" name="frm" id="frm" method="post">
		<table>
			<tr>
				<th>* 아이디</th>
				<td><input type="text" name="id" id="id" maxlength="20" class="inputBox" style="width:120px"> 
				<input type="button" value="ID중복확인" class="btnBox" id="chkID">
				<br>
				<div id="idOutput"></div>
				</td>
				
			</tr>
			<tr>
				<th>* 비밀번호</th>
				<td>
				<input type="password" class="inputBox" style="width:200px" id="pass" name="pass">
					비밀번호 확인
				<input type="password" class="inputBox" style="width:200px" id="chkPass" name="chkPass">
				</td>
			</tr>
			<tr>
				<th>* 이름</th>
				<td colspan="3"><input type="text" class="inputBox" style="width:150px" name="name"></td>
			</tr>
			<tr>
				<th>생일</th>
				<td colspan="3"><input type="text" class="inputBox" style="width:150px" name="birth"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td colspan="3"><input type="text" class="inputBox" style="width:130px" name="tel2"></td>
			</tr>
			<tr>
				<th>* 휴대폰</th>
				<td colspan="3"><input type="text"  name="tel" class="inputBox" style="width:130px" maxlength="13"><input
					type="checkbox" name ="reception">수신</td>
			</tr>
			<tr>
				<th>* 이메일</th>
				<td colspan="3"><input type="text" name="email" class="inputBox" style="width:250px">@
				<input type="text"
					list="domain" class="inputBox" style="width:150px" name="domain"> <datalist id="domain">
						<option value="선택해주세요.">
						<option value="직접 입력">
						<option value="daum.net">
						<option value="gmail.com">
						<option value="hotmail.com">
						<option value="nate.com">
						<option value="korea.com">
					</datalist> <input type="checkbox" name="reception2">수신</td>
			</tr>
			<tr>
				<th>* 성별</th>
				<td>
					<input type="radio" name="gender" class="gender" 
						value="남자" checked="checked"><label>남자</label>
					<input type="radio" name="gender"  class="gender"
						value="여자"><label>여자</label><br>
				</td>
			</tr>
			<tr>
			<th>소재지</th>
			<td><select name="region" id="region" size="1" style="height:32px; width:160px">
					<option value="선택해주세요">선택해주세요</option>
					<option value="강원">강원</option>
					<option value="경기">경기</option>
					<option value="경남">경남</option>
					<option value="경북">경북</option>
					<option value="광주">광주</option>
			</select></td>
			</tr>
			<tr>
			<th>* 우편번호</th>
			<td colspan="3"><input type="text" name="zipcode" id="zipcode" readonly = "readonly" class="inputBox" style="width:60px">
			<input type="button" value = "우편번호검색" id="btnZipcode"></td>
			</tr>
			
			<tr>
			<th>* 주소</th>
			<td><input type="text" id="addr" name="addr" readonly = "readonly" class="inputBox" style="width:500px"><br>
				<input type="text" id="addr2" name= "addr2" class="inputBox" style="width:500px"/></td>
			</tr>
			<tr>
				<th>자기소개</th>
				<td>
				<textarea style="width:500px;height:100px" id="intro" name="intro"></textarea> 
				<div style="text-align:right;padding-right:20px;"> 
				<span id="wordCount">0</span>/500
				</div>
				</td>
				
			</tr>
			
			<tr >
				<td colspan="2" align="center">
					<input type="button" value="확인" id="btnConfirm"/>
					<input type="button" value="취소" id="btnCancel"/>
				</td>
			</tr>
			</table>
	</form>

</div>
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>


</body>
</html>	