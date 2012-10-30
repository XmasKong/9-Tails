package admin.model;

/**
 * @author Chloe 최선아
 * Description
 * 	variables from payment_cash_log table
 */
public class PaymentCashLogBean {
	private int payment_cash_log_num;
	private int payment_cash_num;
	private String admin_id;
	private String member_id;
	private int payment_cash_price;
	private String payment_cash_request_day;
	private String payment_cash_approval_day;
	
	
	public int getPayment_cash_log_num() {
		return payment_cash_log_num;
	}
	public void setPayment_cash_log_num(int payment_cash_log_num) {
		this.payment_cash_log_num = payment_cash_log_num;
	}
	public int getPayment_cash_num() {
		return payment_cash_num;
	}
	public void setPayment_cash_num(int payment_cash_num) {
		this.payment_cash_num = payment_cash_num;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPayment_cash_price() {
		return payment_cash_price;
	}
	public void setPayment_cash_price(int payment_cash_price) {
		this.payment_cash_price = payment_cash_price;
	}
	public String getPayment_cash_request_day() {
		return payment_cash_request_day;
	}
	public void setPayment_cash_request_day(String payment_cash_request_day) {
		this.payment_cash_request_day = payment_cash_request_day;
	}
	public String getPayment_cash_approval_day() {
		return payment_cash_approval_day;
	}
	public void setPayment_cash_approval_day(String payment_cash_approval_day) {
		this.payment_cash_approval_day = payment_cash_approval_day;
	}
	
	
}
