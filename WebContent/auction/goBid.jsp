<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style>
.bid_join {
	color: #666666;
	font-family: 'dotum';
    font-size: 12px;
    padding: 10px;
}
</style>
<link href="../css/bootstrap.css" rel="stylesheet">
</head>
<body>
<div class="modal-header">         
<h3>9-Tails 입찰에 참여하시겠습니까?</h3>             
</div>              
<div class="modal-body bid_join">
<i class="icon-check"></i><strong> 입찰 참여 동의</strong><br />
<textarea rows="3" id="disabledInput" class="bid_join span5 alert-error">
* 본 서비스는 구매의사를 가진 회원님을 대상으로 하는 서비스입니다.
* 낙찰 받은 고객님 1명에게만 싼 값에 구매 할 수 있는 기회가 제공됩니다.
* 서비스 이용전 반드시 이용약관 및 이용가이드를 숙지 하신 후 
  경매에 참여 바랍니다.
</textarea>
<p>입찰참여 동의 내용에 동의하며, 본 상품의 입찰에 참여하시겠습니까?${auction_num }</p>                  
</div>              
</body>
</html>