package day0516;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class EmpDTO {
	private int empno, mgr, sal, comm, deptno;
	private String ename, job;
	private Date hireDate;
}
