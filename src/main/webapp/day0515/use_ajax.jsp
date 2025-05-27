<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$('#txt').click(function(){
		$.ajax({
			url:"${url}/day0515/ajax.txt",
			type : "get",
			
			dataType : "text",
			error:function(xhr){
				$("#output").html("에러코드 : "+ xhr.status+", 에러메시지 : "+ xhr.statusText);
			},
			success: function(textData){
				$("#output").html("<strong>"+textData+"</strong>");
			}
			
		});
	});
	
	$("#html").click(function(){
		$.ajax({
			url:"ajax.html",
			type:"get",
			
			dataType:"html",
			error:function(xhr){
				console.log(xhr.status+" / "+xhr.statusText);
			},
			success: function(htmlData){
				$("#output").html(htmlData);
			}
			
			
			
		});
		
	});
	$("#xml").click(function(){
		$.ajax({
			url:"ajax.xml",
			type:"get",
			
			dataType:"xml",
			error:function(xhr){
				console.log(xhr.status);
			},
			success:function(xmlData){
				//xml은 파싱?해서 사용 text형태로
				$("#output").html("이름은 : "+$(xmlData).find("name").text()
						+"<br> 메시지 : "+ $(xmlData).find("msg").text());
			}
		});
	});
	$("#json").click(function(){
		$.ajax({
			url:"ajax.json",
			type:"get",
			//text로 바꾸는게 에러 해결하는 방법 중하나
			//dataType:"text",
			dataType:"json",
			error:function(xhr){
				console.log(xhr.status);
			},
			success:function(jsonObj){
				//alert(jsonObj);
				//jsonobject를 parsing
				$("#output").html("이름 : "+jsonObj.name+"<br> 주소 : "+jsonObj.addr );
				$("#name").val(jsonObj.name);
				$("#addr").val(jsonObj.addr);
			}
		})
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
      <input type="button" value="TEXT" class="btn btn-success" id="txt"/>
      <input type="button" value="HTML" class="btn btn-danger" id="html"/>
      <input type="button" value="XML" class="btn btn-info" id="xml"/>
      <input type="button" value="JSON" class="btn btn-warning" id="json"/>
     
     
      <div id="output"></div>
      </div>
   </main>
   <footer class="text-body-secondary py-5">
      <c:import url="${url}/common/jsp/footer.jsp" />
   </footer>
</body>
</html>