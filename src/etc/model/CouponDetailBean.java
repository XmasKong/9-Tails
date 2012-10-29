package etc.model;

public class CouponDetailBean {
	private int coupon_num;
	private int member_num;
	private String coupon_name;
	private String coupon_content;
	private String coupon_image_url;
	private int coupon_discount;
	private int member_coupon_count;
	private String member_coupon_get_day;
	private String member_coupon_end_day;
	
	public int getCoupon_num() {
		return coupon_num;
	}
	public void setCoupon_num(int coupon_num) {
		this.coupon_num = coupon_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public String getCoupon_content() {
		return coupon_content;
	}
	public void setCoupon_content(String coupon_content) {
		this.coupon_content = coupon_content;
	}
	public String getCoupon_image_url() {
		return coupon_image_url;
	}
	public void setCoupon_image_url(String coupon_image_url) {
		this.coupon_image_url = coupon_image_url;
	}
	public int getCoupon_discount() {
		return coupon_discount;
	}
	public void setCoupon_discount(int coupon_discount) {
		this.coupon_discount = coupon_discount;
	}
	public int getMember_coupon_count() {
		return member_coupon_count;
	}
	public void setMember_coupon_count(int member_coupon_count) {
		this.member_coupon_count = member_coupon_count;
	}
	public String getMember_coupon_get_day() {
		return member_coupon_get_day;
	}
	public void setMember_coupon_get_day(String member_coupon_get_day) {
		this.member_coupon_get_day = member_coupon_get_day;
	}
	public String getMember_coupon_end_day() {
		return member_coupon_end_day;
	}
	public void setMember_coupon_end_day(String member_coupon_end_day) {
		this.member_coupon_end_day = member_coupon_end_day;
	}
}
