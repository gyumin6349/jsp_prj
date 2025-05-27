package day0515;

import java.io.FileWriter;
import java.io.IOException;

public class CreateText3 {

	public static void main(String[] args) {
		String msg="<root>\r\n"
				+ "<name>심규민</name>\r\n"
				+ "<msg>내일은 목요일</msg>\r\n"
				+ "</root>";
		try {
			FileWriter fw = new FileWriter("C:/dev/workspace/jsp_prj/src/main/webapp/day0515/ajax.xml");
			fw.write(msg);
			fw.flush();
			if(fw!=null) {fw.close();}//end if 
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	

}
