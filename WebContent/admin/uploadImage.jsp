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
 	var upload = document.editImageForm.upload;
	
	if (upload.value == "") {
		alert("변경하실 배너 이미지를 선택해 주세요.");
		return false;
	}
	
	return true;
}
</script>
</head>
<body>            
<div class="modal-body">
<div class="box alternate">
<div class="box-title">
	광고 배너 관리
</div>
<form id="editImageForm" class="form-horizontal" method="post" action="EditBannerImage.action" name="editImageForm" enctype="multipart/form-data" onsubmit="return formCheck();">
	<input id="bid" type="hidden" value="${bid }" name="bid">
	
	<div class="control-group">
	<label class="control-label">배너이미지</label>
	<div class="controls">
	<input id="upload" type="file" name="upload">
	</div>
	</div>
	<div class="form-actions">
	<input class="btn btn-primary" type="submit" value="등록">
	<button class="btn" data-dismiss="modal" aria-hidden="true">취소</button>
	</div>
</form>
</div>                
</div>              
</body>
</html>