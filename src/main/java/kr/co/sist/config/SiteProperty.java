package kr.co.sist.config;


public class SiteProperty {
	private static SitePropertyVO sVO=SitePropertyVO.getInstance();
	
	private SiteProperty() {
		
	}
	
	public static String SITE_NAME=sVO.getSite_name();
	public static String SITE_VERSION=sVO.getSite_version();
	public static String SITE_INFO=sVO.getSite_info();
	public static String PROTOCOL=sVO.getProtocol();
	public static String SERVER_NAME=sVO.getServer_name();
	public static String SERVER_PORT=sVO.getServer_port();
	public static String SERVLET_PATH=sVO.getServlet_path();
	public static String LOGO_IMG=sVO.getLogo_img();
	public static String UPLOAD_PATH=sVO.getUpload_path();

}
