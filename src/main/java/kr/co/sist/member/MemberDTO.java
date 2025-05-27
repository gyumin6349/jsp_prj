package kr.co.sist.member;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@Getter
@Setter
@ToString

public class MemberDTO {
private String id, pass, name, birth, tel, email, domain, useEmail, gender, zipcode, addr, addr2, intro, ip, profile_img;
private Date input_date;


}
