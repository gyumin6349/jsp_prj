package kr.co.sist.board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

//무조건 생성자로 만 사용
@AllArgsConstructor
@Getter
@Setter
public class PaginationDTO {
	private int pageNumber, currentPage, totalPage;
	private String url, field, keyword;
}
