package member.model;

public class PaymentBean 
{
	private int payment_num;
	private String payment_status;
	private int payment_price;
	private String payment_ems_number;
	private int member_num;
	private int auction_num;
	private String member_id;
	private String member_name;
	private String auction_item_name;
		
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
	public String getAuction_item_name() {
		return auction_item_name;
	}
	public void setAuction_item_name(String auction_item_name) {
		this.auction_item_name = auction_item_name;
	}
	public int getPayment_num() {
		return payment_num;
	}
	public void setPayment_num(int payment_num) {
		this.payment_num = payment_num;
	}
	public String getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	public int getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
	}
	public String getPayment_ems_number() {
		return payment_ems_number;
	}
	public void setPayment_ems_number(String payment_ems_number) {
		this.payment_ems_number = payment_ems_number;
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
