<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
<div class="modal-header">         
<h3>9-Tails 충전이 필요합니다</h3>             
</div>              
<div class="modal-body">                 
<h4 class="alert-error">1회  입찰 시 필요 송이 : 3송이</h4>                 
<p><b>현재 보유 송이</b><br />
유료 : ${member_point}송이 / 무료 : ${member_point_free}송이</p>   
<p>*캐시를 충전하신 후에 참여가 가능합니다.</p>                  
</div>              
<div class="modal-footer">                 
<a href="Charge.action" class="btn btn-danger">충전하기</a>          
</div>
</body>
</html>