<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>9-Tails</title>
<!--  Font Style -->
<link href='http://api.mobilis.co.kr/webfonts/css/?fontface=NanumGothicWeb' rel='stylesheet' type='text/css' />
<link href='http://api.mobilis.co.kr/webfonts/css/?fontface=NanumGothicBoldWeb' rel='stylesheet' type='text/css' />

<!-- Bootstrap Style -->
<link href="/9-Tails/css/bootstrap.min.css" rel="stylesheet">
<link href="/9-Tails/css/bootstrap-responsive.min.css" rel="stylesheet">

<!-- jQuery Script -->
<script src="/9-Tails/js/jquery.js"></script>

<!-- DataTable Style -->
<link href="/9-Tails/css/DT_bootstrap.css" rel="stylesheet">
<script src="/9-Tails/js/jquery.dataTables.js"></script>
<script src="/9-Tails/js/DT_bootstrap.js"></script>

<!-- DatePicker -->
<link href="/9-Tails/css/datepicker.css" rel="stylesheet">
<script src="/9-Tails/js/bootstrap-datepicker.js"></script>

<!--  Ajax Script -->
<script type='text/javascript' src='/9-Tails/js/ajax.js' /></script>

<link href="/9-Tails/css/admin.css" rel="stylesheet">
<!-- manageMain Page Style -->
<style>
.manageMainInfo {
    background: url("/9-Tails/img/pattern.png") repeat scroll 0 0 #E8E8E8;
    padding-bottom: 5px;
    padding-top: 5px;
    font-family: 'NanumGothicBoldWeb';
}
.manageMain {
	font-family: 'NanumGothicWeb';
}

.sel {
	width:60px;
}
</style>
<script>
window.onload=function(){
	var cnt = ${insertCnt};
	
	if(cnt == 0) {
		alert("업로드 실패");
	} else(cnt > 0) {
		alert(cnt + "개 배송정보 업데이트 완료");
	}
	
	if(update == true) {
		sendMsg();
	}
}
</script>
<script>
$(document).ready(function() {      
		$('#paymentList').dataTable();
		$('#deliveryList').dataTable();
} ); 

$(function(){
	$('.datepicker').datepicker({
		format: 'yyyy-mm-dd',
		inline: true
	} )
	 .on('changeDate', function(ev){
		$('#'+this.id).datepicker('hide');
	});
});
</script>
<!-- Modal Script -->
<script>
function insertDelivery(pid) {
	sendRequest("/9-Tails/InsertDelivery.action?pid=" + pid, "", "GET", OnLog);
}

function OnLog(data) {
	document.getElementById("modalBody").innerHTML = data;           
	$("#deliveryModal").modal("show");      
}
</script>
<!-- Form Check -->
<script>
function formCheck() {
 	var upload = document.uploadDeliveryForm.upload;
	
	if (upload.value == "") {
		alert("CSV 파일을 선택해 주세요.");
		return false;
	}
	
	return true;
}

</script>
</head>
<body class="manageMain">
<h3 class="manageMainInfo">배송 관리<small>manage delivery</small></h3>
<div class="box">
	<div class="box-content">
		<form id="uploadDeliveryForm" class="form-horizontal" method="post" action="UpdateDeliveryList.action" name="uploadDeliveryForm" enctype="multipart/form-data" onsubmit="return formCheck();">
			<strong>일괄 배송 처리</strong>: <br />
			<input id="upload" type="file" name="upload">
			<input class="btn btn-inverse" type="submit" value="업로드">
		</form> 
		<p class="text-error">(*)결제번호,송장번호로 구성된 CSV 파일을 업로드 해 주세요.</p>
	</div>
</div>

<div class="box">
	<div class="box-title">배송 대기 리스트</div>
	<div class="box-content">
		<div id="edit">
		</div>
		<div id="example_wrapper" class="dataTables_wrapper form-inline">
		<table class="table table-striped table-bordered" id="paymentList">
		<thead>
		<tr>
			<th class="span1">결제번호</th>
			<th class="span3">상품명</th>
			<th class="span2">금액</th>
			<th class="span2">회원ID</th>
			<th class="span2">회원이름</th>
			<th class="span2">배송</th>
		</tr>
		</thead>
		<tbody>
		<s:if test="paymentList==null">
		<tr>
			<td colspan="6">배송 대기 리스트가 존재하지 않습니다.</td>
		</tr>
		</s:if>
		<s:iterator value="paymentList">
		<tr>	
			<td><s:property value="payment_num"/></td>
			<td><s:property value="auction_item_name"/></td>
			<td><s:property value="payment_price"/></td>
			<td><s:property value="member_id"/></td>
			<td><s:property value="member_name"/></td>
			<td><button class="btn" onClick="insertDelivery(${payment_num})">배송처리</button></td>
		</s:iterator>
		</tbody>
		</table>
		</div>
	</div>
	<div class="box-title">배송 완료 리스트</div>
	<div class="box-content">
	<div id="edit">
	</div>
	<div id="example_wrapper" class="dataTables_wrapper form-inline">
		<table class="table table-striped table-bordered" id="deliveryList">
		<thead>
		<tr>
			<th class="span1">결제번호</th>
			<th class="span3">상품명</th>
			<th class="span2">금액</th>
			<th class="span2">회원ID</th>
			<th class="span2">회원이름</th>
			<th class="span2">배송정보</th>
		</tr>
		</thead>
		<tbody>
		<s:if test="deliveryList==null">
		<tr>
			<td colspan="6">배송 완료 리스트가 존재하지 않습니다.</td>
		</tr>
		</s:if>
		<s:iterator value="deliveryList">
		<tr>	
			<td><s:property value="payment_num"/></td>
			<td><s:property value="auction_item_name"/></td>
			<td><s:property value="payment_price"/></td>
			<td><s:property value="member_id"/></td>
			<td><s:property value="member_name"/></td>
			<td><s:property value="payment_ems_number"/></td>
		</s:iterator>
		</tbody>
		</table>	
	</div>
</div>

<!-- Modal 영역 -->
<div class="modal" id="deliveryModal" style="display: none">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>배송 정보 입력</h3>
	</div>
	<div id="modalBody" class="modal-body">Loading...</div>
</div>
	
<!-- Bootstrap -->
<script src="/9-Tails/js/bootstrap.js"></script>
</body>
</html>