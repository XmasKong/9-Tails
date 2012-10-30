package admin.model;

import java.io.File;

public class BannerBean {
	private int banner_num;
	private String banner_name;
	private String banner_url;
	private int banner_click_count;
	private String banner_image_url;
	private String banner_start_day;
	private String banner_end_day;
	private int admin_num;
	private int banner_division_num;
	private String admin_id;
	
	public int getBanner_num() {
		return banner_num;
	}
	public void setBanner_num(int banner_num) {
		this.banner_num = banner_num;
	}
	public String getBanner_name() {
		return banner_name;
	}
	public void setBanner_name(String banner_name) {
		this.banner_name = banner_name;
	}
	public String getBanner_url() {
		return banner_url;
	}
	public void setBanner_url(String banner_url) {
		this.banner_url = banner_url;
	}
	public int getBanner_click_count() {
		return banner_click_count;
	}
	public void setBanner_click_count(int banner_click_count) {
		this.banner_click_count = banner_click_count;
	}
	public String getBanner_image_url() {
		return banner_image_url;
	}
	public void setBanner_image_url(String banner_image_url) {
		this.banner_image_url = banner_image_url;
	}
	public String getBanner_start_day() {
		return banner_start_day;
	}
	public void setBanner_start_day(String banner_start_day) {
		this.banner_start_day = banner_start_day;
	}
	public String getBanner_end_day() {
		return banner_end_day;
	}
	public void setBanner_end_day(String banner_end_day) {
		this.banner_end_day = banner_end_day;
	}
	public int getAdmin_num() {
		return admin_num;
	}
	public void setAdmin_num(int admin_num) {
		this.admin_num = admin_num;
	}
	public int getBanner_division_num() {
		return banner_division_num;
	}
	public void setBanner_division_num(int banner_division_num) {
		this.banner_division_num = banner_division_num;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
}
