<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>9-Tails</title>
<!--  Font Style -->
<link href='http://api.mobilis.co.kr/webfonts/css/?fontface=NanumGothicWeb' rel='stylesheet' type='text/css' />
<link href='http://api.mobilis.co.kr/webfonts/css/?fontface=NanumGothicBoldWeb' rel='stylesheet' type='text/css' />

<!-- Bootstrap Style -->
<link href="/9-Tails/css/bootstrap.css" rel="stylesheet">
<link href="/9-Tails/css/bootstrap-responsive.css" rel="stylesheet">

<!-- JQuery -->
<script src="/9-Tails/js/jquery.js"></script>

<script>
function cal_cost() {
	var p = document.getElementById("p");
	var sel = document.getElementById("coupon");
	var realcost = document.getElementById("realcost");
	var discost = document.getElementById("discost");
	var pCost = document.getElementsByName("pCost");
	var pCoupon = document.getElementsByName("pCoupon");
	
	if(sel.value=='0'){
		realcost.innerHTML = ${adb.item_nowbuy_price} + '원';
		discost.innerHTML = 0 + '원';
		
		p.innerHTML = "<input type=\"hidden\" name=\"pCoupon\" value=\"0\">";
		p.innerHTML = p.innerHTML + "<input type=\"hidden\" name=\"pCost\" value=\"${adb.item_nowbuy_price }\">"; 
	} else {
		
		var str = sel[sel.selectedIndex].innerHTML;
		var discount = str.split("%")[0];
		
		var sale = ${adb.item_nowbuy_price} * discount * 0.01;
		var cost = ${adb.item_nowbuy_price} - sale;

		pCost.value = cost;
		pCoupon.value = sel.value;
		
		realcost.innerHTML=cost +'원';
		discost.innerHTML = sale + '원';
		
		p.innerHTML = "<input type=\"hidden\" name=\"pCoupon\" value=\"" + sel.value +"\">";
		p.innerHTML = p.innerHTML + "<input type=\"hidden\" name=\"pCost\" value=\""+ cost +"\">"; 
	}
}
</script>
<!-- orderDetail Page Style -->
<style>
.orderInfo {
    background: url("/9-Tails/img/pattern.png") repeat scroll 0 0 #E8E8E8;
    padding-bottom: 5px;
    padding-top: 5px;
    font-family: 'NanumGothicBoldWeb';
}
.order {
	font-family: 'NanumGothicWeb';
}
.orderResult {
	font-family: 'NanumGothicBoldWeb';
}
</style>
</head>
<body class="order">
<h3 class="orderInfo" >주문/결제<small>order</small></h3>
<s:form name="f" action="OrderBuyNow" method="POST">
<input type="hidden" name="pType" value="A">
<input type="hidden" name="auc_num" value="${adb.auction_num }">
<input type="hidden" name="item_num" value="${adb.item_num }">
<div id="p">
<input type="hidden" name="pCoupon" value="0">
<input type="hidden" name="pCost" value="${adb.item_nowbuy_price }">
</div>
<table class="table table-striped table-bordered" id="listOrder">
	<thead>
	<tr>
		<th class="span2">경매번호</th>
		<th class="span5">상품명</th>
		<th class="span2">상품금액</th>
		<th class="span1">수량</th>
		<th class="span2">결제금액</th>
	</tr>
	</thead>
	<tbody>
		<tr align="center">
			<td>${adb.auction_num }</td>
			<td>${adb.auction_item_name }</td>
			<td>${adb.item_nowbuy_price }원</td>
			<td>1개</td>
			<td><label id="realcost" class="text-error orderResult">${adb.item_nowbuy_price }원</label></b></td>
		</tr>
	</tbody>
</table>
<strong>쿠폰 선택</strong>
<select id="coupon" onChange="cal_cost()">
<s:if test="memberCouponList==null">
	<option value="0">--쿠폰 없음--</option>
</s:if>
<s:else>
	<option value="0" selected>--쿠폰 사용안함--</option>
</s:else>
<s:iterator value="memberCouponList">
	<option value="${coupon_num }"><s:property value="coupon_discount"/>% 할인쿠폰</option>
</s:iterator>
</select>&nbsp;<small>| 쿠폰 할인액<span id="discost" class="label-warning">0원</span></small>
<p class="text-warning">※ 쿠폰은 주문건에 한개만 사용 가능합니다. </p>
<hr />
<!-- 1. 고객/배송 정보입력  -->
<h5 class="orderInfo" >
01 고객 정보<small>member info</small>&nbsp;
<a class="btn btn-mini btn-inverse" href="/9-Tails/MemberUpdate.action">회원정보수정</a>
</h5>
<dl class="dl-horizontal">
<dt>주문자 성명</dt>
<dd>${member_name }</dd>
<dt>주소</dt>
<dd>${member_addr }</dd>
<dt>연락처</dt>
<dd>${member_phone }</dd>
</dl>
<!-- 2. 결제 정보 입력  -->
<h5 class="orderInfo" >
02 결제 정보<small>payment info</small>&nbsp;
</h5>
<dl class="dl-horizontal">
<dt>입금은행</dt>
<dd>우리은행 </dd>
<dt>계좌번호</dt>
<dd>8564-6625-4452</dd>
<dt>예금주</dt>
<dd>(주)나인테일즈</dd>
</dl>
<p class="text-warning">※ 입금자명이 주문자 성명과 틀릴 경우 배송이 지연될 수 있습니다.</p>
<center><button type="submit" class="btn btn-primary">주문하기</button></center>
</s:form>
<!-- Bootstrap -->

<script src="/9-Tails/js/bootstrap.js"></script>
</body>
</html>