package member.model;

/**
 * @author Chloe 최선아
 * @val
 * point_num : primary key
 * point_price : 충전 금액
 * point_cash : 충전 유료 포인트
 */
public class PointBean {
	
	private int point_num;
	private int point_price;
	private int point_cash;
	
	public int getPoint_num() {
		return point_num;
	}
	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}
	public int getPoint_price() {
		return point_price;
	}
	public void setPoint_price(int point_price) {
		this.point_price = point_price;
	}
	public int getPoint_cash() {
		return point_cash;
	}
	public void setPoint_cash(int point_cash) {
		this.point_cash = point_cash;
	}	
	
}
