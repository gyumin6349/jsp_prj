<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js0418/id_dup.jsp로 만든 html</title>

<!-- bootstrap CDN ( https://getbootstrap.com/docs/5.3/getting-started/introduction/ ) -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
<style type="text/css">
#wrap{ position:relative; margin: 0px auto; width: 502px; height: 303px; }
#background{ height:303px;}

#inputDiv{ width: 324px;  height:303px; position: absolute; top: 110px; left: 24px;}
#btn{ position: absolute; left:250px;} 
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script type="text/javascript">

var idCheckFlag = false;

function moveToParent(){
	if(idCheckFlag){
		var id=document.subFrm.id.value;
		opener.window.document.frm.idInputText.value=id;
		self.close();
	}//end if
}//moveToParent

$(function(){

	$("#btn").click(function(){
		var inputData = document.getElementById("idInput").value;
		
		if( inputData=="" ){
			alert("사용하실 아이디를 입력해주세요");
			return;
		}else{
			alert("입력하신 아이디는 '"+inputData+"' 입니다.");
			/*	혹독한 ID입력값에 대한 유효성 검증 과정을 거친 후,,,	*/
			alert("사용가능한 아이디입니다~~");
			idCheckFlag = true;
			moveToParent();
		}//end if-else
			

	});//click
	
});//ready



</script>

</head>

<body>
<div id=wrap>
	<div id="background">
		<div id="inputDiv">
			<form name="subFrm">
				<label for="id">아이디</label>
				<input type="text" name="id" id="idInput" autofocus="autofocus" placeholder="아이디 입력"/>
				<!--  
				value="${ param.id }"/> 간단하게 EL을 써보았다~ 
				-->
				<input type="button" id="btn" value="중복확인" class="btn btn-primary"/>
			</form>
		</div><!-- inputDiv -->
	</div>
</div>
</body>
</html>