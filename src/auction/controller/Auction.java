package auction.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import member.model.MemberBean;
import member.model.PaymentBean;

import admin.model.CouponLogBean;
import admin.model.FreePointLogBean;
import admin.model.ItemList;
import auction.model.AuctionBean;
import auction.model.AuctionDetailBean;
import auction.model.AuctionItemListBean;
import auction.model.BidBean;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import etc.model.CouponDetailBean;
import etc.model.FreePointBean;
import team2.common.CommonInterface;
import team2.common.Mapper;

@SuppressWarnings("serial")
public class Auction extends ActionSupport implements CommonInterface{
	private int item_num;
	private int auc_num;
	private String item_name;
	private String startDate;
	private String id;
	private int uid;
	
	private boolean auc_update = false;	//WebSocket update variable

	private String pType;
	private int pCost;
	private int pCoupon;
	private int pay_num;
	
	private AuctionDetailBean adb;
	private List<AuctionItemListBean> auctionItemList;	
	private List<CouponDetailBean> memberCouponList;
	private List<ItemList> list;
	
	/**
	 * Select auction possible item
	 * @return success
	 * @throws SQLException
	 */
	public String listAuctionItem()throws SQLException {
		viewList("auction");
		return "success";
	}
	
	/**
	 * Start auction
	 * @return success
	 * @throws SQLException
	 */
	public String startAuction() throws SQLException {
		//Get Auction PK
		selectThing("auctionNumber");
		
		//Insert Auction and AuctionLog
		insertThing("auction");
		
		//Decrease Item
		updateThing("item");

		return "success";
	}
	
	/**
	 * View Detail Auction Information
	 * @return success
	 * @throws SQLException 
	 */
	public String viewAuctionDetail() throws SQLException {
		if(memberCouponList != null )
			if(memberCouponList.size()==0) {
				memberCouponList=null;
			}
		selectThing("auctionDetail");
		if(adb.getAuction_status().equals("진행")) {
			String duration = checkDate(adb.getAuction_end_day());
			
			if(duration.equals("EndAuction")) {
				endAuction();
				selectThing("auctionDetail");
			} else {
				adb.setAuction_end_day(checkDate(adb.getAuction_end_day()));
			}
		}
		return "success";
	}
	
	FreePointLogBean fplb;
	FreePointBean fpb;
	MemberBean mb;
	
	/**
	 * Do Bid
	 * @return
	 * @throws SQLException
	 */
	public String doBid() throws SQLException {
		//Check Auction State
		selectThing("auctionDetail");
		mb = new MemberBean();
		if(adb.getAuction_status().equals("진행")) {
			//Insert Bid Information
			insertThing("bid");
			
			//Point
			//If User have Free Point, Decrease Free Point
			ActionContext context = ActionContext.getContext();
			Map<String, String> session = (Map<String, String>)context.getSession();
			
			int freePoint = Integer.parseInt(session.get("member_point_free"));
			int cashPoint = Integer.parseInt(session.get("member_point"));
			uid = Integer.parseInt(session.get("member_num"));
			
			mb.setMember_point_free(freePoint);
			mb.setMember_point(cashPoint);
			mb.setMember_num(uid);
			
			if(freePoint >= 3) {
				//Select FreePoint Which is the oldest
				selectThing("member_point_free");
				
				//Decrease Free Point
				freePoint = freePoint-3;
				
				//Update Session(Free Point)
				session.put("member_point_free", String.valueOf(freePoint));
				
				//Set Member(Free Point)
				mb.setMember_point_free(freePoint);
			} else if (freePoint > 0) {
				//Decrease Free Point
				//Select FreePoint Which is the oldest
				selectThing("member_point_free");
				session.put("member_point_free", String.valueOf(0));
			
				//Decrease Cash Point
				cashPoint = cashPoint - (3-freePoint);
				session.put("member_point", String.valueOf(cashPoint));
				
				//Set Member(Free Point and Cash Point)
				mb.setMember_point_free(0);
				mb.setMember_point(cashPoint);
			} else {
				//Decrease Cash Point
				cashPoint = cashPoint - 3;
				session.put("member_point", String.valueOf(cashPoint));

				//Set Member(Cash Point)
				mb.setMember_point(cashPoint);
			}
			//Update Member
			updateThing("member");
			
			//Set bid id
			adb.setAuction_member_id(id);
			
			//If bid_price is max_price, end auction
			if(adb.getAuction_now_price()+10 >= adb.getItem_limit_price()){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String today = sdf.format(new Date());
				adb.setAuction_end_day(today);
				adb.setAuction_status("마감");
				endAuction();
			} else {
			//Update Auction
			updateThing("auction");
			auc_update = true;
			}
		} else {
		}
		return "success";
	}
	
	/**
	 * End Auction
	 * @return
	 * @throws SQLException
	 */
	public String endAuction() throws SQLException {
		if(adb.getAuction_member_id()== null) {
			adb.setAuction_status("미달");
			//Increase Item(+1)
			updateThing("cancle");
		} else {
			adb.setAuction_status("마감");
			//Insert Ready Payment
			insertThing("payment");
		}
		updateThing("EndAuction");
		auc_update = true;
		
		return "success";
	}
	
	/**
	 * Now Buy
	 * @return
	 * @throws SQLException
	 */
	public String buyNow() throws SQLException {
		//Select Now Buy Information
		selectThing("auctionDetail");
		
		return "success";
	}
	
	/**
	 * Payment
	 * @return
	 * @throws SQLException
	 */
	public String handlePayment() throws SQLException {
		//Now Buy(A)
		if(pType.equals("A")) {
			//Insert User Information
			insertThing("paymentA");
			//Decrease Item
			updateThing("updateItemMinus");
			//If user uses coupon, decrease coupon
			if(pCoupon != 0) {
				updateThing("updatePCouponMinus");
				insertThing("insertpCouponLog");
			}
		}
		//Bid Payment(B)
		if(pType.equals("B")) {
			//Update Payment
			updateThing("paymentB");

			//If user uses coupon, decrease coupon
			if(pCoupon != 0) {
				updateThing("updatePCouponMinus");
				insertThing("insertpCouponLog");
			}
		}
		return "success";
	}
	
	/**
	 * C.R.U.D
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void viewList(String type) throws SQLException {
		SqlMapClient ibatis = Mapper.getSqlMapper();
		if(type.equals("auction")) {
			auctionItemList = ibatis.queryForList("selectAuctionItem");
		}
	}

	@Override
	public void selectThing(String type) throws SQLException {
		SqlMapClient ibatis = Mapper.getSqlMapper();
		if(type.equals("auctionDetail")) {
			adb = (AuctionDetailBean) ibatis.queryForObject("selectAuctionDetail", auc_num);
		}
		if(type.equals("member_point_free")) {
			ActionContext context = ActionContext.getContext();
			Map<String, String> session = (Map<String, String>)context.getSession();
			
			int freePoint = Integer.parseInt(session.get("member_point_free"));
			
			if(freePoint > 3){
				freePoint = 3;
			}
			
			while(freePoint == 0) {
				fpb = (FreePointBean) ibatis.queryForObject("selectOldFreePoint");
			
				int remain = fpb.getFreepoint_recharge() - fpb.getFreepoint_use();
			
				if (remain >= freePoint) {
					updateThing("freePoint");
					fpb.setFreepoint_use(fpb.getFreepoint_use() + freePoint);
					freePoint = 0;
				} else {
					updateThing("freePoint");
					fpb.setFreepoint_use(fpb.getFreepoint_use() + remain);
					freePoint = freePoint - remain;
				}
			}
		}
	}

	@Override
	public void insertThing(String type) throws SQLException{
		SqlMapClient ibatis = Mapper.getSqlMapper();
		if(type.equals("auction")) {
			AuctionBean auction = new AuctionBean();
			auction.setAuction_num(auc_num);
			
			auction.setAuction_item_name(item_name);
			auction.setAuction_start_day(startDate);
			
			String status = "대기";
			
			//If start_day equals today, status is "진행"
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdf.format(new Date());
			
			if(startDate.equals(today)) {
				status = "진행";
				auc_update = true;
			}

			auction.setAuction_status(status);
			
			auction.setAuction_item_id(item_num);
					
			auc_num = (Integer) ibatis.insert("insertAuction",auction);
		} 
		if(type.equals("bid")) {
			BidBean bid = new BidBean();
			
			//now_price + 10
			bid.setBid_price(adb.getAuction_now_price()+10);
			
			//bid user id
			bid.setMember_num(uid);
			
			//auction id
			bid.setAuction_num(auc_num);
			
			ibatis.insert("insertBid", bid);
		}
		if(type.equals("payment")) {
			ibatis.insert("insertPayment", adb);
		}
		if(type.equals("paymentA")) {
			PaymentBean pb = new PaymentBean();
			pb.setPayment_num(uid);
			pb.setPayment_price(pCost);
			pb.setAuction_num(auc_num);
			
			ActionContext context = ActionContext.getContext();
			Map<String, String> session = (Map<String, String>)context.getSession();
			
			pb.setMember_num(Integer.parseInt(session.get("member_num")));
			
			uid = (Integer)ibatis.insert("insertPaymentA", pb);
		}
		if(type.equals("insertpCouponLog")) {
			CouponLogBean clb = new CouponLogBean();
			clb.setCoupon_num(pCoupon);
			
			ActionContext context = ActionContext.getContext();
			Map<String, String> session = (Map<String, String>)context.getSession();
			clb.setMember_id(session.get("member_id"));
			clb.setPayment_num(uid);
			
			ibatis.insert("insertCouponLog", clb);
		}
	}

	@Override
	public void updateThing(String type) throws SQLException {
		SqlMapClient ibatis = Mapper.getSqlMapper();
		if(type.equals("item")) {
			ibatis.update("updateItemMinus", item_num);
		}
		if(type.equals("auction")) {
			ibatis.update("updateAuction", adb);
		}
		if(type.equals("EndAuction")) {		
			ibatis.update("updateEndAuction", adb);
		}
		if(type.equals("cancle")) {
			ibatis.update("updateItemPlus", adb.getItem_num());
		}
		if(type.equals("freePoint")) {
			ibatis.update("updateFreePoint", fpb);
		}
		if(type.equals("member")) {
			ibatis.update("updateMemberBidPoint", mb);
		}
		if(type.equals("updatePCouponMinus")) {
			ActionContext context = ActionContext.getContext();
			Map<String, String> session = (Map<String, String>)context.getSession();
			
			int member_num = Integer.parseInt(session.get("member_num"));
			
			CouponDetailBean cdb = new CouponDetailBean();
			cdb.setCoupon_num(pCoupon);
			cdb.setMember_num(member_num);
			
			ibatis.update("updatePCouponMinus", cdb);
		}
		if(type.equals("paymentB")) {
			PaymentBean pb = new PaymentBean();
			pb.setPayment_num(pay_num);
			pb.setPayment_price(pCost);
			pb.setPayment_status("승인대기");
			ibatis.update("updateMemberPayment", pb);
		}
	}

	@Override
	public void deleteThing(String type) {
	}
	
	/**
	 * Compare time with now and then returns duration
	 * @return String
	 */
	public String checkDate(String date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date date1 = null;
		try {
			date1 = sdf.parse(date);
		} catch (ParseException e) {
			System.out.println("날짜 형식 오류");
			e.printStackTrace();
		}
		
		Date date2 = new Date();
		
		long ldate1 = date1.getTime();
		long ldate2 = date2.getTime();
		
		long diff;
		diff = ldate1 - ldate2;

		if(diff < 0 ) {
			return "EndAuction";
		} else {
			//MilliSecond, 1000/1
		    long hour = diff/1000/60/60;
		    long min = diff/1000/60%60;
		    long second = diff/1000%60%60;
		    
		    //print duration(hour/minute/second)
		    String duration = "";
		    if(hour < 10)
		    	duration += "0";
		    
		    duration += hour + ":";
		   
		    if(min < 10)
		    	duration += "0";
		    
		    duration += min + ":";
		    
		    if(second <10)
		    	duration += "0";
		    
		    duration += second;
		    
			return duration;
		}
	}
	
	/**
	 * Getters and Setters
	 */
	public int getAuc_num() {
		return auc_num;
	}

	public void setAuc_num(int auc_num) {
		this.auc_num = auc_num;
	}
	
	public int getItem_num() {
		return item_num;
	}

	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public boolean isAuc_update() {
		return auc_update;
	}

	public void setAuc_update(boolean auc_update) {
		this.auc_update = auc_update;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	
	public String getpType() {
		return pType;
	}

	public void setpType(String pType) {
		this.pType = pType;
	}

	public int getpCost() {
		return pCost;
	}

	public void setpCost(int pCost) {
		this.pCost = pCost;
	}

	public int getpCoupon() {
		return pCoupon;
	}

	public void setpCoupon(int pCoupon) {
		this.pCoupon = pCoupon;
	}
	
	public List<CouponDetailBean> getMemberCouponList() {
		return memberCouponList;
	}

	public void setMemberCouponList(List<CouponDetailBean> memberCouponList) {
		this.memberCouponList = memberCouponList;
	}

	public int getPay_num() {
		return pay_num;
	}

	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}

	public AuctionDetailBean getAdb() {
		return adb;
	}
	
	public void setAdb(AuctionDetailBean adb) {
		this.adb = adb;
	}
	
	public List<ItemList> getList() {
		return list;
	}

	public void setList(List<ItemList> list) {
		this.list = list;
	}
	
	public List<AuctionItemListBean> getAuctionItemList() {
		return auctionItemList;
	}

	public void setAuctionItemList(List<AuctionItemListBean> auctionItemList) {
		this.auctionItemList = auctionItemList;
	}
}