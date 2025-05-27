<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/member_frm.jsp</title>
<jsp:include page="../common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px;}
</style>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<script type="text/javascript">

/*
window.onload = function(event) {
	// 페이지 로드 후 실행할 코드
};
*/
 
window.onload=function(){
	 document.getElementById("btnZipcode").addEventListener("click", findZipcode);// 이벤트와 JS함수명
}//onload

$(function(){

	$("#btnConfirm").click(function(){
		var idCheckFlag = false;
		if(!idCheckFlag){
			alert("아이디 중복확인을 수행해주세요.");
			return;
		}//end if
	});//click
	
	$("#idCheckBtn").click(function(){
		window.open("id_dup.jsp", "id",	"width=502,height=303,left="+(window.screenX+50)+",top="+(window.screenY+50));
		idCheckFlag=true;
	});//click


});//ready


function findZipcode() {
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
            }//end if
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }//end if
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }//end if

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addr").value = roadAddr;
        }
    }).open(); 
}//findZipcode


</script>
</head>
<body>
<header data-bs-theme="dark">
<jsp:include page="../common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
	<h2>회원가입 양식</h2>
	
	<iframe src="scrollbar.html" 
	style="border: 1px solid #333; width: 1420px;height: 200px"></iframe>
	
	
	<form name="frm" method="GET">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="idInputText" readonly="readonly"
					class="inputBox" style="width: 160px">
					<input type="button" value="ID중복확인" class="btnBox" id="idCheckBtn">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" class="inputBox" id="passInputText" style="width: 200px">
					비밀번호 확인
					<input type="password" class="inputBox" style="width: 200px">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td colspan="3"><input type="text" class="inputBox" id="nameInputText" style="width: 150px"></td>
			</tr>
			<tr>
				<th>생일</th>
				<td colspan="3"><input type="text" class="inputBox" id="birthInputText" style="width: 130px"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td colspan="3"><input type="text" class="inputBox" id="contactInputText" style="width: 130px"></td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td colspan="3"><input type="text" class="inputBox" id="callInputText" style="width: 130px">
					<input type="checkbox">수신</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="3">
				<input type="text" class="inputBox" id="emailLeftInputText" style="width: 250px">@<input type="text"
					list="domainData"  class="inputBox" id="emailRightInputText" style="width: 160px"> 
					<datalist id="domainData">
						<option value="선택해주세요.">
						<option value="직접 입력">
						<option value="daum.net">
						<option value="gmail.com">
						<option value="hotmail.com">
						<option value="nate.com">
						<option value="korea.com">
					</datalist> <input type="checkbox">수신</td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" id="gender"
					class="gender" value="남자" checked="checked"><label>남자</label>
					<input type="radio" name="gender" id="gender" class="gender"
					value="여자"><label>여자</label><br></td>
			</tr>
			<tr>
			<th>소재지</th>
			<td><select name="domain" id="domain" size="1" class="inputBox" style="width: 150px">
					<option value="선택해주세요">선택해주세요</option>
					<option value="강원">강원</option>
					<option value="경기">경기</option>
					<option value="경남">경남</option>
					<option value="경북">경북</option>
					<option value="광주">광주</option>
			</select></td>
			</tr>
			<tr>
			<th>우편번호</th>
			<td colspan="3">
			<input type="text" name="zipcode" id="zipcode" style="width: 60px;" readonly="readonly" class="inputBox"/>
			<input type="button" value="우편번호검색" class="btnBox" id="btnZipcode"/><br>
			</td>
			</tr>
			
			<tr>
			<th>주소</th>
			<td>
			<input type="text" name="addr" id="addr" style="width:400px" readonly="readonly"/>
			<input type="text" name="addr2" id="addr2" style="width:400px"/>
			</td>
			</tr>
			<tr>
				<th>자기소개</th>
				<td>
				<textarea style="width: 500px;height: 100px" id="prInputText"></textarea>
				<div style="text-align: right;padding-right: 20px">
				<span>0</span>/500
				</div>
				</td>
			</tr>
			<tr>
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