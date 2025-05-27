<%@page import="kr.co.sist.config.SiteProperty"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
 //프로토콜 + 서버네임 + 서버 포트+ 서블렛패스
String url = SiteProperty.PROTOCOL+SiteProperty.SERVER_NAME+SiteProperty.SERVER_PORT+
SiteProperty.SERVLET_PATH;
 
String uploadURL = url+SiteProperty.UPLOAD_PATH;
 
String logo= url+"/common/"+SiteProperty.LOGO_IMG;
 
String site_name=SiteProperty.SITE_NAME;

session.setAttribute("url", url);
session.setAttribute("uploadURL", uploadURL);
session.setAttribute("logo", logo);
session.setAttribute("site_name", site_name);
 
%>
