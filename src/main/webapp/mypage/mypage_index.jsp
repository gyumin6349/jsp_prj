<%@page import="kr.co.sist.member.MemberDTO"%>
<%@page import="kr.co.sist.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" info=""%>
<%@ include file="../common/jsp/site_config.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../common/jsp/login_chk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }"/></title>
<c:import
   url="${url }/common/jsp/external_file.jsp" />

<style type="text/css">
#container {
   min-height: 600px;
   margin-top: 30px;
   margin-left: 20px
}
</style>

<script type="text/javascript">
   $(function() {
	$("#btnImg").click(function(){
			$("#profileImg").click();

   });//ready
	
   
		$("#profileImg").change(function(evt){
			//선택한 파일이 이미지인지 체크
			//$("#imgName").val($("#profileImg").val());
			//이벤트 발생시킨 file객체를 얻는다.
			var file=evt.target.files[0];
			//스트림 생성	
			var reader = new FileReader();
			//FileReader 객체의 onload event handler 설정
			reader.onload=function(evt){
				$("#img").prop("src", evt.target.result);
			}
			
			//파일을 읽어들여 img 설정 //미리보기
 			reader.readAsDataURL(file);
			

// 			var blockExt=["jpg","gif","png","bmp"];
// 			var ext=$("#profileImg").val();
// 			var ext2=ext.substring(ext.lastIndexOf(".")+1);
// 			var blockFlag=false;
			
// 			for(var i=0; i<blockExt.length; i++){//배열 돌려고,,,
// 				if(ext2==blockExt[i]){
// 					blockFlag=true;
// 					break;//찾으면 break
// 				}//end if	
// 			}//end for
			
// 			if(!blockFlag){//결과 처리
// 				alert("이미지만~~~");
// 				return;
// 			}else{
//				reader.readAsDataURL(file);
			//}//end if
							
   		});//ready

			$("#btnUpdate").click(function(){
 				var uploadFlag = $("#img")[0].src.lastIndexOf("default.jpg") == -1;
				if(confirm("회원 정보를 수정하시겠습니까?")){
					
				if(uploadFlag){					
					//AJAX FileUpload
					//1. input type="file"을 가진 <form>을 얻어서 
					var frm=$("#frm")[0];//parameter 전송방식 : 파일업로드 x
					var formData= new FormData(frm); //binary전송방식 : 파일 업로드 방식
					alert(formData);
					$.ajax({
						url:"profile_upload.jsp",
						contentType: false,
						processData : false,
						type : "POST",
						data : formData,
						dataType:"JSON",
						error:function(xhr){
							console.log(xhr.status);
						},
						success:function(jsonObj){
							if(jsonObj.resultFlag){
							$("#imgName").val(jsonObj.fileName);
							
// 							console.log(jsonObj.fileName)
							$("#frm").submit();
							}else{
								console.log("프로필 이미지 업로드 x");					
								}
							}
					});//ajax
				}//이미지 업로드
				}				
				
			});
			
   });
</script>
</head>
<body>
   <header data-bs-theme="dark">
      <c:import url="${url }/common/jsp/header.jsp" />
   </header>
   <main>
      <div id="container">
      <%
      	String id =((LoginResultDTO)session.getAttribute("userData")).getId();
      
      MemberService ms = new MemberService();
      MemberDTO mDTO = ms.searchOneMember(id);
      if(mDTO == null){
    	  response.sendRedirect("http://localhost/jsp_prj");
    	  return;
      }
      pageContext.setAttribute("mDTO", mDTO);
      %>
      <div>
      
      <h3>마이페이지</h3>
<!--       // enctype="multipart/form-data" 이거 있으면 파일의 파라미터 값이 전달이 안돼-->
<form action="mypage_process.jsp" method="post" name="frm" id="frm">
  <div style="display: flex; align-items: flex-start; gap: 30px;">
  
    <!-- ✅ 왼쪽: 프로필 이미지 -->
    <div>
      <img src="${mDTO.profile_img eq 'default.jpg'?"../common/images" : uploadURL }/${mDTO.profile_img}" style="width: 130px; height: 140px" id="img" />
      <br>
      <input type="button" value="이미지선택" id="btnImg" class="btn btn-info btn-sm" />
      <input type="hidden" name="imgName" id="imgName" />
      <input type="file" style="display:none" name="profileImg" id="profileImg" />
    </div>

    <!-- ✅ 오른쪽: 개인정보 -->
    <table>
      <tr>
        <td>이름</td>
        <td><c:out value="${mDTO.name}" /></td>
      </tr>
      <tr>
        <td>생년월일</td>
        <td><input type="date" name="birth" value="${mDTO.birth}" /></td>
      </tr>
      <tr>
        <td>전화번호</td>
        <td><input type="text" name="tel" value="${mDTO.tel}" /></td>
      </tr>
      <tr>
        <td>성별</td>
        <td>
          <input type="radio" name="gender" value="남자" ${mDTO.gender eq '남자' ? "checked='checked'" : ""} /> 남자
          <input type="radio" name="gender" value="여자" ${mDTO.gender eq '여자' ? "checked='checked'" : ""} /> 여자
        </td>
      </tr>
      <tr>
        <td>가입시 사용된 ip address</td>
        <td><c:out value="${mDTO.ip}" /></td>
      </tr>
      <tr>
        <td>가입 일</td>
        <td><fmt:formatDate value="${mDTO.input_date}" pattern="yyyy-MM-dd a EEEE HH:mm" /></td>
      </tr>
      <tr>
        <td colspan="2" style="text-align: center">
          <input type="button" value="정보변경"  id="btnUpdate" class="btn btn-danger btn-sm">
        </td>
      </tr>
    </table>

  </div>
</form>
      </div>
      </div>
   </main>
   <footer class="text-body-secondary py-5">
      <c:import url="${url}/common/jsp/footer.jsp" />
   </footer>
</body>
</html>