package member.model;

import java.util.Date;

/**
 * @author Chloe 최선아
 * @val
 * payment_cash_num : primary key
 * payment_cash_price : 결제 금액
 * payment_cash_point : 충전 유료 포인트
 * payment_cash_status : 결제 상태
 * payment_cash_request_day : 결제 요청일
 * payment_cash_approval_day : 승인 완료일
 * member_num : 회원 아이디
 */
public class PaymentCashBean {
	
	  private int payment_cash_num;
	  private int payment_cash_price;
	  private int payment_cash_point;
	  private String payment_cash_status; 
	  private Date payment_cash_request_day;
	  private Date payment_cash_approval_day;
	  private int member_num;
	  
	  //승쨩노.. 
	  private String member_id;
	  private String member_name;
	  private String admin_id;
	  
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
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	//승쨩노..
	
/*	public String getPayment_cash_request_day() {
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
	}*/
	public int getPayment_cash_num() {
		return payment_cash_num;
	}
	public Date getPayment_cash_request_day() {
		return payment_cash_request_day;
	}
	public void setPayment_cash_request_day(Date payment_cash_request_day) {
		this.payment_cash_request_day = payment_cash_request_day;
	}
	public Date getPayment_cash_approval_day() {
		return payment_cash_approval_day;
	}
	public void setPayment_cash_approval_day(Date payment_cash_approval_day) {
		this.payment_cash_approval_day = payment_cash_approval_day;
	}
	public void setPayment_cash_num(int payment_cash_num) {
		this.payment_cash_num = payment_cash_num;
	}
	public int getPayment_cash_price() {
		return payment_cash_price;
	}
	public void setPayment_cash_price(int payment_cash_price) {
		this.payment_cash_price = payment_cash_price;
	}
	public int getPayment_cash_point() {
		return payment_cash_point;
	}
	public void setPayment_cash_point(int payment_cash_point) {
		this.payment_cash_point = payment_cash_point;
	}
	public String getPayment_cash_status() {
		return payment_cash_status;
	}
	public void setPayment_cash_status(String payment_cash_status) {
		this.payment_cash_status = payment_cash_status;
	}
	
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
	
	  
}
