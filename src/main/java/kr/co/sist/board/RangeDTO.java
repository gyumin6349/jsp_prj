package kr.co.sist.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString 
public class RangeDTO{
	private String field, keyword; //검색 필드, 키워드
	private int currentPage=1, startNum, endNum;//현재 페이지, 시작번호, 끝번호
	
	private String[] fieldText= {"제목", "내용", "작성자"};
	
	
	public String getFieldName() {
		String fieldName = "subject";
		if("1".equals(field)) {
			fieldName="content";
		}
		if("2".equals(field)) {
			fieldName="id";
		}
		return fieldName;
	}
}
