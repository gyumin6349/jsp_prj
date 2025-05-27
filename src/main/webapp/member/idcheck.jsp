<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>ID 중복 확인</title>
<script type="text/javascript">
function applyId(id) {
	opener.document.getElementById("idValue").value = id;
	window.close();
}
</script>
</head>
<body>
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().isEmpty()) {
%>
	<p>아이디가 전달되지 않았습니다.</p>
<%
	} else {
%>
	<p>아이디 확인: <%= id %></p>
	<button onclick="applyId('<%= id %>')">이 아이디 사용하기</button>
<%
	}
%>
</body>
</html>