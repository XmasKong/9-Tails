<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>물품 관리</title>
	<!-- Bootstrap Style -->
	<link href="/9-Tails/css/bootstrap.min.css" rel="stylesheet">
	<link href="/9-Tails/css/DT_bootstrap.css" rel="stylesheet">
	
	
	<script src="/9-Tails/js/jquery.js"></script>
	<script src="/9-Tails/js/jquery.dataTables.js"></script>
	<script src="/9-Tails/js/DT_bootstrap.js"></script>
	<script src="/9-Tails/js/bootstrap-datepicker.js"></script>

	<script>
	function startAuction(item_num, name, dp) {
		alert('경매 시작 아이템:' + item_num);
		alert('경매 시작일: ' + dp.value);
		alert(name);
		location.href = 'startAuction.action?item_num='+item_num+'&item_name='+name+'&startDate='+dp.value;
	}
	
	$(function(){
		$('.datepicker').datepicker({
			format: 'yyyy-mm-dd',
			inline: true
		} )
		 .on('changeDate', function(ev){
			$('#'+this.id).datepicker('hide');
		});
	});
		
	$(document).ready(function() {     
		$('#listAuctionItem').dataTable( {         
			"sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
			"sPaginationType": "bootstrap",
			"oLanguage": {
				"sLengthMenu": "_MENU_ records per page"
			}
		} ); 
		$('#listItem').dataTable( {         
			"sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
			"sPaginationType": "bootstrap",
			"oLanguage": {
				"sLengthMenu": "_MENU_ records per page"
			}
		} ); 
	} ); 
	
	function buttonFunction(name)
	{
		var blank = document.getElementById("jesusChrist"+name);
		blank.innerHTML = "<input type = 'text' name='itemQuantity'/>";
		blank.innerHTML += "<input type ='hidden' name='itemNumber' value = '"+name+"'/>";
	}
	
	function formCheck()
	{
		if(document.getElementsByName('itemNumber').length < 1) {
			alert('입고할 상품을 선택해 주세요');
			return false;
		}
	}
</script>
</head>
<body>
<div id="example_wrapper" class="dataTables_wrapper form-inline">
<table class="table table-striped table-bordered" id="listItem">
	<thead>
	<tr class="info">
		<th><b>auction_log_num</b></th>
		<th><b>item_num</b></th>
		<th><b>auction_num</b></th>
		<th><b>member_id</b></th>
		<th><b>auction_start_day</b></th>
		<th><b>auction_end_day</b></th>
	</tr>
	</thead>
	<tbody>
<s:iterator value="auctionLogList">
	<tr>
		<td><s:property value="auction_log_num"/></td>
		<td><s:property value="item_num"/></td>
		<td><s:property value="auction_num"/></td>
		<td><s:property value="member_id"/></td>
		<td><s:property value="auction_start_day"/></td>
		<td><s:property value="auction_end_day"/></td>
	</tr>
</s:iterator>
</tbody>
</table>
</div>
</body>
</html>