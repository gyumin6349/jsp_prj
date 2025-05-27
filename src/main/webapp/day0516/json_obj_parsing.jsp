<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
    
 <%@ include file="../common/jsp/site_config.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }"/></title>
<c:import url="${ url }/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
</style>

<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$.ajax({
			url:"../day0515/json_obj2.jsp",
			type:"GET",
			dataType:"JSON",
			error:function(xhr){
				alert("문제발생; 잠시 후 다시 시도");
				console.log(xhr.status);
			},
			success:function(jsonObj){
				//부가적이 정보
				$("#deptCnt").html(jsonObj.dataLength);
				$("#createDate").html(jsonObj.putDate);
				
				$("#deptTab tbody").empty();
				//데이터
				if(!jsonObj.resultFlag){
					$("#deptTab tbody").append(
				"<tr><td colspan='3'>부서정보가 존재하지 않습니다.</td></tr>");
				}//end if
				
				$.each(jsonObj.data, function(i, jsonTemp){
					createTr = "<tr><td><a href='javascript:searchEmp(" + 
					jsonTemp.deptno + ")'>" + jsonTemp.deptno + "</a></td><td>" + 
					jsonTemp.dname + "</td><td>" + jsonTemp.loc + "</td></tr>";
					
					$("#deptTab > tbody").append(createTr);
				});
				
			}//success
		});//ajax
	})//click
});//ready

function searchEmp(deptno){
	var param={deptno:deptno};
	$.ajax({
		url:"${url}/day0516/ajax_emp_json.jsp",
		type:"post",
		data:param,
		dataType:"JSON",
		error:function(xhr){
			alert("잠시 후 다시 시도.")mc
			console.log(xhr.status);
		},
		success:function(jsonObj){
				
			$("#deptno").html(deptno);	
			
			$("#empTab tbody").empty();
			if(!jsonObj.resultFlag){
				$("#empTab tbody").append(
			"<tr><td colspan='6'>부서정보가 존재하지 않습니다.</td></tr>");
			}//end if
		
			var result="";
			$.each(jsonObj.data, function(i, jsonTemp) {
			    result += "<tr><td>"+(i+1)+"</td><td>"+jsonTemp.empno+"</td><td>"+jsonTemp.ename+"</td><td>"
			        + jsonTemp.job + "</td><td>" + jsonTemp.hiredate + "</td><td>" + jsonTemp.sal + "</td></tr>";
			});
			$("#empTab tbody").append(result);
		}
		
	});
}

</script>
</head>
<body>
<header data-bs-theme="dark">
 <c:import url="${ url }/common/jsp/header.jsp"/>

</header>
<main>
<div id="container">
<input type="button" value="부서정보조회" class="btn btn-success" id="btn"/>
<div>
<strong>부서 수</strong> : <span id="deptCnt"></span><br>
<strong>데이터 생성일</strong> : <span id="createDate"></span><br>
</div>

<div style="width:360px">
<table id="deptTab" class="table table-hover">
<thead>
<tr>
<th style="width:60px">번호</th>
<th style="width:60px">부서번호</th>
<th style="width:60px">위치</th>
</tr>
</thead>
<tbody>
<tr>

</tr>

</tbody>
</table>
</div>
<div style="height:400px">
<h2>[<span id="deptno"></span>]번 부서 사원 정보</h2>
<div style="width:650px">
<table id="empTab" class="table table-hover">
<thead>
<tr>
<th style="width:60px">번호</th>
<th style="width:60px">사원번호</th>
<th style="width:60px">사원명</th>
<th style="width:60px">직무</th>
<th style="width:60px">입사일</th>
<th style="width:60px">연봉</th>
</tr>
</thead>
<tbody>
<tr>

</tr>

</tbody>
</table>
</div>
</div>

</div>
</main>
<footer class="text-body-secondary py-5">
 <c:import url="${ url }/common/jsp/footer.jsp"/>

</footer>


</body>
</html>