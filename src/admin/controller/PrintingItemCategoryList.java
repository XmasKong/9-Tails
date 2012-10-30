package admin.controller;

import java.util.Iterator;
import java.util.List;

import team2.common.Mapper;

import admin.model.ItemCategoryList;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionSupport;


public class PrintingItemCategoryList extends ActionSupport{

	private List<ItemCategoryList> list;
	
	
	
	public List<ItemCategoryList> getList() {
		return list;
	}



	public void setList(List<ItemCategoryList> list) {
		this.list = list;
	}

	public int getCategoryNum(String str) throws Exception
	{
		SqlMapClient ibatis = Mapper.getSqlMapper();
		int category = (Integer) ibatis.queryForObject("selectOneById", str);
		System.out.println("your category : "+category);
		
		return category;
	
	}

	public String execute() throws Exception
	{
		//list = (List<ItemCategoryList>)HSBWork.selectAllCategories();
		SqlMapClient ibatis = Mapper.getSqlMapper();
		list = (List<ItemCategoryList>)ibatis.queryForList("selectAllCategories");
		
		Iterator<ItemCategoryList> it = list.iterator();
		while(it.hasNext())
		{
			System.out.println(it.next().getItem_category_name());
			
		}
	
		return "success";
	}
}
