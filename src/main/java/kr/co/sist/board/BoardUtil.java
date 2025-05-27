package kr.co.sist.board;

public class BoardUtil {
	private BoardUtil() {
		
	}
	
	/**
	 * 쪽번호 [&lt&lt;]...[1][2][3]...[&gt;&gt]를 생성하는 메서드<br>
	 * pageNumber - 생성한 인덱스 수, 
	 * currentPage - 사용자가 보고 있는 현재 페이지, 
	 * totalPage - 게시글의 총페이지 수 ;
	 * url - 이동할 URL,
	 * field - 검색 필드 (제목, 내용 , 작성자), 
	 * keyword - 검색 키워드
	 * 를 pDTO로 입력 받아서<br>
	 * @param pDTO
	 * @return
	 */
	public static String pagination(PaginationDTO pDTO) {
		StringBuilder searchQueryString=new StringBuilder();
		String keyword = pDTO.getKeyword();
		String field= pDTO.getField();
		String url = pDTO.getUrl();
		int currentPage = pDTO.getCurrentPage();
		int pageNumber = pDTO.getPageNumber();
		int totalPage = pDTO.getTotalPage();
		
		if(keyword != null && !keyword.isEmpty()){
			searchQueryString.append("&field=").append(field).append("&keyword=").append(keyword);
		}//endif

		
		
		//int pageNumber=3;//한화면에 보여줄 페이지 인덱스의 수 매개변수로 받음
		
		//2. 화면에 보여줄 시작번호
		int startPage=((currentPage-1)/pageNumber)*pageNumber+1;//1,2,3 => 1
		//3. 화면에 보여줄 마지막번호
		int endPage=(((startPage-1)+pageNumber)/pageNumber)*pageNumber;
		//4. 총 페이지수가 연산된 마지막 페이지 수보다 작다면 총 페이지수가 마지막 페이지수로 설정
		if(totalPage<= endPage){
			endPage=totalPage;	
		}
		//5. 첫페이지가 인덱스 화면 아닌경우
		int movePage=0;
		StringBuilder prevMark = new StringBuilder("[&lt;&lt;]");
		if(currentPage > pageNumber){//시작페이지보다 1적은 페이지로 이동
			prevMark.delete(0, prevMark.length());
			movePage=startPage-1;
			prevMark.append("[<a href='").append(url).append("?currentPage=")
			.append(movePage).append(searchQueryString.toString())
			.append("'>&lt;&lt;</a> ]");
		}
		
		prevMark.append("...");
		//6. 시작페이지 번호부터 끝 페이지 번호까지 화면에 출력
		movePage=startPage;
		StringBuilder pageLink = new StringBuilder();
		//span을 써서 css입히면됨
		while(movePage <= endPage){
			if(movePage == currentPage){//현제 페이지는 링크를 설정하지 않음.
				pageLink.append("[ ")
				.append(currentPage)
				.append("]");
			}else{
				pageLink.append("[ <a href='").append(url).append("?currentPage=")
				.append(movePage).append(searchQueryString.toString())
				.append("'>").append(movePage).append("</a>]");
			}//end else
			movePage++;
		}//end while
			pageLink.append(" ... ");
		//7.뒤에 페이지가 더 있는 경우
		StringBuilder nextMark= new StringBuilder("[&gt;&gt]");
		if(totalPage > endPage){
			nextMark.delete(0, nextMark.length());
			movePage=endPage+1;
			nextMark.append("[ <a href='").append(url).append("?currentPage=")
			.append(movePage)
			.append(searchQueryString.toString()).append("'>&gt;&gt;</a>");
		}
		
		return prevMark.toString()+pageLink.toString()+nextMark.toString();
	}
}
