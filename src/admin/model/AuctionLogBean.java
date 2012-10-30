package admin.model;

/**
 * @author Chloe 최선아
 * Description
 * 	variables from auction_log table
 */
public class AuctionLogBean {
	private int auction_log_num;
	private int item_num;
	private int auction_num;
	private String member_id;
	private String auction_start_day;
	private String auction_end_day;
	public int getAuction_log_num() {
		return auction_log_num;
	}
	public void setAuction_log_num(int auction_log_num) {
		this.auction_log_num = auction_log_num;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public int getAuction_num() {
		return auction_num;
	}
	public void setAuction_num(int auction_num) {
		this.auction_num = auction_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getAuction_start_day() {
		return auction_start_day;
	}
	public void setAuction_start_day(String auction_start_day) {
		this.auction_start_day = auction_start_day;
	}
	public String getAuction_end_day() {
		return auction_end_day;
	}
	public void setAuction_end_day(String auction_end_day) {
		this.auction_end_day = auction_end_day;
	}
	
	
}
