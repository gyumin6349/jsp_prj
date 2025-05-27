package day0425;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor //매개변수 있는 생성자
@NoArgsConstructor //기본생성자
@Getter //getter
@Setter //setter
@ToString //toString
public class DataDTO {
	private String img, title, info, url;

}
