package admin.controller;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import admin.model.MyFile;
import au.com.bytecode.opencsv.CSVReader;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionContext;

import member.model.PaymentBean;

import team2.common.CommonInterface;
import team2.common.FileInterface;
import team2.common.LevelInterface;
import team2.common.Mapper;

public class Delivery implements CommonInterface, LevelInterface, FileInterface {
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private int insertCnt;
	
	private List<PaymentBean> paymentList;
	private List<PaymentBean> deliveryList;
	
	ActionContext context;
	Map<String, String> session;
	
	private int pid;
	private String ems_number;
	

	public void readCsv() throws IOException, SQLException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession roots = request.getSession();
		
		//Get real path which execute eclipse
		String root = roots.getServletContext().getRealPath("/");
		
		MyFile fileService = new MyFile();
		
		fileService.saveFile(upload, root, uploadFileName);
		
		CSVReader reader = new CSVReader(new FileReader(root+uploadFileName));
		String[] nextLine;
		
		PaymentBean pb;
		
		SqlMapClient ibatis = Mapper.getSqlMapper();
		
		ibatis.startBatch();
		
		insertCnt = 0;
		
		for (int i = 0; (nextLine = reader.readNext()) != null; i++) {
			System.out.println(nextLine[0] + nextLine[1]);
			pb = new PaymentBean();
			
			pb.setPayment_num(Integer.parseInt(nextLine[0]));
			pb.setPayment_ems_number(nextLine[1]);
			pb.setPayment_status("배송완료");
			
			ibatis.update("updateEMS",pb);
			
			insertCnt++;
		}
		ibatis.executeBatch();
	}
	
	public String execute() throws Exception {
		return "success";
	}
	
	/**
	 * Select Delivery Ready/Finish
	 * @return
	 * @throws SQLException
	 */
	public String viewDelivery() throws SQLException {
		context = ActionContext.getContext();
		session = (Map<String, String>)context.getSession();

		viewList("Payment");

		return "success";
	}
	
	/**
	 * Update Delivery Info
	 * @return
	 * @throws SQLException
	 */
	public String updateDelivery() throws SQLException {
		context = ActionContext.getContext();
		session = (Map<String, String>)context.getSession();

		//It's possible to admin level less than 2
		if(checkLevel() == 2 && checkAdmin() < 2){
			updateThing("Payment");
		}
		return "success";
	}
	
	/**
	 * Update Deliveries Info
	 * @throws IOException 
	 */
	public String updateDeliveryList() throws SQLException, IOException {
		context = ActionContext.getContext();
		session = (Map<String, String>)context.getSession();

		//It's possible to admin level less than 2
		if(checkLevel() == 2 && checkAdmin() < 2){
			readCsv();
		}
		return "success";
	}
	
	@Override
	public void uploadFile() throws IOException {
	}

	@Override
	public int checkLevel() {
		// Check Member or Admin
		// 1:Member, 2:Admin
		return Integer.parseInt(session.get("login_status"));
	}

	@Override
	public int checkMember() {
		// Check Member Level
		return Integer.parseInt(session.get("member_grade_num"));
	}

	@Override
	public int checkAdmin() {
		// Check Admin Level
		return Integer.parseInt(session.get("admin_grade_num"));
	}
	
	
	@Override
	public void viewList(String type) throws SQLException {
		if(type.equals("Payment")) {
			SqlMapClient ibatis = Mapper.getSqlMapper();
			paymentList = (List<PaymentBean>)ibatis.queryForList("selectPaymentList");
			deliveryList = (List<PaymentBean>)ibatis.queryForList("selectDeliveryList");
		}
	}

	@Override
	public void selectThing(String type) throws SQLException {
	}

	@Override
	public void insertThing(String type) throws SQLException {
	}

	@Override
	public void updateThing(String type) throws SQLException {
		if(type.equals("Payment")) {
			SqlMapClient ibatis = Mapper.getSqlMapper();
			PaymentBean pb = new PaymentBean();
			
			pb.setPayment_num(pid);
			pb.setPayment_ems_number(ems_number);
			pb.setPayment_status("배송완료");
			
			ibatis.update("updateEMS", pb);
		}
	}

	
	@Override
	public void deleteThing(String type) throws SQLException {
	}

	/**
	 * getters and setters
	 * @return
	 */
	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public List<PaymentBean> getPaymentList() {
		return paymentList;
	}

	public void setPaymentList(List<PaymentBean> paymentList) {
		this.paymentList = paymentList;
	}

	public ActionContext getContext() {
		return context;
	}

	public void setContext(ActionContext context) {
		this.context = context;
	}

	public Map<String, String> getSession() {
		return session;
	}

	public void setSession(Map<String, String> session) {
		this.session = session;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}
	
	public String getEms_number() {
		return ems_number;
	}

	public void setEms_number(String ems_number) {
		this.ems_number = ems_number;
	}

	public int getInsertCnt() {
		return insertCnt;
	}

	public void setInsertCnt(int insertCnt) {
		this.insertCnt = insertCnt;
	}

	public List<PaymentBean> getDeliveryList() {
		return deliveryList;
	}

	public void setDeliveryList(List<PaymentBean> deliveryList) {
		this.deliveryList = deliveryList;
	}
}
