package kr.co.sist.place;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.board.BoardDAO;
import kr.co.sist.board.BoardDTO;
import kr.co.sist.board.RangeDTO;


public class PlaceService {
	
	/**
	 * 맛집 추가 기능
	 * @param pDTO
	 * @return
	 */
	public boolean writeRestaurant(RestDTO pDTO) {
		boolean flag = false;
		PlaceDAO pDAO = PlaceDAO.getInstance();
		
		try {
			pDAO.insertRestaurant(pDTO);
			flag =true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
	}//writeRestuarant
	
	public List<RestDTO> searchRestaurant(PlaceDTO pDTO){
		List<RestDTO> list = new ArrayList<RestDTO>();
		PlaceDAO pDAO = PlaceDAO.getInstance();
		try {
			list = pDAO.selectRestaurant(pDTO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	/**
	 * 1. 총 레코드의 수 구하기
	 * 
	 * @param pDTO
	 * @return
	 */
	public int totalCount(PlaceDTO pDTO) {
		int cnt = 0;
		PlaceDAO pDAO = PlaceDAO.getInstance();
		try {
			cnt = pDAO.selectTotalCount(pDTO);
			System.out.println(cnt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	/**
	 * 한화면에 보여줄 게시글 수
	 * @return
	 */
	public int pageScale() {
		int pageScale=10;
		return pageScale;
	}
	
	/**
	 * 총 페이지 수 
	 * @param totalCount 총 게시물의 수 
	 * @param pageScale 한화면에 보여줄 게시글의 수 
	 * 게시물 16개 한화면 보여줄 수 10개 총 페이지 수 = 2
	 * @return
	 */
	public int totalPage(int totalCount, int pageScale) {
		int totalPage = 0;
		
		totalPage=(int)Math.ceil((double)totalCount/pageScale);
		
		return totalPage;
	}//totalPage
	
	/**
	 * pagenation을 클릭했을 때의 번호를 사용하여 해당 페이지의 시작번호 구하기
	 * ex)1 - 1 2 = 11 3 = 21 
	 * @param pageScale
	 * @param pDTO
	 * @return
	 */
	public int startNum(int pageScale, PlaceDTO pDTO) {
		int startNum = 1;
		startNum = pDTO.getCurrentPage()*pageScale-pageScale+1;
		pDTO.setStartNum(startNum);
		return startNum;
	}
	
	public int endNum(int pageScale, PlaceDTO pDTO) {
		int endNum = 0;
		endNum = pDTO.getStartNum()+pageScale -1;
		
		pDTO.setEndNum(endNum);
		return endNum;
	}
	
	public RestDTO searchOneRestaurant(int num) {
		RestDTO rDTO = null;
		PlaceDAO pDAO = PlaceDAO.getInstance();
		try {
		rDTO=pDAO.selectOneRest(num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rDTO;
	}//searchOneBoard
}
