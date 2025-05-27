package day0515;

import java.io.FileWriter;
import java.io.IOException;

public class CreateText {

	public static void main(String[] args) {
		String msg="AJAX 동작 쉽지안헨";
		try {
			FileWriter fw = new FileWriter("C:/dev/workspace/jsp_prj/src/main/webapp/day0515/ajax.txt");
			fw.write(msg);
			fw.flush();
			if(fw!=null) {fw.close();}//end if 
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	

}
