<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/jsp/site_config.jsp"%>
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
	$("#btn").click(function(){
		var blockExt=["jpg", "gif", "png", "bmp"];
		
		var blockFlag=false;
		var ext=$("#upfile").val();
		var getExt=ext.substring(ext.lastIndexOf(".")+1);
		for(var i =0; i< blockExt.length; i++){
			if(blockExt[i] == getExt.toLowerCase()){
				blockFlag=true;
				break;
			}
		}
		
		if(!blockFlag){
			alert("업로드 가능한 파일이 아닙니다. jpg, gif, png, bmp만 가능");
			return;
		}
		
		$("#frm").submit();
		
		
	});
   });//ready
</script>
</head>
<body>
   <header data-bs-theme="dark">
      <c:import url="${url }/common/jsp/header.jsp" />
   </header>
   <main>
      <div id="container">
      <!-- RFC 1867 HTML Form Based File Upload -->
      <form id="frm" action="upload_process.jsp" method="post" enctype="multipart/form-data">
      <label>업로더</label>
      <input type="text" name="uploader" id="uploader"/><br>
      <label>파일</label>
      <input type="file" name="upfile" id="upfile"/>
      <input type="button" value="업로드" class="btn btn-success btn-sm" id="btn"/>
      
      </form>
      </div>
   </main>
   <footer class="text-body-secondary py-5">
      <c:import url="${url}/common/jsp/footer.jsp" />
   </footer>
</body>
</html>