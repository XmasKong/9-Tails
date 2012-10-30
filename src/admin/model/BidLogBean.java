package admin.model;

/**
 * @author Chloe 최선아
 * Description
 * 	variables from bid_log table
 */
public class BidLogBean {
	private int bid_log_num;
	private String bid_time;
	private int bid_price;
	private int auction_log_num;
	
	public int getBid_log_num() {
		return bid_log_num;
	}
	public void setBid_log_num(int bid_log_num) {
		this.bid_log_num = bid_log_num;
	}
	public String getBid_time() {
		return bid_time;
	}
	public void setBid_time(String bid_time) {
		this.bid_time = bid_time;
	}
	public int getBid_price() {
		return bid_price;
	}
	public void setBid_price(int bid_price) {
		this.bid_price = bid_price;
	}
	public int getAuction_log_num() {
		return auction_log_num;
	}
	public void setAuction_log_num(int auction_log_num) {
		this.auction_log_num = auction_log_num;
	}
	
	
}
