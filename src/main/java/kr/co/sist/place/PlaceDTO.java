package kr.co.sist.place;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString 
public class PlaceDTO{
	private String field, keyword; //검색 필드, 키워드
	private int currentPage=1, startNum, endNum;//현재 페이지, 시작번호, 끝번호
	
	private String[] fieldText= {"가게이름", "메뉴", "작성자"};
	
	
	public String getFieldName() {
		String fieldName = "restaurant";
		if("1".equals(field)) {
			fieldName="menu";
		}
		if("2".equals(field)) {
			fieldName="id";
		}
		return fieldName;
	}
}
