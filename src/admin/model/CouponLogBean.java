package admin.model;

/**
 * @author Chloe 최선아
 * Description
 * 	variables from coupon_log table
 */
public class CouponLogBean {
	private int coupon_log_num;
	private String coupon_log_day;
	private int coupon_num;
	private String coupon_name;
	private String member_id;
	private int coupon_remain;
	private int payment_num;
	
	
	public int getCoupon_log_num() {
		return coupon_log_num;
	}
	public void setCoupon_log_num(int coupon_log_num) {
		this.coupon_log_num = coupon_log_num;
	}
	public String getCoupon_log_day() {
		return coupon_log_day;
	}
	public void setCoupon_log_day(String coupon_log_day) {
		this.coupon_log_day = coupon_log_day;
	}
	public int getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getCoupon_remain() {
		return coupon_remain;
	}
	public void setCoupon_remain(int coupon_remain) {
		this.coupon_remain = coupon_remain;
	}
	public int getPayment_num() {
		return payment_num;
	}
	public void setPayment_num(int payment_num) {
		this.payment_num = payment_num;
	}
	
	
}
