package admin.model;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class ItemList 
{
	private String uploadPath = "D:/upload/";
	
	private int item_num;
	private String item_name;
	private int item_count;
	private String item_title_url;
	private String item_detail_url;
	private String item_image1_url;
	private String item_image2_url;
	private String item_image3_url;
	private int item_limit_price;
	private int item_nowbuy_price;
	private int item_category_num;
	private String item_category_name;
	
	
	
	public String getItem_category_name() {
		return item_category_name;
	}
	public void setItem_category_name(String item_category_name) {
		this.item_category_name = item_category_name;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
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
	public String getItem_title_url() {
		return item_title_url;
	}
	public void setItem_title_url(String item_title_url) {
		this.item_title_url = item_title_url;
	}
	public String getItem_detail_url() {
		return item_detail_url;
	}
	public void setItem_detail_url(String item_detail_url) {
		this.item_detail_url = item_detail_url;
	}
	public String getItem_image1_url() {
		return item_image1_url;
	}
	public void setItem_image1_url(String item_image1_url) {
		this.item_image1_url = item_image1_url;
	}
	public String getItem_image2_url() {
		return item_image2_url;
	}
	public void setItem_image2_url(String item_image2_url) {
		this.item_image2_url = item_image2_url;
	}
	public String getItem_image3_url() {
		return item_image3_url;
	}
	public void setItem_image3_url(String item_image3_url) {
		this.item_image3_url = item_image3_url;
	}
	public int getItem_limit_price() {
		return item_limit_price;
	}
	public void setItem_limit_price(int item_limit_price) {
		this.item_limit_price = item_limit_price;
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
