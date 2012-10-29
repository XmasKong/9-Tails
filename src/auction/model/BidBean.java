package auction.model;

public class BidBean {
	private int bid_num;
	private String bid_time;
	private int bid_price;
	private int member_num;
	private int auction_num;
	
	public int getBid_num() {
		return bid_num;
	}
	public void setBid_num(int bid_num) {
		this.bid_num = bid_num;
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
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getAuction_num() {
		return auction_num;
	}
	public void setAuction_num(int auction_num) {
		this.auction_num = auction_num;
	}
}
