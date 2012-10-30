package member.controller;

import java.util.Map;

import member.model.MemberBean;

import admin.model.AdminBean;

import com.opensymphony.xwork2.ActionContext;

public class SessionControll {
	public void adminsessionUp(AdminBean bean,String connetcount){
		ActionContext context = ActionContext.getContext();
		Map<String, String> session = (Map<String, String>)context.getSession();
		session.put("admin_num", String.valueOf(bean.getAdmin_num()));
		session.put("admin_id", bean.getAdmin_id());
		session.put("admin_pwd", bean.getAdmin_pwd());
		session.put("admin_name", bean.getAdmin_name());
		session.put("admin_email", bean.getAdmin_email());
		session.put("admin_grade_num", String.valueOf(bean.getAdmin_grade_num()));
		session.put("login_status", "2");
		session.put("connetcount", connetcount);
		context.setSession(session);
	}
	public void adminsessionUDown(){
		ActionContext context = ActionContext.getContext();
		Map<String, String> session = (Map<String, String>)context.getSession();
		session.remove("admin_num");
		session.remove("admin_id");
		session.remove("admin_pwd");
		session.remove("admin_name");
		session.remove("admin_email");
		session.remove("admin_grade_num");
		session.remove("login_status");
		session.remove("connetcount");
		context.setSession(session);
	}
		
	public void sessionUp(MemberBean bean){
		ActionContext context = ActionContext.getContext();
		Map<String, String> session = (Map<String, String>)context.getSession();
		session.put("member_num",String.valueOf(bean.getMember_num()));
		session.put("member_id", bean.getMember_id());
		session.put("member_name", bean.getMember_name());
		session.put("member_pwd", bean.getMember_pwd());
		session.put("member_phone", bean.getMember_phone());
		session.put("member_email",bean.getMember_email());
		session.put("member_addr", bean.getMember_addr());
		session.put("member_bank", bean.getMember_bank());
		session.put("member_accnum", bean.getMember_accnum());
		session.put("member_point", String.valueOf(bean.getMember_point()));
		session.put("member_point_free", String.valueOf(bean.getMember_point_free()));
		session.put("member_grade_num", String.valueOf(bean.getMember_grade_num()));
		session.put("login_status", "1");
		context.setSession(session);

	}

	public void sessionDown(){
		ActionContext context = ActionContext.getContext();
		Map<String, String> session = (Map<String, String>)context.getSession();
		session.remove("member_num");
		session.remove("member_id");
		session.remove("member_name");
		session.remove("member_pwd");
		session.remove("member_phone");
		session.remove("member_email");
		session.remove("member_addr");
		session.remove("member_bank");
		session.remove("member_accnum");
		session.remove("member_point");
		session.remove("member_point_free");
		session.remove("member_grade_num");
		session.remove("login_status");
		context.setSession(session);
	}
}
