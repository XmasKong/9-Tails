package member.model;

import java.util.Date;

public class MemberCouponBean {
	private int member_coupon_num;
	private int member_coupon_count;
	private Date member_coupon_get_day;
	private Date member_coupon_end_Day;
	private int coupon_num;
	private int member_num;
	public int getMember_coupon_num() {
		return member_coupon_num;
	}
	public void setMember_coupon_num(int member_coupon_num) {
		this.member_coupon_num = member_coupon_num;
	}
	public int getMember_coupon_count() {
		return member_coupon_count;
	}
	public void setMember_coupon_count(int member_coupon_count) {
		this.member_coupon_count = member_coupon_count;
	}
	public Date getMember_coupon_get_day() {
		return member_coupon_get_day;
	}
	public void setMember_coupon_get_day(Date member_coupon_get_day) {
		this.member_coupon_get_day = member_coupon_get_day;
	}
	public Date getMember_coupon_end_Day() {
		return member_coupon_end_Day;
	}
	public void setMember_coupon_end_Day(Date member_coupon_end_Day) {
		this.member_coupon_end_Day = member_coupon_end_Day;
	}
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
	
}
