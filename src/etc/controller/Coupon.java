package etc.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import member.model.MemberBean;

import auction.model.AuctionDetailBean;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionContext;

import etc.model.CouponDetailBean;

import team2.common.CommonInterface;
import team2.common.LevelInterface;
import team2.common.Mapper;

public class Coupon implements CommonInterface, LevelInterface {
	private CouponDetailBean cdb;
	private List<CouponDetailBean> memberCouponList;
	private String result = "default";	//Send result to browser
	
	private int auc_num;
	private int pay_num;
	
	ActionContext context;
	Map<String, String> session;
	MemberBean mb;
	
	/**
	 * Select CoupontList
	 * @return
	 * @throws SQLException
	 */
	public String viewCouponList() throws SQLException {
		context = ActionContext.getContext();
		session = (Map<String, String>)context.getSession();
		viewList("couponDetail");

		return "success";
	}
	
	/**
	 * Get Coupon
	 * @return
	 * @throws SQLException
	 */
	public String getCoupon() throws SQLException {
		context = ActionContext.getContext();
		session = (Map<String, String>)context.getSession();
		
		mb = new MemberBean();
		mb.setMember_grade_num(Integer.parseInt(session.get("member_grade_num")));
		mb.setMember_num(Integer.parseInt(session.get("member_num")));
		
		//Check Last get coupon day
		selectThing("couponGetDay");
		
		if(result.equals("true")) {
			updateThing("memberCoupon");
		}
		
		return "success";
	}
	@Override
	public int checkLevel() {
		//Check Member or Admin
		//1:Member, 2:Admin
		return Integer.parseInt(session.get("login_status"));
	}

	@Override
	public int checkMember() {
		//Check Member Level
		return Integer.parseInt(session.get("member_grade_num"));
	}

	@Override
	public int checkAdmin() {
		//Check Admin Level
		return Integer.parseInt(session.get("admin_grade_num"));
	}

	@Override
	public void viewList(String type) throws SQLException {	
		//If User is Member, Update Coupon Info and Select
		if(checkLevel() == 1){
			SqlMapClient ibatis = Mapper.getSqlMapper();
			updateThing("memberCouponList");
			
			int member_num = Integer.parseInt(session.get("member_num"));
			memberCouponList = ibatis.queryForList("selectMemberCouponList", member_num);
			System.out.println(memberCouponList.size());
		}
	}

	@Override
	public void selectThing(String type) throws SQLException {
		if(type.equals("couponGetDay")) {
			SqlMapClient ibatis = Mapper.getSqlMapper();
			cdb = new CouponDetailBean();
			
			int member_num = Integer.parseInt(session.get("member_num"));
			memberCouponList = ibatis.queryForList("selectMemberCouponRecently", member_num );
			
			//If Last get coupon day is 30, it is impossible
			if(memberCouponList == null) {
				result = "true";
			} else {
				result = "false";
			}
		}
	}
	
	@Override
	public void insertThing(String type) throws SQLException {
	}
	
	@Override
	public void updateThing(String type) throws SQLException {
		//If coupon day is over than 30days, Initialize Coupon count 0
		if(type.equals("memberCouponList")){
			SqlMapClient ibatis = Mapper.getSqlMapper();
			ibatis.update("updateMemberCouponList");
		}
		if(type.equals("memberCoupon")) {
			SqlMapClient ibatis = Mapper.getSqlMapper();
			ibatis.update("updateMemberCoupon", mb);
		}
	}

	@Override
	public void deleteThing(String type) throws SQLException {
	}

	//Getters and Setters
	public CouponDetailBean getCdb() {
		return cdb;
	}

	public void setCdb(CouponDetailBean cdb) {
		this.cdb = cdb;
	}

	public List<CouponDetailBean> getMemberCouponList() {
		return memberCouponList;
	}

	public void setMemberCouponList(List<CouponDetailBean> memberCouponList) {
		this.memberCouponList = memberCouponList;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public int getAuc_num() {
		return auc_num;
	}

	public void setAuc_num(int auc_num) {
		this.auc_num = auc_num;
	}

	public int getPay_num() {
		return pay_num;
	}

	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
}
