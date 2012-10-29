package member.model;

/**
 * @author Chloe 최선아
 * @val
 * point_log_num : primary key
 * point_log_day : 일자
 * point_log_content : 내역
 * point_log_chage : 변경 유료 포인트
 * point_log_remain : 잔여 유료 포인트
 * MEMBER_ID : 회원 id
 * point_log_division_num : 포인트 로그 구분 아이디
 */
public class PointLogBean {
	private int point_log_num;
	private String point_log_day;
	private String point_log_content;
	private int point_log_chage;
	private int point_log_remain;
	private String member_id;
	private int point_log_division_num;
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPoint_log_num() {
		return point_log_num;
	}
	public void setPoint_log_num(int point_log_num) {
		this.point_log_num = point_log_num;
	}
	public String getPoint_log_day() {
		return point_log_day;
	}
	public void setPoint_log_day(String point_log_day) {
		this.point_log_day = point_log_day;
	}
	public String getPoint_log_content() {
		return point_log_content;
	}
	public void setPoint_log_content(String point_log_content) {
		this.point_log_content = point_log_content;
	}
	public int getPoint_log_chage() {
		return point_log_chage;
	}
	public void setPoint_log_chage(int point_log_chage) {
		this.point_log_chage = point_log_chage;
	}
	public int getPoint_log_remain() {
		return point_log_remain;
	}
	public void setPoint_log_remain(int point_log_remain) {
		this.point_log_remain = point_log_remain;
	}
	public int getPoint_log_division_num() {
		return point_log_division_num;
	}
	public void setPoint_log_division_num(int point_log_division_num) {
		this.point_log_division_num = point_log_division_num;
	}
}
