package member.model;

public class AuctionListBean {
	private int auction_num;
	private int bid_price;
	private String auction_item_name;
	private int auction_now_price;
	private String payment_status;
	private String auction_end_day;
	private String payment_ems_number;
	private String payment_num;
	
	public int getAuction_num() {
		return auction_num;
	}
	public void setAuction_num(int auction_num) {
		this.auction_num = auction_num;
	}
	public int getBid_price() {
		return bid_price;
	}
	public void setBid_price(int bid_price) {
		this.bid_price = bid_price;
	}
	public String getAuction_item_name() {
		return auction_item_name;
	}
	public void setAuction_item_name(String auction_item_name) {
		this.auction_item_name = auction_item_name;
	}
	public int getAuction_now_price() {
		return auction_now_price;
	}
	public void setAuction_now_price(int auction_now_price) {
		this.auction_now_price = auction_now_price;
	}
	public String getAuction_end_day() {
		return auction_end_day;
	}
	public void setAuction_end_day(String auction_end_day) {
		this.auction_end_day = auction_end_day;
	}
	public String getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	public String getPayment_ems_number() {
		return payment_ems_number;
	}
	public void setPayment_ems_number(String payment_ems_number) {
		this.payment_ems_number = payment_ems_number;
	}
	public String getPayment_num() {
		return payment_num;
	}
	public void setPayment_num(String payment_num) {
		this.payment_num = payment_num;
	}
}
