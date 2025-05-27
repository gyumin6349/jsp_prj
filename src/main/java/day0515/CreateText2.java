package day0515;

import java.io.FileWriter;
import java.io.IOException;

public class CreateText2 {

	public static void main(String[] args) {
		String msg="내이름은<strong>심규민</strong>입니다\r\n"
				+ "<img src=\"http://localhost/jsp_prj/common/images/img_2.jpg\"> ";
		try {
			FileWriter fw = new FileWriter("C:/dev/workspace/jsp_prj/src/main/webapp/day0515/ajax.html");
			fw.write(msg);
			fw.flush();
			if(fw!=null) {fw.close();}//end if 
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	

}
