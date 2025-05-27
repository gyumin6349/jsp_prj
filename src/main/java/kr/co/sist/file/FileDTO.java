package kr.co.sist.file;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FileDTO {
	private String fileName;
	private long length;
	private Date lastModified;

}//class
