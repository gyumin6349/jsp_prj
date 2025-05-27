<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="application/octet-stream; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%@ include file="../common/site_config.jsp" %>     --%>
<%-- <%@ include file="../common/jsp/login_chk.jsp" %> --%>

<%
	String fileName = request.getParameter("fileName");//파일명은 영어, 한글은 다운안된다~
	String downfile=fileName;
	System.out.println("fileName: "+fileName);
	fileName=URLEncoder.encode(fileName, "UTF-8");
	//2. 응답헤더를 변경한다.
	response.setHeader("Content-Disposition", "attachement;fileName="+ fileName);
	
	//3. 다운로드할 파일의 정보를 얻기 
	File file=new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload/"+fileName);
	System.out.println("file: "+file);
	
	if( file.exists()){//파일이 존재하면,,,
		
		//파일에 읽기스트림을 연결한다 
		FileInputStream fis = new FileInputStream( file );
		//파일을 응답하기위한 스트림 얻기
		OutputStream os = response.getOutputStream();
		
		//파일에서 읽어들인 내용을 저장하기위한 배열 생성
		byte[] readData = new byte[1024]; 
		int readSize =0;
		while((readSize=fis.read(readData)) != -1){
			os.write(readData , 0, readSize);
		}
		os.flush();

		//출력스트림 초기화
		out.clear();
		out = pageContext.pushBody();
	}//end if
	
	//5. 읽어들인파일을 저장할 배열을 생성하고, 파일에서 읽어들여 출력스트림으로 출력한다
		
	

	
	
%>
