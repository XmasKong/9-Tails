<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.net.InetAddress"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>9-Tails</title>
<!--  Font Style -->
<link href='http://api.mobilis.co.kr/webfonts/css/?fontface=NanumGothicWeb' rel='stylesheet' type='text/css' />
<link href='http://api.mobilis.co.kr/webfonts/css/?fontface=NanumGothicBoldWeb' rel='stylesheet' type='text/css' />

<!-- Bootstrap Style -->
<link href="/9-Tails/css/bootstrap.min.css" rel="stylesheet">
<link href="/9-Tails/css/bootstrap-responsive.css" rel="stylesheet">

<!-- Member Style -->
<link href="/9-Tails/css/member.css" rel="stylesheet">

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

<!-- Modal -->
<script src="/9-Tails/js/JoinModal.js"></script>

<!-- Auction Modal Script -->
<script>
 $("a[data-target=#bidModal]").click(function(ev) {     
	 ev.preventDefault();     
	 var target = $(this).attr("href");  
	 $("#bidModal modal-body").load(target, function() {           
		 $("#bidModal").modal("show");      
		 }); 
 });
</script>
<style>
.price {
	background-attachment: scroll;
	background-clip: border-box;
	background-color: hsl(197, 6%, 25%);
	background-image: none;
	background-origin: padding-box;
	background-position: 0 0;
	background-repeat: repeat;
	background-size: auto auto;
	border-bottom-left-radius: 50%;
	border-bottom-right-radius: 50%;
	border-top-left-radius: 50%;
	border-top-right-radius: 50%;
	height: 100px;
	padding-bottom: 15px;
	padding-left: 10px;
	padding-right: 10px;
	padding-top: 15px;
	position: absolute;
	right: 150px;
	text-align: center;
	top: 50px;
	width: 110px;
}

.price 
.def {
	-moz-font-feature-settings: normal;
	-moz-font-language-override: normal;
	-x-system-font: none;
	border-bottom-color: hsl(58, 100%, 70%);
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-top-color: hsl(58, 100%, 70%);
	border-top-style: solid;
	border-top-width: 1px;
	color: hsl(0, 0%, 86%);
	display: block;
	font-family: 'NanumGothicWeb', "DroidSansBold", Arial, Helvetica,
		sans-serif;
	font-size: 16px;
	font-size-adjust: none;
	font-stretch: normal;
	font-style: normal;
	font-variant: normal;
	font-weight: normal;
	line-height: 16px;
	margin-bottom: 6px;
	margin-left: 0;
	margin-right: 0;
	margin-top: 8px;
	padding-bottom: 6px;
	padding-left: 0;
	padding-right: 0;
	padding-top: 8px;
}

.price em {
	-moz-font-feature-settings: normal;
	-moz-font-language-override: normal;
	-x-system-font: none;
	color: hsl(55, 96%, 60%);
	font-family: 'BebasNeueRegular', Arial, Helvetica, sans-serif;
	font-size: 24px;
	font-size-adjust: none;
	font-stretch: normal;
	font-style: normal;
	font-variant: normal;
	font-weight: normal;
	line-height: 24px;
}

.price a {
	-moz-font-feature-settings: normal;
	-moz-font-language-override: normal;
	-x-system-font: none;
	color: hsl(0, 0%, 100%);
	font-family: "DroidSansBold", Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-size-adjust: none;
	font-stretch: normal;
	font-style: normal;
	font-variant: normal;
	font-weight: normal;
	line-height: 12px;
}

.titleBar {
	background-attachment: scroll;
	background-clip: border-box;
	background-color: hsl(220, 9%, 94%);
	background-image: none;
	background-origin: padding-box;
	background-position: 0 0;
	background-repeat: repeat;
	background-size: auto auto;
	clear: both;
	color: hsl(0, 0%, 50%);
	float: none;
	font-family: 'NanumGothicBoldWeb';
	font-size: 0.78em;
	font-weight: bold;
	line-height: 1em;
	padding-bottom: 10px;
	padding-left: 0;
	padding-right: 0;
	padding-top: 10px;
	position: relative;
	text-align: left;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.titleBar
.title {
	color: hsl(0, 0%, 0%);
	display: block;
	letter-spacing: 0.1em;
	padding-bottom: 0;
	padding-left: 25px;
	padding-right: 25px;
	padding-top: 0;
	position: relative;
	text-transform: uppercase;
	width: 490px;
	color: hsl(4, 45%, 44%);
}

.bodyStyle {
	color: hsl(0, 0%, 50%);
}

.specs h4 {
	border-bottom-color: hsl(0, 0%, 84%);
	border-bottom-style: solid;
	border-bottom-width: 1px;
	font-size: 0.733em;
	line-height: 0.933em;
	padding-bottom: 18px;
	padding-left: 0;
	padding-right: 0;
	padding-top: 18px;
	font-family: 'NanumGothicBoldWeb', 'ProximaNovaSemiBold', Arial,
		sans-serif;
	font-weight: normal;
	text-transform: uppercase;
}

.details h4 {
	border-bottom-color: hsl(0, 0%, 84%);
	border-bottom-style: solid;
	border-bottom-width: 1px;
	font-size: 0.733em;
	line-height: 0.933em;
	padding-bottom: 18px;
	padding-left: 0;
	padding-right: 0;
	padding-top: 18px;
	font-family: 'NanumGothicBoldWeb', 'ProximaNovaSemiBold', Arial,
		sans-serif;
	font-weight: normal;
	text-transform: uppercase;
}

.gallery h4 {
	border-bottom-color: hsl(0, 0%, 84%);
	border-bottom-style: solid;
	border-bottom-width: 1px;
	font-size: 0.733em;
	line-height: 0.933em;
	padding-bottom: 18px;
	padding-left: 0;
	padding-right: 0;
	padding-top: 18px;
	font-family: 'NanumGothicBoldWeb', 'ProximaNovaSemiBold', Arial,
		sans-serif;
	font-weight: normal;
	text-transform: uppercase;
}

.details {
	background-attachment: scroll;
	background-clip: border-box;
	background-color: hsl(220, 9%, 94%);
	background-image: none;
	background-origin: padding-box;
	background-position: 0 0;
	background-repeat: repeat;
	background-size: auto auto;
	padding-bottom: 35px;
	width: 324px;
}

li.info {
	border-bottom-color: hsl(0, 0%, 75%);
	border-bottom-style: dotted;
	border-bottom-width: 1px;
	height: 100%;
	overflow-x: hidden;
	overflow-y: hidden;
}

ul.specsList li .def {
	color: hsl(0, 0%, 54%);
	float: left;
	font-family: 'NanumGothicBoldWeb', 'ProximaNovaSemiBold', Arial,
		Helvetica, sans-serif;
	font-size: 1.0em;
	line-height: 3.278em;
	text-transform: uppercase;
	width: 100px;
}

ul.specsList li .val {
	color: hsl(0, 0%, 22%);
	float: left;
	font-family: 'NanumGothicWeb', 'ProximaNovaSemiBold', Arial, Helvetica,
		sans-serif;
	font-size: 1.0em;
	line-height: 3.278em;
	text-transform: uppercase;
	width: 135px;
	list-style: none;
}

.test
.time {
	background-color: hsl(0, 0%, 100%);
	-moz-font-feature-settings: normal;
	-moz-font-language-override: normal;
	-x-system-font: none;
	border-bottom-color: hsl(0, 0%, 91%);
	border-bottom-style: solid;
	border-bottom-width: 3px;
	border-top-color: hsl(0, 0%, 91%);
	border-top-style: solid;
	border-top-width: 3px;
	color: hsl(190, 57%, 57%);
	border-left-color: hsl(0, 0%, 91%);
	border-left-style: solid;
	border-left-width: 3px;
	color: hsl(190, 57%, 57%);
	border-right-color: hsl(0, 0%, 91%);
	border-right-style: solid;
	border-right-width: 3px;
	color: hsl(190, 57%, 57%);
	display: block;
	font-family: 'NanumGothicBoldWeb', "DroidSansBold", Arial, Helvetica,
		sans-serif;
	font-size: 18px;
	font-size-adjust: none;
	font-stretch: normal;
	font-style: normal;
	font-variant: normal;
	font-weight: normal;
	line-height: 18px;
	padding-bottom: 12px;
	padding-left: 10px;
	padding-right: 0;
	padding-top: 15px;
	-moz-border-radius: 5px;
}

.test span b {
	color: hsl(228, 6%, 33%);
}

.specs img {
	width: 60px;
	-moz-border-bottom-colors: none;
	-moz-border-left-colors: none;
	-moz-border-right-colors: none;
	-moz-border-top-colors: none;
	border-bottom-color: hsl(0, 0%, 75%);
	border-bottom-style: solid;
	border-bottom-width: 6px;
	border-image-outset: 0 0 0 0;
	border-image-repeat: stretch stretch;
	border-image-slice: 100% 100% 100% 100%;
	border-image-source: none;
	border-image-width: 1 1 1 1;
	border-left-color-ltr-source: physical;
	border-left-color-rtl-source: physical;
	border-left-color-value: hsl(0, 0%, 75%);
	border-left-style-ltr-source: physical;
	border-left-style-rtl-source: physical;
	border-left-style-value: solid;
	border-left-width-ltr-source: physical;
	border-left-width-rtl-source: physical;
	border-left-width-value: 6px;
	border-right-color-ltr-source: physical;
	border-right-color-rtl-source: physical;
	border-right-color-value: hsl(0, 0%, 75%);
	border-right-style-ltr-source: physical;
	border-right-style-rtl-source: physical;
	border-right-style-value: solid;
	border-right-width-ltr-source: physical;
	border-right-width-rtl-source: physical;
	border-right-width-value: 6px;
	border-top-color: hsl(0, 0%, 75%);
	border-top-style: solid;
	border-top-width: 6px;
	border-left-color: hsl(0, 0%, 75%);
	border-left-style: solid;
	border-left-width: 6px;
	border-right-color: hsl(0, 0%, 75%);
	border-right-style: solid;
	border-right-width: 6px;
}
div#reviewform{
	height: 210px;
	display: none;
}

</style>

<!--  Gallery Javascript -->
<script>
<!--
function transimg(place) {
	document.getElementById("main_image").innerHTML = "<img src=" + place + ">";
}
// -->
</script>

<!--  Web Socket -->
<script>
var wsUri = "ws://203.233.196.165:8888/9-Tails-socket/chat";//"ws://echo.websocket.org/";
var update = ${auc_update };

window.onload=function(){
	init();

	//WebSocket 서버  AuctionList 업데이트 요청
	if(update == true) {
		alert("서버 갱신 요청")
		sendMsg();
	}
}

function init(){
	initWebSocket(); 
}

var websocket;
function initWebSocket(){ 
	 websocket = new WebSocket(wsUri); 
	 websocket.onopen = function(evt) { onOpen(evt) }; 
	 websocket.onclose = function(evt) { onClose(evt) }; 
	 websocket.onmessage = function(evt) { onMessage(evt) }; 
	 websocket.onerror = function(evt) { onError(evt) }; 
}

function sendMsg(){
	if(websocket.readyState==3){
		 alert("not open");
		 initWebSocket();
	 }
	 var msg="update";
	 
	 doSend(msg); 
}

function onOpen(evt){ 
	//writeToScreen("CONNECTED");

	if(update == true)
		 doSend("update");
} 

function onClose(evt){ 
 	alert("DISCONNECTED"); 
}

function onMessage(evt){ 
	var auction = eval("("+evt.data+")");
    
	var duration = document.getElementById("duration");
    var now_price = document.getElementById("now_price");
    var member_id = document.getElementById("member_id");
    
    duration.innerHTML = auction.auc${adb.auction_num }.duration;
    now_price.innerHTML = auction.auc${adb.auction_num }.now_price;
    member_id.innerHTML = auction.auc${adb.auction_num }.member_id;
}

function onError(evt){ 
 	alert('ERROR: ' + evt.data); 
}

function doSend(message){ 
	alert(message);
	websocket.send(message); 
}

</script>

<!-- Main Style -->
<style>
.hovertest:hover {
	background-color: rgba(0, 0, 0, 0.1);
}

.divcolorout {
	color: #f5f5f5;
}
#jangbaguni {
	height: 20px;
}

div#baguni {
	display: none;
	height: 400px;
}

.tt {
	margin-top: 10px;
}

#floatMenu {
	position: absolute;
	top: 60px;
	left: 92%;
	width: 90px;
}

.mar {
	padding-top: 20px;
}

#floatMenu ul {
	margin-bottom: 20px;
}

#floatMenu ul li a {
	display: block;
	border: 1px solid #999;
	background-color: #222;
	border-left: 6px solid #999;
	text-decoration: none;
	color: #ccc;
	padding: 5px 5px 5px 25px;
}

#floatMenu ul li a:hover {
	color: #fff;
	background-color: #333333;
}

#floatMenu ul.menu1 li a:hover {
	border-color: #09f;
}

#floatMenu ul.menu2 li a:hover {
	border-color: #9f0;
}

#floatMenu ul.menu3 li a:hover {
	border-color: #f09;
}

.topmar {
	margin-top: 3px;
}

.navbtm {
	text-align: right;
}

.rotationViewer {
	position: relative;
	cursor: pointer;
	width: 505px;
	height: 300px;
}

.rotationViewer img {
	position: absolute;
	visibility: hidden;
	left: 0;
	top: 0;
}

#page-shareThisPanel {
	display: none;
}

#mask {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 9000;
	background-color: #000;
	display: none;
}

#boxes .window {
	position: fixed;
	left: 0;
	top: 0;
	width: 440px;
	height: 200px;
	display: none;
	z-index: 9999;
	padding: 20px;
}

#boxes #dialog {
	width: 700px;
	height: 500px;
	padding: 10px;
	background-color: #ffffff;
}

#boxes #dialog1 {
	width: 300px;
	height: 200px;
	padding: 10px;
	background-color: #ffffff;
}

#boxes #dialog2 {
	width: 500px;
	height: 280px;
	padding: 10px;
	background-color: #ffffff;
}

.topColor {
	background-color: #FC9F21;
}

.sliderItem {
	background: url("/9-Tails/images/test.png") no-repeat scroll 90% 90%
		#FFFFFF;
	border: 1px solid #DEDEDE;
	border-bottom: 7px solid #DEDEDE;
	margin-top: 10px;
	margin-bottom: 10px;
}

.sliderItemMar {
	margin-top: 0px;
	height: 300px;
}

.sliderItemMar img{
	height: 300px;
}

.slideInfo {
	padding: 10px;
	height: 280px;
}

.sliderItemPrice {
	color: red;
	font-weight: bold;
	font-size: 130px;
	line-height: 150px;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif
}

.sliderItemInfo {
	font-size: 24px;
	font-family: NanumGothicBoldWeb;
}

.AuctionItem {
	height: 150px;
}

.AuctionItem img {
	height: 100%;
}

.vv {
	vertical-align: middle;
}

.bordertest {
	border: solid;
}

.itemtimer {
	background-color: black;
	color: white;
	width: 50px;
	height: 40px;
	padding: 5px;
}

.itemprice {
	color: red;
	font-weight: bold;
	font-size: large;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif
}
</style>

<!-- 관심내역 -->
<script>
	function interestItem(aucid) {
		var test = "${member_id}";
		var check = false;
		<s:iterator value="#session.Interest_List">
			var item_num = <s:property value="auction_num"/>;
			if(item_num == aucid){
				check = true;
			}
		</s:iterator>
		if(test == ""){
			alert("로그인후 사용하세요");
			return false;
		}else if(check){
			alert("이미 등록되어있는 경매입니다");
			return false;
		}else{
			//window.location = "InterestItem.action?member_num="+ ${member_num}+"&auction_num=" + aucid;
			sendRequest("/9-Tails/InterestItem.action?member_num="+ ${member_num}+"&auction_num=" + aucid, "", "GET", OnInterestInsert);
		}
	}
	function OnInterestInsert(data){
		alert("저장되었습니다");
		location.reload();
	}
</script>
</head>
<body>
	<script>
		//Favorites List
		$(document).ready(function() {
			$('#jangbaguni').click(function() {
				$('#baguni').slideToggle(300);
			});
		});
	</script>
	<script>
		//Top Screen
		var hotKeyword = new scrolling("Roll_Notice", 2000, 1, 1, 18);
	</script>

	<!-- Global Navigation Bar(GNB) START -->
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-target=".nav-collapse"
					data-toggle="collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<!-- Logo -->
				<a class="brand" href="Main.action"><img
					src="/9-Tails/images/9-Tails.png"></a>
				<div class="nav-collapse">
					<ul class="nav">
						<li class="divider-vertical"></li>
						<li>
							<!-- Top Screen -->
							<div id="divRollbKeyy0">
								<div id="Roll_Notice" class="divRollbkeyBg">
									<s:iterator value="#session.topScreenList">
										<ul class="ulfont">
											<li
												onclick="javascript:window.location='AuctionDetail.action?auc_num=<s:property value="auction_num"/>'">
												&nbsp;<strong><s:property value="auction_member_id" /></strong>님이
												<strong><s:property value="auction_item_name" /></strong>
												상품을 <strong><s:property value="auction_now_price" /></strong>원에
												낙찰받으셨습니다.&nbsp;
											</li>
										</ul>
									</s:iterator>
								</div>
							</div>
							<div class="divRollbkeyBtn"
								onMouseOver="hotKeyword.div.isover=true;"
								onMouseOut="hotKeyword.div.isover=false;"></div>
						</li>
					</ul>
					<ul class="nav pull-right" style="color:white;">
						<!-- Admin Login -->
						<s:if test="#session.login_status == 2">
							<li><p/>
									<strong>${admin_name}</strong>님 관리자 Login
							</li>
							<li class="divider-vertical"></li>
							<li><a href="javascript:goAdminPage()"><i
									class="icon-bookmark icon-white"></i> 관리페이지</a></li>
							<li class="divider-vertical"></li>
							<li><a href="javascript:AdminLogout()"><i
									class="icon-off icon-white"></i> 로그아웃</a></li>
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
							<li><p/>
									 <img src="/9-Tails/img/songe_i.png"><strong> ${member_point }</strong>&nbsp;
							<img src="/9-Tails/img/be_i.png"><strong> ${member_point_free }</strong>
							</li>
							<li class="divider-vertical"></li>
							<li><a href="javascript:goMyPage()"><i
									class="icon-user icon-white"></i> 마이페이지</a></li>
							<li class="divider-vertical"></li>
							<li><a href="javascript:MemberLogout()"><i
									class="icon-off icon-white"></i> 로그아웃</a></li>
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
							<li><p/></li>
							<li class="divider-vertical"></li>
							<li><a href="#dialog1" name="modal"><i
									class="icon-lock icon-white"></i> 로그인</a></li>
							<li class="divider-vertical"></li>
							<li><a href="#dialog" name="modal"><i
									class="icon-edit icon-white"></i> 회원가입</a></li>
							<li class="divider-vertical"></li>
						</s:else>
						<script type="text/javascript">
							var hotKeyword = new scrolling("Roll_Notice", 2000,
									1, 1, 18);
						</script>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Global Navigation Bar(GNB) END -->

	<div id="maincontainer" class="container-fluid">
		<div class="row-fluid">
			<!-- Left SideBar -->
			<div class="span1">
				<!-- Advertisement Bar -->
				<div class="ad alternate hidden-phone">
					<span class="label">AD</span>
					<s:iterator value="#session.bannerList">
						<div class="ad-content">
							<a href="javascript:logBanner(${banner_num }, '${banner_url }')">
								<img src="/9-Tails/images/ad/${banner_image_url}"
								alt="${banner_name }">
							</a>
						</div>
					</s:iterator>
				</div>
				<script>
					function logBanner(bid,url) {
						sendRequest("/9-Tails/LogBanner.action?bid=" + bid, "", "GET", OnLog);
						window.open(url);
					}
					function OnLog(data) {
					}
				</script>
			</div>
			<!-- Center -->
			<div class="span10">
				<!-- Contents Body -->
				<input type="hidden" name="auc_num" value="${adb.auction_num }" />
				<div class="titleBar">
					<div class="title">[No.${adb.auction_num }]
						${adb.auction_item_name }</div>
				</div>
				<!--  경매 진행 시 Tag  -->
				<s:if test="adb.auction_status == (\"진행\")">
					<div class="price">
						<em>&#8361;<span id="now_price">${adb.auction_now_price }</span></em>
						<span class="def">입찰 ID: <span id="member_id">${adb.auction_member_id
								}</span></span> <a>TRY NOW</a>
					</div>
				</s:if>
				<!--  경매 마감 시 Tag  -->
				<s:if test="adb.auction_status == (\"마감\")">
					<div class="price">
						<em>&#8361;<span id="now_price">${adb.auction_now_price }</span></em>
						<span class="def">낙찰 ID: <span id="member_id">${adb.auction_member_id
								}</span></span> <a>CONGRATURATION</a>
					</div>
				</s:if>
			
				<div class="container-fluid">
					<div class="row-fluid">
						<div class="span1 offset1">
							<div class="specs">
								<h4>Thumbnails</h4>
								<img class="thumbnail" src="${adb.item_image1_url }"
									onClick=transimg('${adb.item_image1_url }');><br /> <img
									class="thumbnail" src="${adb.item_image2_url }" onClick=transimg('${adb.item_image2_url }');><br />
								<img class="thumbnail" src="${adb.item_image3_url }"
									onClick=transimg('${adb.item_image3_url }');>
							</div>
						</div>
						<div class="span4">
							<div class="details span12">
								<h4>DETAILS</h4>
								<ul class="specsList">
									<s:if
										test="adb.auction_status == (\"진행\") || adb.auction_status == (\"대기\")">
										<li class="info"><span class="def">현재가</span> <span class="val">&#8361;<span
												id="now_price">${adb.auction_now_price }</span></span></li>
										<li class="info"><span class="def">상품 가격</span> <span class="val">&#8361;${adb.item_nowbuy_price
												}</span></li>
										<li class="info"><span class="def">입찰 한도</span> <span class="val">&#8361;${adb.item_limit_price
												}</span></li>
										<li class="info"><span class="def">예상 이익율</span> <span class="val">${(adb.item_nowbuy_price-adb.auction_now_price)/adb.item_nowbuy_price*100}%</span>
										</li>
									</s:if>
									<s:else>
										<li class="info"><span class="def">상품 가격</span> <span class="val">&#8361;${adb.item_nowbuy_price
												}</span></li>
										<li class="info"><span class="def">낙찰 금액</span> <span class="val">&#8361;<span
												id="now_price">${adb.auction_now_price }</span></span></li>
										<li class="info"><span class="def">낙찰 이익율</span> <span class="val">${(adb.item_nowbuy_price-adb.auction_now_price)/adb.item_nowbuy_price*100}%</span>
										</li>
										<li class="info"><span class="def">낙찰자</span> <span class="val">${adb.auction_member_id
												}</span></li>
										<li class="info"><span class="def">마감 시간</span> <span class="val">${adb.auction_end_day
												}</span></li>
			
									</s:else>
								</ul>
								<s:if test="adb.auction_status == (\"진행\")">
									<div class="test" align="center">
										<span class="time"> <b class="def">남은 시간 &nbsp;</b> <span
											id="duration">${adb.auction_end_day }</span>
										</span>
									</div>
								</s:if>
								<div align="center">
									<!--  경매 진행 시에만 표시  -->
									<s:if test="adb.auction_status == (\"진행\")">
										<!-- Step1. 로그인 체크 -->
										<s:if test="#session.member_id == null">
											<a href="#dialog1" name="modal">
												<button class="btn btn-inverse" type="button">입찰하기</button>
											</a>
										</s:if>
										<!-- Step2. 송이 체크 -->
										<s:elseif
											test="#session.member_point+#session.member_point_free < 3">
											<a data-toggle="modal" href="auction/goCharge.jsp"
												data-target="#bidModal">
												<button class="btn btn-inverse" type="button">입찰하기</button>
											</a>
										</s:elseif>
										<!-- Step3. 입찰  -->
										<s:else>
											<a data-toggle="modal" href="auction/goBid.jsp"
												data-target="#bidModal">
												<button class="btn btn-inverse" type="button">입찰하기</button>
											</a>
										</s:else>
									</s:if>
									<!-- 상품 재고가 없으면 즉시 구매 불가 -->
									<!-- Step1. 로그인 체크 -->
									<s:if test="#session.member_id == null">
										<a href="#dialog1" name="modal">
											<button class="btn btn-inverse" type="button"
												<s:if test="adb.item_count==0">disabled="disabled"</s:if>>즉시구매</button>
										</a>
									</s:if>
									<!-- Step2. 즉시 구매 -->
									<s:else>
										<a href="/9-Tails/NowBuy.action?auc_num=${adb.auction_num }">
											<button class="btn btn-inverse" type="button"
												<s:if test="adb.item_count==0">disabled="disabled"</s:if>>즉시구매</button>
										</a>
									</s:else>
								</div>
							</div>
						</div>
						<div class="span6">
							<div class="gallery">
								<h4>VIEWER</h4>
								<div id="main_image">
									<img src=${adb.item_title_url } />
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Auction Modal 영역 -->
				<div class="modal" id="bidModal" style="display: none">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">Loading...</div>
					<s:if
						test="#session.member_point+#session.member_point_free > 3 && #session.member_id != null">
						<div class="modal-footer">
							<a
								href="DoBid.action?auc_num=${adb.auction_num }&id=${member_id}&uid=${member_num}"
								class="btn btn-danger">참여하기</a>
						</div>
					</s:if>
				</div>
				<script>
				$(document).ready(function() {
					$('#reviewslider').click(function() {
						$('#reviewform').slideToggle(500);
					});
					
			 		
					dojo.event.topic.subscribe("/after", function(data, request, widget) {
						ReviewList();
						$('#reviewform').slideUp(500);
					}); 
				});
				
				function ReviewList(){
					$('#reviewform').slideUp(5);
					var params="";
					sendRequest("/9-Tails/ReviewSelect.action?item_num="+${adb.item_num}, params,"GET", OnViewList);	
				}
				function OnViewList(data){
					document.getElementById("reviewlist").innerHTML = data;
				}
				function testtt(data){
					var target = "#show"+data;
						$(target).slideToggle(500);
				}
				</script>
				<div class="span12">
					<div class="tabbable">
						<!-- Only required for left/right tabs -->
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab1" data-toggle="tab">Detail</a></li>
							<li><a href="#tab2" data-toggle="tab" onclick="ReviewList();">Review</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab1">
								<img src="${adb.item_detail_url }" />
							</div>
							<div class="tab-pane" id="tab2">
								<button id="reviewslider" type="button" class="btn btn-inverse">write</button>
								
								<div id="reviewform">
									<s:form action="ReviewInsert" method="POST" enctype="multipart/form-data">
										<input type="hidden" name="item_num" value="${adb.item_num}"/>
										<input type="hidden" name="member_num" value="${member_num}"/>
										 <s:textfield name="review_subject" />
										 <s:file name="uploads" />
										 <s:textarea name="review_content"></s:textarea>
										 <s:submit theme="ajax" notifyTopics="/after"/>
									</s:form>
								</div>
								<p/>
								<div id="reviewlist">
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Right SideBar -->
			<div class="span1">
				<!-- Space -->
				<div style="height: 200px"></div>
				<!-- Floating Bar -->
				<div class="navbar navbar-inverse navbar-fixed-right"></div>
			</div>
		</div>
	</div>
	<!-- CONTAINER END -->

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

	<!-- 회원가입 & 로그인 팝업창 -->
	<div id="boxes">
		<div id="dialog" class="window">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
			<h4>Member Join</h4>
			<form name="frm_join" class="form-inline" method="POST"
				action="MemeberJoin.action">
				<table cellpadding="7" align="center">
					<tr>
						<td width="100" align="right">Id</td>
						<td width="450"><input type="text" class="input-xlarge" placeholder="Id" name="member_id" style="ime-mode:disabled"/>
							<button type="button" class="btn btn-inverse"
								onclick="onCheck();">중복 확인</button> 
							<input type="hidden"
							name="check" value="join" /> <input type="hidden"
							name="member_accredit" value="" />
							<br/>영문 6자 이상 12자 이하
							</td>
					</tr>
					<tr>
						<td align="right">Password</td>
						<td>
						<input type="password" class="input-xlarge" name="member_pwd" placeholder="Password">
						 6자 이상 12자 이하
						</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="password" class="input-xlarge"
							name="member_pwd_check" placeholder="Password check"></td>
					</tr>
					<tr>
						<td align="right">User Name</td>
						<td><input type="text" class="input-xlarge" name="member_name" placeholder="Name">
					</td>
					</tr>
					<tr>
						<td align="right">User Email</td>
						<td><input name="member_email" type="text" class="input-xlarge" placeholder="Email"></td>
					</tr>
					<tr>
						<td align="right">User Phone</td>
						<td><input name="member_phone" type="text"
							class="input-xlarge" placeholder="Phone"></td>
					</tr>
					<tr>
						<td align="right">User Bank</td>
						<td><input name="member_bank" type="text" class="input-medium"> &nbsp;ex) 우리은행&nbsp; 
						<input name="member_accnum" type="text" class="input-xlarge"></td>
					</tr>
					<tr>
						<td align="right">Address</td>
						<td><input name="member_addr" type="text" class="input-xxlarge" placeholder="Address">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><br />
							<button type="button" class="btn btn-inverse"
								onclick="MemberJoin();">가입완료</button></td>
					</tr>
				</table>
			</form>
			<script>
				var idcheck = false;
				//랜덤값 받아오는 함수
				function ran() {
					var rand = Math.floor(9999 * Math.random());
					document.frm_join.member_accredit.value = rand;
				}
				function MemberJoin() {
					var myform = document.from_join;
						
					if(idcheck == false){
						alert('ID 중복확인을 해주세요.');

					}else if(document.frm_join.member_pwd.value == ""){
						alert('비밀번호를 입력해주세요.');
						document.frm_join.member_pwd.focus();
					}else if(document.frm_join.member_pwd.value.length < 6 || document.frm_join.member_pwd.value.length > 12){
						alert('비밀번호는 6자 이상 12자 이하 입니다.');
						document.frm_join.member_pwd.focus();
						document.frm_join.member_pwd.value = "";
					}else if (document.frm_join.member_pwd.value != document.frm_join.member_pwd_check.value){
						alert('두 비밀번호가 동일하지 않습니다.');
						document.frm_join.member_pwd.focus();
						document.frm_join.member_pwd.value = "";
						document.frm_join.member_pwd_check.value = "";
					}else if(document.frm_join.member_name.value==""){
						alert('이름을 입력하세요.');
					}else if(document.frm_join.member_phone.value==""){
						alert('이메일을 입력하세요.');
					}else if(document.frm_join.member_bank.value==""){
						alert('이메일을 입력하세요.');
					}else if(document.frm_join.member_accnum.value==""){
						alert('이메일을 입력하세요.');
					}else if(document.frm_join.member_addr.value==""){
						alert('이메일을 입력하세요.');
					}else{
						alert('메일로 인증 메일을 전송했습니다.');
						ran();
						document.frm_join.submit();
						
					}
				}
				function onCheck() {
					var myform = document.frm_join;
					var member_id = myform.member_id;
					var test = member_id.value;
					for(var b = 0; b<test.length; b++){
					   var c = test.charCodeAt(b);
					   if(!( (  0x61 <= c && c <= 0x7A ) || ( 0x41 <= c && c <= 0x5A ) )){
					    alert("ID는 영문만 가능합니다.");
					    member_id.value="";
					    member_id.focus();
					    return;
					    }
					}
					if (member_id.value == "") {
						alert('Id를 입력해 주세요');
						member_id.focus();
						idcheck = false;
					}else if(!(member_id.value.length > 6 && member_id.value.length < 13)){
						alert('ID는 6자이상 12자 이하입니다.');
						idcheck = false;
					}else {
						var params = "";
						var id = member_id.value;
						sendRequest("/9-Tails/IdCheck.action?member_id=" + id,
								params, "GET", OnIdCheck);
						
					}
				}
				function OnIdCheck(data) {
					if (data == "OK") {
						idcheck = true;
						alert('사용가능한 아이디 입니다.');
						document.frm_join.member_pwd.focus();
						
					} else if (data == "NO") {
						alert('이미 사용중인 아이디 입니다.');
						document.frm_join.member_id.value = "";
						document.frm_join.member_id.focus();
						idcheck = false;
					}
				}
			</script>
		</div>
		<div id="dialog1" class="window">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
			<h4>Login</h4>
			<form method="POST" name="frm_login" action="MemberLogin.action">
				<table align="center" border="0">
					<tr>
						<td align="right">Id</td>
						<td><input name="Login_id" type="text" class="input-medium"
							placeholder="Id"></td>
					</tr>
					<tr>
						<td align="right">Password</td>
						<td><input name="Login_pwd" type="password"
							class="input-medium" placeholder="password"></td>
					</tr>
					<!-- 					<tr>
						<td colspan="2" align="center"><br />
							<button type="button" onclick="goLogin();"
								class="btn btn-inverse">로그인</button></td>
					</tr> -->
					<tr>
						<td></td>
						<td><a href="#dialog2" name="modal">아이디 / 패스워드 찾기</a></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><br />
							<button type="button" onclick="goLogin();"
								class="btn btn-inverse"><i
									class="icon-lock icon-white"></i>&nbsp;로그인</button></td>
					</tr>
				</table>
				<script>
					function goLogin() {
						/* document.frm_login.submit(); */
						var id = document.frm_login.Login_id.value;
						var pwd = document.frm_login.Login_pwd.value;
						var params = "";
						sendRequest("/9-Tails/MemberLogin.action?Login_id="
								+ id + "&Login_pwd=" + pwd, params, "GET",
								onLoginCheck);
					}
					function onLoginCheck(data) {
						if (data == "") {
							alert("아이디 또는 비밀번호가 틀립니다.");
							document.frm_login.Login_id.value = "";
							document.frm_login.Login_pwd.value = "";
							document.frm_login.Login_id.focus();
						}else if(data == "0"){
							alert("탈퇴 또는 블럭 사용자 아이디 입니다.\n회원가입 또는 관리자에게 문의하세요.");
						}else {
							alert("환영합니다");
							window.location = "Main.action";
						}
					}
				</script>

			</form>

		</div>
		<!-- 아이디 찾기 -->
		<script>
			function SearchId(){
				var name = document.frm_searchid.search_name.value;
				var email = document.frm_searchid.search_email.value;
				if(name == "" || email == ""){
					alert("입력항목 오류.");
					return false;
				}
				var params = "";
				sendRequest("/9-Tails/SearchLogin.action?search_status=id&search_name="
						+ name + "&search_email=" + email, params, "GET",
						onSearchId);
			}
			function onSearchId(data){
				document.getElementById("searchId").innerHTML = data;
			}
			function SearchPwd(){
				var name = document.frm_searchpwd.searchpw_name.value;
				var id = document.frm_searchpwd.searchpw_id.value;
				var email = document.frm_searchpwd.searchpw_email.value;
				var params = "";
				if(name == "" || email == "" || id == ""){
					alert("입력항목 오류.");
					return false;
				}
				sendRequest("/9-Tails/SearchLogin.action?search_status=pwd&searchpw_name="+ name +"&searchpw_id=" + id + "&searchpw_email=" + email, params, "GET", onSearchPwd);
			}
			function onSearchPwd(data){
				if(data == 0){
					document.getElementById("searchPwd").innerHTML = "<div class='alert alert-error'><button type='button' class='close' data-dismiss='alert'>×</button><strong>Warning!</strong>아이디 또는 이름과 이메일 정보가 일치하지 않습니다.</div>";
				}else if (data == 1){
					document.getElementById("searchPwd").innerHTML = "<div class='alert alert-success'><button type='button' class='close' data-dismiss='alert'>×</button><strong>Success!</strong>비밀번호가 메일로 발송되었습니다.</div>";
				}
				
			}
		</script>
		<div id="dialog2" class="window">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
			<div class="tabbable">
				<!-- Only required for left/right tabs -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab1" data-toggle="tab">아이디
							찾기</a></li>
					<li><a href="#tab2" data-toggle="tab">패스워드 찾기</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab1" align="center"
						style="margin-top: 0px;">
						<form name="frm_searchid">
							<table border="0" width="100%">
								<tr>
									<td width="110" align="right">성명</td>
									<td><input name="search_name" type="text"
										class="input-medium" placeholder="Name"></td>
								</tr>
								<tr>
									<td align="right">이메일</td>
									<td><input name="search_email" type="text"
										class="input-xlarge" placeholder="E-mail"></td>
								</tr>
								<tr>
									<td colspan="2" align="center"><button type="button"
											onclick="SearchId();" class="btn btn-inverse">Search</button></td>
								</tr>
							</table>
						</form>
						<div id="searchId"></div>
					</div>
					<div class="tab-pane" id="tab2">
						<div class="row-fluid">
							<form name="frm_searchpwd">
								<table align="left" border="0" width="100%">
									<tr>
										<td width="110" align="right">성명</td>
										<td><input name="searchpw_name" type="text"
											class="input-medium" placeholder="Name"></td>
										<td>
											<button type="button" onclick="SearchPwd();"
												class="btn btn-inverse">Search</button>
										</td>
									</tr>
									<tr>
										<td align="right">아이디</td>
										<td><input name="searchpw_id" type="text"
											class="input-medium" placeholder="Id"></td>
									</tr>
									<tr>
										<td align="right">이메일</td>
										<td colspan="2"><input name="searchpw_email" type="text"
											class="input-xlarge" placeholder="E-mail"></td>
									</tr>
								</table>
							</form>
						</div>
						<div class="alert alert-info">
							이메일로 비밀번호가 전송되오니 정확하게 입력해주시기 바랍니다
						</div>
						<div id="searchPwd"></div>
					</div>

				</div>
			</div>
		</div>
		<div id="mask"></div>
	</div>
	<script>
		var name = "#floatMenu";
		var menuYloc = null;

		$(document).ready(
				function() {
					menuYloc = parseInt($(name).css("top").substring(0,
							$(name).css("top").indexOf("px")))
					$(window).scroll(function() {
						offset = menuYloc + $(document).scrollTop() + "px";
						$(name).animate({
							top : offset
						}, {
							duration : 500,
							queue : false
						});
					});
				});
		
	</script>
	<div id="floatMenu" class="hidden-phone">
		<div class="well" style="max-width: 350px; padding: 8px 0;">
			<s:if test="#session.member_id != null">
				<table width="100%">
					<tr>
						<td class="floatBar"><a href="#"><img
								src="/9-Tails/img/news.png" /><br /> <span
								class="label label-inverse">공지</span></a></td>
					</tr>
					<tr>
						<td class="floatBar"><a href="/9-Tails/Charge.action"><img
								src="/9-Tails/img/charge.png" /><br /> <span
								class="label label-inverse">충전소</span></a></td>
					</tr>
					<tr>
						<td class="floatBar"><a href="#"><img
								src="/9-Tails/img/guide.png" /><br /> <span
								class="label label-inverse">이용가이드</span></a></td>
					</tr>
					<tr align="center">
						<td class="floatBar"><a id="jangbaguni" href="#"><img
								src="/9-Tails/img/jang.png" /><br /> <span
								class="label label-inverse">장바구니</span></a></td>
					</tr>
					<tr>
						<td class="floatBar"><a href="#"><span
								class="label label-inverse">TOP으로 </span></a></td>
					</tr>
				</table>
				<script>
					function InterestDel(item_num){
						sendRequest("/9-Tails/MemberInterestDel.action?del_check=floatMenu&interest_item_num="+item_num+"&member_num="+${member_num}, "", "GET", onDelSuccess);
					}
					function onDelSuccess(data){
						alert('삭제완료');
						location.reload();
					}
				</script>
				<div id="baguni">
					<s:iterator value="#session.Interest_List">
						<table>
							<tr>
								<td align="right"><a href="#"
									onclick="InterestDel('<s:property value="interest_item_num"/>');"><i
										class="icon-trash"></i></a></td>
							</tr>
							<tr>
								<td><a
									href="AuctionDetail.action?auc_num=<s:property value="auction_num"/>"><img
										src="<s:property value="item_title_url"/>" width="100px"
										height="150px" /></a></td>
							</tr>
						</table>
					</s:iterator>
				</div>
			</s:if>
			<s:else>
				<table width="100%">
					<tr>
						<td class="floatBar"><a href="#"><img
								src="/9-Tails/img/news.png" /><br /> <span
								class="label label-inverse">공지</span></a></td>
					</tr>
					<%-- 					<tr>
						<td class="floatBar"><a href="/9-Tails/Main.action"><img
								src="/9-Tails/img/auction.png" /><br /> <span
								class="label label-inverse">일반 경매</span></a></td>
					</tr> --%>
					<tr>
						<td class="floatBar"><a href="/9-Tails/Charge.action"><img
								src="/9-Tails/img/charge.png" /><br /> <span
								class="label label-inverse">충전소</span></a></td>
					</tr>
					<tr>
						<td class="floatBar"><a href="#"><img
								src="/9-Tails/img/guide.png" /><br /> <span
								class="label label-inverse">이용가이드</span></a></td>
					</tr>
					<tr>
						<td class="floatBar"><a href="#"><img
								src="/9-Tails/img/top.png" /><br /> <span
								class="label label-inverse">TOP으로 가기</span></a></td>
					</tr>
				</table>
			</s:else>
		</div>
	</div>
	<!-- Bootstrap JavaScript -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="/9-Tails/js/bootstrap.js"></script>
</body>
</html>