package day0508;

public class Counter {
private int cnt; //인스턴스 default value로 자동초기화

public Counter() {
	System.out.println("counter 생성");
}

public int getCnt() {
	return cnt;
}

public void setCnt(int cnt) {
	this.cnt += cnt;
}


}
