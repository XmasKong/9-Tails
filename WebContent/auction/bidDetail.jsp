<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<s:head theme="ajax" />
<title>9-Tails</title>
<!--  Font Style -->
<link
	href='http://api.mobilis.co.kr/webfonts/css/?fontface=NanumGothicWeb'
	rel='stylesheet' type='text/css' />
<link
	href='http://api.mobilis.co.kr/webfonts/css/?fontface=NanumGothicBoldWeb'
	rel='stylesheet' type='text/css' />
<script type='text/javascript' src='js/ajax.js'></script>
<!-- Bootstrap Style -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-responsive.css" rel="stylesheet">

<!-- JQuery -->
<script src="js/jquery.js"></script>

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

<!-- Auction Server Update 정의 -->
<!--  Detail Page Style -->
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
	right: 0;
	text-align: center;
	top: 30px;
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
	border-radius: 5px;
	/* border-bottom-left-radius: 10%;
    border-bottom-right-radius: 10%;
    border-top-left-radius: 10%;
    border-top-right-radius: 10%; */
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
</head>
<body>
	<input type="hidden" id="auction_num" value=adb.auction_num />
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
							<a href="/9-Tails/NowBuy.action">
								<button class="btn btn-inverse" type="button"
									<s:if test="adb.item_count==0">disabled="disabled"</s:if>>즉시구매</button>
							</a>
						</s:else>
					</div>
				</div>
			</div>
			<div class="span5">
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
	<div class="span11 offset1">
		<div class="tabbable">
			<!-- Only required for left/right tabs -->
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tab1" data-toggle="tab">Detail</a></li>
				<li><a href="#tab2" data-toggle="tab" onclick="ReviewList();">Review</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab1">
					
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
	<script src="js/bootstrap.js"></script>

</body>
</html>