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
 
<script type="text/javascript">
$(function(){

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
	
	<iframe src="scrollbar.html" 
	style="border: 0px; width: 1420px;height: 200px"></iframe>
	
	
	<form>
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" readonly="readonly" 
					class="inputBox" style="width: 160px">
					<input type="button" value="ID중복확인" class="btnBox">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" class="inputBox" style="width: 200px">
					비밀번호 확인
					<input type="password" class="inputBox" style="width: 200px">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td colspan="3"><input type="text" class="inputBox" style="width: 150px"></td>
			</tr>
			<tr>
				<th>생일</th>
				<td colspan="3"><input type="text" class="inputBox"  style="width: 130px"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td colspan="3"><input type="text" class="inputBox" style="width: 130px"></td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td colspan="3"><input type="text" class="inputBox" style="width: 130px">
					<input type="checkbox">수신</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="3">
				<input type="text" class="inputBox"  style="width: 250px">@<input type="text"
					list="domainData"  class="inputBox" style="width: 160px"> 
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
			<input type="text" readonly = "readonly" class="inputBox" style="width: 50px">
			<input type="button" value = "우편번호검색" class="btnBox">
			</td>
			</tr>
			
			<tr>
			<th>주소</th>
			<td>
				<input type="text" readonly = "readonly" class="inputBox" style="width: 500px"><br>
				<input type="text" class="inputBox" style="width: 500px">
			</td>
			</tr>
			<tr>
				<th>자기소개</th>
				<td>
				<textarea style="width: 500px;height: 100px"></textarea>
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