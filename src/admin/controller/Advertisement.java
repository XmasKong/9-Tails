package admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import admin.model.BannerBean;
import admin.model.BannerLogBean;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.engine.execution.SqlExecutor;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import team2.common.CommonInterface;
import team2.common.FileInterface;
import team2.common.LevelInterface;
import team2.common.Mapper;

public class Advertisement implements CommonInterface, LevelInterface,
		FileInterface {
	private File upload;
	private String uploadContentType;
	private String uploadFileName;

	private BannerBean bb;
	private BannerLogBean blb;
	
	private int bid;
	
	private List<BannerBean> bannerList;
	
	ActionContext context;
	Map<String, String> session;
	
	/**
	 * This is method. Add Advertisement Banner.
	 * @return
	 * @throws SQLException 
	 */
	public String addBanner() throws SQLException {
		context = ActionContext.getContext();
		session = (Map<String, String>)context.getSession();
		
		//It's possible to admin level less than 3
		if(checkLevel() == 2 && checkAdmin() < 3){
			insertThing("Banner");
		}
		
		return "success";
	}
	
	/**
	 * Add Log when click to banner
	 * @return
	 * @throws SQLException
	 */
	public String logBanner() throws SQLException {
		blb = new BannerLogBean();
		
		HttpServletRequest request = ServletActionContext.getRequest();
		blb.setMember_ip(request.getRemoteAddr());
		
		context = ActionContext.getContext();
		session = (Map<String, String>)context.getSession();
		if(session.get("member_id") != null)
			blb.setMember_id(session.get("member_id"));
		else
			blb.setMember_id("");
		
		blb.setBanner_num(bid);
		
		insertThing("BannerLog");
		updateThing("BannerCount");
		return "success";
	}
	
	/**
	 * Select BannerList
	 * @return
	 * @throws SQLException
	 */
	public String viewBanner() throws SQLException {
		viewList("Banner");
		return "success";
	}
	
	/**
	 * Edit Banner Image
	 * @return
	 * @throws SQLException 
	 */
	public String editBannerImage() throws SQLException {
		context = ActionContext.getContext();
		session = (Map<String, String>)context.getSession();
		
		//It's possible to admin level less than 2
		if(checkLevel() == 2 && checkAdmin() < 3){
			updateThing("BannerImage");
		}
		
		return "success";
	}
	
	/**
	 * Edit Banner Info
	 * @return
	 * @throws SQLException
	 */
	public String editBanner() throws SQLException {
		context = ActionContext.getContext();
		session = (Map<String, String>)context.getSession();
		
		//It's possible to admin level less than 2
		if(checkLevel() == 2 && checkAdmin() < 3){
			updateThing("BannerInfo");
		}

		return "success";
	}
	
	public String execute() throws Exception 
	{
		return "success";
	}
	
	@Override
	public void uploadFile() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession roots = request.getSession();
		
		//Get real path which execute eclipse
		String root = roots.getServletContext().getRealPath("/");
		
		String UploadPath = root+"images/ad/";
		
		System.out.println(root);
		
		if(upload != null && upload.exists()) {
			File saveFile = new File(UploadPath+uploadFileName);
			FileUtils.copyFile(upload, saveFile);
			System.out.println("Save File : " + UploadPath+uploadFileName);
		}
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
		if(type.equals("Banner")) {
			SqlMapClient ibatis = Mapper.getSqlMapper();
			bannerList = ibatis.queryForList("selectBannerList");
		}
	}

	@Override
	public void selectThing(String type) throws SQLException {
	}

	@Override
	public void insertThing(String type) throws SQLException {
		if(type.equals("Banner")) {
			try {
				uploadFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			bb.setAdmin_num(Integer.parseInt(session.get("admin_num")));
			bb.setBanner_image_url(uploadFileName);
			
			SqlMapClient ibatis = Mapper.getSqlMapper();
			ibatis.insert("insertBanner",bb);
		}
		if(type.equals("BannerLog")) {
			SqlMapClient ibatis = Mapper.getSqlMapper();
			ibatis.insert("insertBannerLog",blb);
		}
	}

	@Override
	public void updateThing(String type) throws SQLException {
		if(type.equals("BannerCount")) {
			SqlMapClient ibatis = Mapper.getSqlMapper();
			ibatis.update("updateBannerCount",bid);
		}
		if(type.equals("BannerImage")) {
			try {
				uploadFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			bb = new BannerBean();
			
			bb.setBanner_num(bid);
			bb.setAdmin_num(Integer.parseInt(session.get("admin_num")));
			bb.setBanner_image_url(uploadFileName);
			
			SqlMapClient ibatis = Mapper.getSqlMapper();
			ibatis.update("updateBannerImage", bb);
		}
		
		if(type.equals("BannerInfo")) {
			bb.setAdmin_num(Integer.parseInt(session.get("admin_num")));
			SqlMapClient ibatis = Mapper.getSqlMapper();
			ibatis.update("updateBannerInfo", bb);
		}
	}

	@Override
	public void deleteThing(String type) throws SQLException {
	}

	//Getters and Setters
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

	public BannerBean getBb() {
		return bb;
	}

	public void setBb(BannerBean bb) {
		this.bb = bb;
	}

	public BannerLogBean getBlb() {
		return blb;
	}

	public void setBlb(BannerLogBean blb) {
		this.blb = blb;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public List<BannerBean> getBannerList() {
		return bannerList;
	}

	public void setBannerList(List<BannerBean> bannerList) {
		this.bannerList = bannerList;
	}
}
