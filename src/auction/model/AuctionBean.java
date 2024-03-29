package auction.model;

public class AuctionBean {
	private int auction_num;
	private String auction_item_name;
	private String auction_start_day;
	private String auction_end_day;
	private int auction_now_price;
	private String auction_status;
	private String auction_member_id;
	private int auction_item_id;
	private int auction_category;
	
	public int getAuction_num() {
		return auction_num;
	}
	public void setAuction_num(int auction_num) {
		this.auction_num = auction_num;
	}
	public String getAuction_item_name() {
		return auction_item_name;
	}
	public void setAuction_item_name(String auction_item_name) {
		this.auction_item_name = auction_item_name;
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
	public int getAuction_now_price() {
		return auction_now_price;
	}
	public void setAuction_now_price(int auction_now_price) {
		this.auction_now_price = auction_now_price;
	}
	public String getAuction_status() {
		return auction_status;
	}
	public void setAuction_status(String auction_status) {
		this.auction_status = auction_status;
	}
	public String getAuction_member_id() {
		return auction_member_id;
	}
	public void setAuction_member_id(String auction_member_id) {
		this.auction_member_id = auction_member_id;
	}
	public int getAuction_item_id() {
		return auction_item_id;
	}
	public void setAuction_item_id(int auction_item_id) {
		this.auction_item_id = auction_item_id;
	}
	public int getAuction_category() {
		return auction_category;
	}
	public void setAuction_category(int auction_category) {
		this.auction_category = auction_category;
	}
}
