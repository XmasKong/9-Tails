package member.model;

import java.util.Date;

public class MemberBean {
	private int member_num;
	private String member_id;
	private String member_name;
	private String member_pwd;
	private String member_phone;
	private String member_email;
	private String member_addr;
	private String member_bank;
	private String member_accnum;
	private Date member_joinday;
	private int member_point;
	private int member_point_free;
	private int member_grade_num;
	private String member_grade_name;
	private int member_accredit;
	
	public String getMember_grade_name() {
		return member_grade_name;
	}
	public void setMember_grade_name(String member_grade_name) {
		this.member_grade_name = member_grade_name;
	}
	public int getMember_accredit() {
		return member_accredit;
	}
	public void setMember_accredit(int member_accredit) {
		this.member_accredit = member_accredit;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_bank() {
		return member_bank;
	}
	public void setMember_bank(String member_bank) {
		this.member_bank = member_bank;
	}
	public String getMember_accnum() {
		return member_accnum;
	}
	public void setMember_accnum(String member_accnum) {
		this.member_accnum = member_accnum;
	}
	public Date getMember_joinday() {
		return member_joinday;
	}
	public void setMember_joinday(Date member_joinday) {
		this.member_joinday = member_joinday;
	}
	public int getMember_point() {
		return member_point;
	}
	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}
	public int getMember_point_free() {
		return member_point_free;
	}
	public void setMember_point_free(int member_point_free) {
		this.member_point_free = member_point_free;
	}
	public int getMember_grade_num() {
		return member_grade_num;
	}
	public void setMember_grade_num(int member_grade_num) {
		this.member_grade_num = member_grade_num;
	}
}
