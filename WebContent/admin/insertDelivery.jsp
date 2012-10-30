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
<link href="/9-Tails/css/bootstrap.min.css" rel="stylesheet">
<link href="/9-Tails/css/bootstrap-responsive.css" rel="stylesheet">

<!-- Admin Style -->
<link href="/9-Tails/css/admin.css" rel="stylesheet">

<!-- JQuery -->
<script src="/9-Tails/js/jquery.js"></script>

<!-- Top Screen -->
<script src="/9-Tails/js/topscreen.js"></script>
<link href="/9-Tails/css/topscreen.css" rel="stylesheet">

<!-- Ajax -->
<script type='text/javascript' src='/9-Tails/js/ajax.js' /></script>

<!-- Form Check -->
<script>
function formCheck() {
 	var ems_number = document.insertDeliveryForm.ems_number;

	if (ems_number.value == "") {
		alert("배송 정보를 입력해 주세요.");
		return false;
	}
	insertDeliveryForm.submit();
}
</script>
</head>
<body>            
<div class="modal-body">
<form id="insertDeliveryForm" class="form-horizontal" method="post" action="UpdateDelivery.action" name="insertDeliveryForm" onsubmit="return formCheck();">
	<input id="pid" type="hidden" name="pid" value="${pid }">
	<div class="box">
	<div class="box-content">
		<input id="ems_number" type="text" name="ems_number">
		<input class="btn btn-inverse" type="submit" value="입력">
	</div>
	</div>
</form>                
</div>              
</body>
</html>