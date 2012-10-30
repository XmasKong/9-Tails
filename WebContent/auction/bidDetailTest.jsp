<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="auction.model.AuctionBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>9-Tails</title>
<!-- Bootstrap Style -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-responsive.css" rel="stylesheet">
<script type="text/javascript" src="js/Uize.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 로그인 & 조인 -->

<script src="js/JoinModal.js"></script>
<script src="js/LoginModal.js"></script>
<script type='text/javascript' src='js/ajax.js' /></script>

<!--  top screen -->
<script src="js/topscreen.js"></script>
<link href="css/topscreen.css" rel="stylesheet" type="text/css">
<script>
	/* var wsUri = "ws://203.233.196.165:8888/9-Tails-socket/chat";//"ws://echo.websocket.org/";
	 window.onload=function(){
	 init();
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
	 var msg=document.FmChat.msg.value;
	 doSend(msg); 
	 document.FmChat.msg.value="";
	 }

	 function onOpen(evt){ 
	 writeToScreen("CONNECTED"); 
	 } 

	 function onClose(evt){ 
	 writeToScreen("DISCONNECTED"); 
	 }

	 function onMessage(evt){ 
	 //	 writeToScreen('RESPONSE: ' + evt.data+'');
	 var auction = eval("("+evt.data+")");
	 var pre =document.getElementById("msg");
	 document.frm_test.test1.value=auction.auc21.duration;
	 document.frm_test.test2.value=auction.auc22.duration;
	 document.frm_test.test3.value=auction.auc23.duration;
	
	 }

	 function onError(evt){ 
	 writeToScreen('ERROR: ' + evt.data); 
	 }

	 function doSend(message){ 
	 writeToScreen("SENT: " + message); 
	 websocket.send(message); 
	 }

	 function writeToScreen(message){ 
	 var pre =document.getElementById("msg");
	 } */
</script>
<style>
.test {
	valign: middle;
	height: 300px;
}

.mar {
	margin-top: 50px;
}

.jumbotron:after {
	background-attachment: scroll;
	background-clip: border-box;
	background-color: transparent;
	background-image: url("../img/bs-docs-masthead-pattern.png");
	background-origin: padding-box;
	background-position: center center;
	background-repeat: repeat;
	background-size: auto auto;
	bottom: 0;
	content: "";
	display: block;
	left: 0;
	opacity: 0.4;
	position: absolute;
	right: 0;
	top: 0;
}

.jumbotron {
	background-attachment: scroll;
	background-clip: border-box;
	background-color: transparent;
	background-origin: padding-box;
	background-position: 0 0;
	background-repeat: repeat;
	background-size: auto auto;
	padding-left: 0;
	padding-right: 0;
	position: relative;
	text-align: center;
}

.rotationViewer {
	position: relative;
	width: 530px;
	height: 300px;
	border-style: solid;
	border-width: 1px;
	margin-bottom: 0px;
	cursor: pointer;
}

.rotationViewer img {
	position: absolute;
	visibility: hidden;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
}

#page-shareThisPanel {
	visibility: hidden;
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
	width: 700px;
	height: 500px;
	padding: 10px;
	background-color: #ffffff;
}

span#test_id1 {
	color: red;
	cursor: pointer;
}

span#test_id2 {
	display: none;
}

div#one {
	height: 80px;
	display: none;
	margin-left: 5%
}
</style>
</head>
<body>
	<script>
		// slider function start
		function onCheck() {
			var myform = document.frm_join;
			var member_id = myform.member_id;
			if (member_id.value == "") {
				alert('Id를 입력해 주세요');
				member_id.focus();
			} else {
				var params = "";
				var id = member_id.value;
				sendRequest("/9-Tails/IdCheck.action?member_id=" + id, params,
						"GET", OnIdCheck);
			}
		}
		function EmailSelect() {
			var myform = document.frm_join;
			if (myform.member_emailselect.value == "Email Select") {
				myform.member_email2.value = "";
			} else {
				myform.member_email2.value = myform.member_emailselect.value;
			}
		}
	</script>
	<script>
		var hotKeyword = new scrolling("Roll_Notice", 2000, 1, 1, 18);
	</script>
	<!-- Global Navigation Bar(GNB) -->
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-target=".nav-collapse"
					data-toggle="collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="http://localhost/9-Tails/main.jsp">9-Tails</a>
				<div class="nav-collapse ">
					<div class="pull-right">
						<s:if test="#session.member_id == null">
							<a href="#dialog1" name="modal">
								<button class="btn btn-mini btn-inverse" type="button">Login</button>
							</a>
							<a href="#dialog" name="modal">
								<button class="btn btn-mini btn-inverse" type="button">Join</button>
							</a>
						</s:if>
						<s:else>
							<script>
								function MemberLogout() {
									alert("이용해주셔서 감사합니다.");
									window.location = "http://localhost/9-Tails/MemberLogout.action";
								}
								function goMyPage() {
									window.location = "http://localhost/9-Tails/memberpage.jsp";
								}
							</script>
							<a href="#dialog2" name="modal">${member_id}</a>님 방갑습니다.<button
								type="button" onclick="MemberLogout();"
								class="btn btn-mini btn-inverse">Logout</button>
							<button type="button" onclick="goMyPage()"
								class="btn btn-mini btn-inverse">My Page</button>
						</s:else>
					</div>
					<!-- Top Screen -->
					<div id="divRollbKeyy0" class="">
						<div id="Roll_Notice" class="divRollbkeyBg">
							<font color="white" size="3px"><b> <s:iterator
										value="#session.topScreenList">
										<ul>
											<li><s:property value="auction_member_id" /> 님이 <s:property
													value="auction_item_name" /> 을 <s:property
													value="auction_now_price" /> 원에 낙찰 받으셨습니다.</li>
										</ul>
									</s:iterator>
							</b></font>
						</div>
					</div>
					<div class="divRollbkeyBtn"
						onMouseOver="hotKeyword.div.isover=true;"
						onMouseOut="hotKeyword.div.isover=false;"></div>
					<script type="text/javascript">
						var hotKeyword = new scrolling("Roll_Notice", 2000, 1,
								1, 18);
					</script>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row-fluid">
			<!-- Left SideBar -->
			<div class="span1">
				<!-- Space -->
				<div style="height: 200px"></div>
				<!-- Advertisement Bar -->
				<div>
					<ul class="thumbnails">
						<li><a href="#" class="thumbnail"> <img src="img.jpg"
								alt="AD1">
						</a></li>
						<li><a href="#" class="thumbnail"> <img src="img.jpg"
								alt="AD2">
						</a></li>
						<li><a href="#" class="thumbnail"> <img src="img.jpg"
								alt="AD3">
						</a></li>
						<li><a href="#" class="thumbnail"> <img src="img.jpg"
								alt="AD4">
						</a></li>
					</ul>
				</div>
			</div>
			<!-- Center -->
			<div class="span10 mar test">
				<!-- Contents Header -->
				<!-- 		<header id="overview" class="jumbotron subhead">
						<img src="images/logo.png" width="150" />
					</header> -->
				<!-- Contents Body -->
				<jsp:include page="bidDetail.jsp"></jsp:include>

			</div>
			<!-- Right SideBar -->
			<div class="span1">
				<!-- Space -->
				<div style="height: 200px"></div>
				<!-- Floating Bar -->
				<div>
					<ul class="thumbnails">
						<li><a href="Charge.action" class="thumbnail">유료 충전 </a></li>
						<li><a href="SearchLog.action" class="thumbnail">로그 조회 </a></li>
						<li><a href="PrintingItemCategoryList.action"
							class="thumbnail">물품 등록 </a></li>
						<li><a href="ItemQuantityAdmin.action" class="thumbnail">물품
								관리 </a></li>
						<li><a href="listAuctionItem.action" class="thumbnail">경매
								시작 </a></li>
						<li><a href="AuctionDetail.action?item_num=1"
							class="thumbnail">경매 상세 </a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- Bottom Navigation Bar(BNB) -->
	<div class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="navbar-inner">
			<div class="container-fluid">
				<!-- Favorites & Log Viewer -->
				<span id="test_id1"><i class="icon-chevron-up icon-white"></i></span>
				<span id="test_id2"><i class="icon-chevron-down icon-white"></i></span>
				<div id="one">test212323232</div>

				<script>
					$(document).ready(function() {
						/* $('#test_id1').click(function() {
							$('#one').slideDown(1000);
							$('#test_id1').hide();
							$('#test_id2').show();
						});

						$('#test_id2').click(function() {
							$('#one').slideUp(1000);
							$('#test_id1').show();
							$('#test_id2').hide();
						}); */
					});
				</script>
			</div>
		</div>
	</div>

	<!-- Bootstrap JavaScript -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.js"></script>
	<!-- 회원가입 & 로그인 팝업창 -->
	<div id="boxes">
		<div id="dialog" class="window">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
			<h4>Member Join</h4>
			<form name="frm_join" class="form-inline" method="POST"
				action="MemeberJoin.action">
				<table cellpadding="9" align="center">
					<tr>
						<td width="100" align="right">Id</td>
						<td width="450"><input type="text" class="input-xlarge"
							placeholder="Id" name="member_id">
							<button type="button" class="btn btn-inverse"
								onclick="onCheck();">중복 확인</button> <input type="hidden"
							name="check" value="join" /> <input type="hidden"
							name="member_accredit" value="" /></td>
					</tr>
					<tr>
						<td align="right">Password</td>
						<td><input type="password" class="input-xlarge"
							name="member_pwd" placeholder="Password" name="member_pwd"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="password" class="input-xlarge"
							name="member_pwd_check" placeholder="Password check"></td>
					</tr>
					<tr>
						<td align="right">User Name</td>
						<td><input type="text" class="input-xlarge"
							name="Member_name" placeholder="Name"></td>
					</tr>
					<tr>
						<td align="right">User Email</td>
						<td><input name="member_email" type="text"
							class="input-xlarge" placeholder="Email"></td>
					</tr>
					<tr>
						<td align="right">User Phone</td>
						<td><input name="member_phone" type="text"
							class="input-xlarge" placeholder="Phone"></td>
					</tr>
					<tr>
						<td align="right">User Bank</td>
						<td><input name="member_bank" type="text"
							class="input-medium"> &nbsp;ex) 우리은행&nbsp; <input
							name="member_accnum" type="text" class="input-xlarge"></td>
					</tr>
					<tr>
						<td align="right">Address</td>
						<td><input name="member_addr" type="text"
							class="input-xxlarge" placeholder="Address"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><br />
							<button type="button" class="btn btn-inverse"
								onclick="MemberJoin();">가입완료</button></td>
					</tr>
				</table>
			</form>
			<script>
				//랜덤값 받아오는 함수
				function ran() {
					var rand = Math.floor(9999 * Math.random());
					document.frm_join.member_accredit.value = rand;
				}
				function MemberJoin() {
					ran();
					document.frm_join.submit();
				}
				function MemberChang() {
					document.frm_change.submit();
				}
			</script>
		</div>
		<div id="dialog1" class="window">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
			<h4>Login</h4>
			<form method="POST" name="frm_login" action="MemberLogin.action">
				<table cellpadding="5" align="center">
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
					<tr>
						<td colspan="2" align="center"><br />
							<button type="button" onclick="goLogin();"
								class="btn btn-inverse">로그인</button></td>
					</tr>
				</table>
				<script>
					function goLogin() {
						document.frm_login.submit();
					}
				</script>
			</form>
		</div>
		<!-- 회원수정 -->
		<div id="dialog2" class="window">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
			<h4>Member Change</h4>
			<form name="frm_change" class="form-inline" method="POST"
				action="MemeberChange.action">
				<table cellpadding="9" align="center" border="0">
					<tr>
						<td width="100" align="right">Id</td>
						<td width="450">${member_id} <input type="hidden"
							name="member_id" value="${member_id}" /> <input type="hidden"
							name="check" value="change" />
						</td>
					</tr>
					<tr>
						<td align="right">Password</td>
						<td><input type="password" class="input-xlarge"
							name="member_pwd" placeholder="Password" name="member_pwd"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="password" class="input-xlarge"
							name="member_pwd_check" placeholder="Password check"></td>
					</tr>
					<tr>
						<td align="right">User Name</td>
						<td>${member_name}</td>
					</tr>
					<tr>
						<td align="right">User Email</td>
						<td><input name="member_email" type="text"
							class="input-xlarge" placeholder="Email" value="${member_email }"></td>
					</tr>
					<tr>
						<td align="right">User Phone</td>
						<td><input name="member_phone" type="text"
							class="input-xlarge" placeholder="Phone" value="${member_phone}"></td>
					</tr>
					<tr>
						<td align="right">User Bank</td>
						<td><input name="member_bank" type="text"
							class="input-medium" value="${member_bank}"> &nbsp;ex)
							우리은행&nbsp; <input name="member_accnum" type="text"
							class="input-xlarge" value="${member_accnum}"></td>
					</tr>
					<tr>
						<td align="right">Address</td>
						<td valign="top"><input name="member_addr" type="text"
							class="input-xxlarge" placeholder="" value="${member_addr}"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><br /> <input type="hidden"
							name="member_accredit" value="" />
							<button type="button" class="btn btn-inverse"
								onclick="MemberChang();">정보수정</button></td>
					</tr>
				</table>
			</form>
		</div>
		<div id="mask"></div>
	</div>
</body>
</html>