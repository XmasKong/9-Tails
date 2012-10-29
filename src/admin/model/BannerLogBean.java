package admin.model;

/**
 * @author Chloe 최선아
 * Description
 * 	variables from banner_log table
 */
public class BannerLogBean {
	private int banner_log_num;
	private String member_id;
	private String banner_click_day;
	private String member_ip;
	private int banner_num;
	
	public int getBanner_log_num() {
		return banner_log_num;
	}
	public void setBanner_log_num(int banner_log_num) {
		this.banner_log_num = banner_log_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBanner_click_day() {
		return banner_click_day;
	}
	public void setBanner_click_day(String banner_click_day) {
		this.banner_click_day = banner_click_day;
	}
	public String getMember_ip() {
		return member_ip;
	}
	public void setMember_ip(String member_ip) {
		this.member_ip = member_ip;
	}
	public int getBanner_num() {
		return banner_num;
	}
	public void setBanner_num(int banner_num) {
		this.banner_num = banner_num;
	}
	
	
}
