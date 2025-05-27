package kr.co.sist.place;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RestDTO {
	private int rest_num, price;
	private double lat, lng;
	private String restaurant, menu, ip, id, info;
	private Date input_date;
}
