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
<link href="/9-Tails/css/bootstrap-responsive.css" rel="stylesheet">

<!-- Admin Style -->
<link href="/9-Tails/css/admin.css" rel="stylesheet">

<!-- JQuery -->
<script src="/9-Tails/js/jquery.js"></script>

<!-- DataTable -->
<link href="/9-Tails/css/DT_bootstrap.css" rel="stylesheet">
<script src="/9-Tails/js/jquery.dataTables.js"></script>
<script src="/9-Tails/js/DT_bootstrap.js"></script>

<!-- DatePicker -->
<link href="/9-Tails/css/datepicker.css" rel="stylesheet">
<script src="/9-Tails/js/bootstrap-datepicker.js"></script>

<!-- Top Screen -->
<script src="/9-Tails/js/topscreen.js"></script>
<link href="/9-Tails/css/topscreen.css" rel="stylesheet">

<!-- Ajax -->
<script type='text/javascript' src='/9-Tails/js/ajax.js' /></script>

<!-- Admin Menu -->
<script>
	$(document).ready(function() {
		sendRequest("/9-Tails/PrintingLog1.action", "" ,"POST", printLog);
	
		$('#listItem').dataTable();
		
		$('.active').parents('ul').show();
		
		$('.leftmenu a').click(function() {
			var submenu = $(this).siblings('ul');
			$(submenu).slideToggle(300);
		});
	});

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

<!-- Print Log in SubMenu -->
<script type="text/javascript">
var timer = setInterval(function(){
	sendRequest("/9-Tails/PrintingLog1.action", "" ,"POST", printLog);
}, 2000);
function printLog(data){
	var text = data;
	var a = text.split(":");
	document.getElementById("paymentcount").innerHTML = a[0];
	document.getElementById("requestcount").innerHTML = a[1];
	document.getElementById("resultcount").innerHTML = Number(a[0])+Number(a[1]);
}

</script>

<!-- Print Top Screen -->
<script>
	var hotKeyword = new scrolling("Roll_Notice", 2000, 1, 1, 18);
</script>

</head>
<body>
	<!-- Global Navigation Bar(GNB) START -->
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-target=".nav-collapse" data-toggle="collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</a>
				<!-- Logo -->
				<a class="brand" href="Main.action"><img src="/9-Tails/images/9-Tails.png"></a>
				<div class="nav-collapse">
					<ul class="nav">
						<li class="divider-vertical"></li>
						<li>
						<!-- Top Screen -->
						<div id="divRollbKeyy0">
							<div id="Roll_Notice" class="divRollbkeyBg">
								<s:iterator value="#session.topScreenList">
									<ul class="ulfont">
										<li>
										『&nbsp;<strong><s:property value="auction_member_id" /></strong>님이
										<strong><s:property value="auction_item_name" /></strong> 상품을  
										<strong><s:property value="auction_now_price" /></strong>원에 낙찰받으셨습니다.&nbsp;』
										</li>
									</ul>
								</s:iterator>
							</div>
						</div>
						<div class="divRollbkeyBtn"
							onMouseOver="hotKeyword.div.isover=true;"
							onMouseOut="hotKeyword.div.isover=false;">
						</div>
						</li>
					</ul>
					<ul class="nav pull-right">
						<!-- Admin Login -->
						<s:if test="#session.login_status == 2">
						<li><p><strong>${admin_name}</strong>님 관리자 Login</p></li>
						<li class="divider-vertical"></li>
						<li><a href="javascript:goAdminPage()"><i class="icon-bookmark icon-white"></i> 관리페이지</a></li>
						<li class="divider-vertical"></li>
						<li><a href="javascript:AdminLogout()"><i class="icon-off icon-white"></i> 로그아웃</a></li>
						<li class="divider-vertical"></li>
							<script>
								function AdminLogout() {
									alert("이용해주셔서 감사합니다.");
									window.location = "AdminLogout.action";
								}
								function goAdminPage() {
									window.location = "AdminMain.action";
								}
							</script>
						</s:if>
					
						<!-- Member Log-In -->
						<s:elseif test="#session.login_status == 1">
						<li>
							<p>
							<s:if test="#session.admin_grade_num == 1">
								<img src="img/bronze_i.png"/>
							</s:if><s:elseif test="#session.admin_grade_num == 2">
								<img src="img/silver_i.png"/>
							</s:elseif><s:elseif test="#session.admin_grade_num == 3">
								<img src="img/gold_i.png"/>
							</s:elseif><s:elseif test="#session.admin_grade_num == 4">
								<img src="img/vip_i.png"/>
							</s:elseif>
							<strong>${member_id}</strong>님 Login |
							<img src="/9-Tails/img/songe_i.png"><strong> ${member_point }</strong>송이 |
							<img src="/9-Tails/img/be_i.png"><strong> ${member_point_free }</strong>송이
							</p>
						</li>
						<li class="divider-vertical"></li>
						<li><a href="javascript:goMyPage()"><i class="icon-user icon-white"></i> 마이페이지</a></li>
						<li class="divider-vertical"></li>
						<li><a href="javascript:MemberLogout()"><i class="icon-off icon-white"></i> 로그아웃</a></li>
						<li class="divider-vertical"></li>
						<script>
							function MemberLogout() {
								alert("이용해주셔서 감사합니다.");
								window.location = "MemberLogout.action";
							}
							function goMyPage() {
								window.location = "MemberMain.action";
							}
						</script>
						</s:elseif>
					
					<!-- 블럭 사용자 -->
					<s:elseif test="#session.login_status == 0">
					</s:elseif>
					
					<!-- General  -->
					<s:else>
						<li class="divider-vertical"></li>
						<li><a href="#dialog1" name="modal"><i class="icon-lock icon-white"></i> 로그인</a></li>
						<li class="divider-vertical"></li>
						<li><a href="#dialog" name="modal"><i class="icon-edit icon-white"></i> 회원가입</a></li>
						<li class="divider-vertical"></li>
					</s:else>
					<script type="text/javascript">
						var hotKeyword = new scrolling("Roll_Notice", 2000, 1, 1, 18);
					</script>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Global Navigation Bar(GNB) END -->

	<!-- Main START -->
	<div id="maincontainer" class="container-fluid">
		<div class="row-fluid">
			<!-- Left SideBar -->
			<div class="span3 leftmenu">
				<!-- Admin Login Info START -->
				<div class="logininfo">
					<i class="icon-user"></i><strong>${admin_name}</strong>님<br/>
					<i class="icon-bookmark"></i>
					<strong>
					<s:if test="#session.admin_grade_num == 1">
					마스터
					</s:if>
					<s:elseif test="#session.admin_grade_num == 2">
					선임
					</s:elseif>
					<s:elseif test="#session.admin_grade_num == 3">
					일반
					</s:elseif>
					<s:else>
					수습
					</s:else>
					</strong>
					관리자
				</div>
				<!-- Admin Login Info END -->
				<!-- Submenu START -->
				<ul class="nav">
					<li class="active">
						<a href="/9-Tails/AdminMain.action">
							<span class="ico">
							<i class="icon-home"></i>
							</span>
							<span class="text">Home</span>
						</a>
					</li>
					
					<li>
						<a href="#">
							<span class="ico">
							<i class="icon-tasks"></i>
							</span>
							<span class="text">웹 콘텐츠 관리</span>
						</a>
						<ul style="display: none;">
						<s:if test="#session.admin_grade_num < 4">
						<li>
						<a href="/9-Tails/AdminMainAuction.action">
						<span class="ico">
						<i class="icon-star"></i>
						</span>						<span class="text">메인 추천 경매</span>
						</a>
						</li>
						</s:if>
						<s:if test="#session.admin_grade_num < 3">
						<li>
						<a href="/9-Tails/AdminAD.action">
						<span class="ico">
						<i class="icon-minus"></i>
						</span>
						<span class="text">광고 배너</span>
						</a>
						</li>
						</s:if>
						<li>
						<a href="/9-Tails/AdminFAQ.action">
						<span class="ico">
						<i class="icon-exclamation-sign"></i>
						</span>
						<span class="text">이용 가이드(FAQ)</span>
						</a>
						</li>
						</ul>
					</li>
					
					<li>
						<a href="#">
							<span class="ico">
							<i class="icon-calendar"></i>
							</span>
							<span class="text">경매 관리</span>
						</a>
						<ul style="display: none;">
						<li>
						<a href="/9-Tails/AdminAddItem.action">
						<span class="ico">
						<i class="icon-plus"></i>
						</span>
						<span class="text">일반 물품 등록</span>
						</a>
						</li>
						
						<s:if test="#session.admin_grade_num < 4">
						<li>
						<a href="/9-Tails/AdminManageItem.action">
						<span class="ico">
						<i class="icon-barcode"></i>
						</span>
						<span class="text">일반 물품 관리</span>
						</a>
						</li>
						</s:if>
						
						<s:if test="#session.admin_grade_num < 3">
						<li>
						<a href="/9-Tails/AdminAcceptPayment.action">
						<span class="ico">
						<i class="icon-check"></i>
						</span>
						<span class="text">결제 승인 <span id="paymentcount" class="badge badge-important"></span></span>
						</a>
						</li>
						</s:if>
						
						<li>
						<a href="/9-Tails/AdminDelivery.action">
						<span class="ico">
						<i class="icon-inbox"></i>
						</span>
						<span class="text">배송 관리</span>
						</a>
						</li>
						</ul>
					</li>
					
					<li>
						<a href="#">
							<span class="ico">
							<i class="icon-edit"></i>
							</span>
							<span class="text">CS 관리</span>
						</a>
						<ul style="display: none;">

						<li>
						<a href="/9-Tails/AdminSpecialOrder.action">
						<span class="ico">
						<i class="icon-bell"></i>
						</span>
						<span class="text">스페셜 오더</span>
						</a>
						</li>
						
						<li>
						<a href="/9-Tails/AdminRequestConfirm.action">
						<span class="ico">
						<i class="icon-comment"></i>
						</span>
						<span class="text">관리자 요청(1:1) <span id="requestcount" class="badge badge-important"></span></span>
						</a>
						</li>
						</ul>
					</li>
					
					<li>
						<a href="#">
							<span class="ico">
							<i class="icon-list-alt"></i>
							</span>
							<span class="text">커뮤니티 관리</span>
						</a>
						
						<ul style="display: none;">
						<li>
						<a href="/9-Tails/AdminNotice.action">
						<span class="ico">
						<i class="icon-volume-up"></i>
						</span>
						<span class="text">공지사항</span>
						</a>
						</li>
						
						<li>
						<a href="/9-Tails/AdminPoll.action">
						<span class="ico">
						<i class="icon-align-right"></i>
						</span>
						<span class="text">설문조사</span>
						</a>
						</li>
						</ul>
					</li>
					
					<li>
						<a href="#">
							<span class="ico">
							<i class="icon-lock"></i>
							</span>
							<span class="text">계정 관리</span>
						</a>
						
						<ul style="display: none;">
						<li>
						<a href="/9-Tails/AdminMemberAdministr.action">
						<span class="ico">
						<i class="icon-user"></i>
						</span>
						<span class="text">회원</span>
						</a>
						</li>
						
						<s:if test="#session.admin_grade_num == 1">
						<li>
						<a href="/9-Tails/AdminAdministr.action">
						<span class="ico">
						<i class="icon-bookmark"></i>
						</span>
						<span class="text">관리자</span>
						</a>
						</li>
						</s:if>
						</ul>
					</li>
					
					<li>
						<a href="/9-Tails/AdminSearchLog.action">
							<span class="ico">
							<i class="icon-search"></i>
							</span>
							<span class="text">로그 조회</span>
						</a>
					</li>
					
					<li>
						<a href="/9-Tails/AdminChange.action">
							<span class="ico">
							<i class="icon-wrench"></i>
							</span>
							<span class="text">나의 정보 관리</span>
						</a>
					</li>
				</ul>
				<!-- Submenu END -->
			</div>
			<!-- Content -->
			<div id="content" class="span9">
				<!-- Page Title START -->
				<div class="row-fluid">
				<h3 class="maininfo">관리자 페이지<small>manage main</small>
				<span class="label label-inverse">
				오늘접속자 : ${connetcount} 명
				 | 승인 대기 : <span id="resultcount"></span>건
				</span>
				</h3>
				</div>
				<!-- Page Title END -->
				<!-- Page Content START -->
				<div class="row-fluid">
				<div id="contentbody" class="span12">
					<div class="box alternate">
						<div class="box-title">
						Site Map
						</div>
						<div class="box-content">
						<table width="100%" border="0" cellpadding="5">
							<tr style="font-size:13pt;font-weight:bold;">
								<td>웹 콘텐츠 관리</td>
								<td>경매 관리</td>
								<td>CS 관리</td>
							</tr> 
							<tr>
								<td colspan="3"><hr></hr></td>
							</tr>
							<tr align="center"> 
								<td><a href="/9-Tails/AdminMainAuction.action">메인 추천 경매</a></td>
								<td><a href="/9-Tails/AdminAddItem.action">일반 물품 등록</a></td>
								<td><a href="/9-Tails/AdminSpecialOrder.action">스페셜 오더</a></td>
							</tr>
							<tr align="center"> 
								<td><a href="/9-Tails/AdminAD.action">광고 베너</a></td>
								<td><a href="/9-Tails/AdminManageItem.action">일반 물품 관리</a></td>
								<td><a href="/9-Tails/AdminRequestConfirm.action">관리자 요청(1:1)</a></td>
							</tr>
							<tr align="center"> 
								<td><a href="/9-Tails/AdminFAQ.action">이용 가이드(FAQ)</a></td>
								<td><a href="/9-Tails/AdminAcceptPayment.action">결제 승인</a></td>
								<td></td>
							</tr>
							<tr align="center"> 
								<td></td>
								<td><a href="/9-Tails/AdminDelivery.action">배송 관리</a></td>
								<td></td>
							</tr>
						</table>
						<br/>
						<table width="100%" border="0" cellpadding="5">
							<tr style="font-size:13pt;font-weight:bold;">
								<td>커뮤니티 관리</td>
								<td>계정 관리</td>
								<td><a href="/9-Tails/AdminSearchLog.action">로그 조회</a></td>
								<td><a href="/9-Tails/AdminChange.action">나의 정보 관리</a></td>
							</tr>
							<tr>
								<td colspan="4"><hr></hr></td>
							</tr>
							<tr align="center"> 
								<td><a href="/9-Tails/AdminNotice.action">공지 사항</a></td>
								<td><a href="/9-Tails/AdminMemberAdministr.action">회원</a></td>
								<td></td>
								<td></td>
							</tr>
							<tr align="center"> 
								<td><a href="/9-Tails/AdminPoll.action">설문 조사</a></td>
								<td><a href="/9-Tails/AdminAdministr.action">관리자</a></td>
								<td></td>
								<td></td>
							</tr>
						</table>
						</div>
					<div>
				</div>
				</div>
				<!-- Page Content END -->
			</div>
		</div>
	</div>
		</div>
	</div>
	<!-- COPYRIGHT START -->
	<div id="footer" class="container-fluid footer">
		<div class="row-fluid">
			<div class="span12">
				<footer>
					<p>
						© 2012 IT MASTER+ 23rd, 3rd IT Project, <strong>TEAM2</strong>.
						All Rights Reserved.
					</p>
					<p>
						<img src="/9-Tails/images/chrome.png"/> 9-Tails는 <strong>© Google Chrome</strong>에 최적화 되어 있습니다.
					</p>
				</footer>
			</div>
		</div>
	</div>
	<!-- COPYRIGHT END -->

	<!-- Bootstrap JavaScript -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="/9-Tails/js/bootstrap.js"></script>
</body>
</html>