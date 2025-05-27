package day0512;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

public class ProductService {

	
	public List<ProductDTO> searchPrd(){
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		if(new Random().nextBoolean()) {
			list.add(new ProductDTO(1, "I_001", "키보드", "img_1.jpg", 135000, new Date()));
			list.add(new ProductDTO(2, "I_002", "마우스", "img_2.jpg", 25000, new Date()));
			list.add(new ProductDTO(3, "I_003", "모니터", "img_3.jpg", 320000, new Date()));
			list.add(new ProductDTO(4, "I_004", "키보드", "img_1.jpg", 135000, new Date()));
		}
		
		return list;
	}
}
