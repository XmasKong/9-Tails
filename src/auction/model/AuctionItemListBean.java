package auction.model;

public class AuctionItemListBean {
	private int item_num;
	private String item_name;
	private int item_count;
	private int item_nowbuy_price;
	private int item_category_num;
	
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_count() {
		return item_count;
	}
	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}
	public int getItem_nowbuy_price() {
		return item_nowbuy_price;
	}
	public void setItem_nowbuy_price(int item_nowbuy_price) {
		this.item_nowbuy_price = item_nowbuy_price;
	}
	public int getItem_category_num() {
		return item_category_num;
	}
	public void setItem_category_num(int item_category_num) {
		this.item_category_num = item_category_num;
	}
}