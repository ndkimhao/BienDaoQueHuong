<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="profiles.aspx.vb" Inherits="BienDaoQueHuong.profiles" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Thông Tin Cá Nhân - Biển Đảo Quê Hương</title>

        <link rel="shortcut icon" href="image/icon.ico" />
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<link href="css/style_login_register.css" rel="stylesheet" type="text/css" />
		<link href="css/style_profiles.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
		<link rel="stylesheet" type="text/css" href="css/jquery-ui-smoothness/jquery-ui.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="css/style_table.css" media="screen" />

		<script type="text/javascript" language="javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" language="javascript" src="js/jquery-ui.min.js"></script>
		<script type="text/javascript" language="javascript" src="js/script_profiles.js"></script>
		<script type="text/javascript" language="javascript" src="js/ddsmoothmenu.js"></script>

		<script type="text/javascript">
			ddsmoothmenu.init({
				mainmenuid: "menu", //menu DIV id
				orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
				classname: 'ddsmoothmenu', //class added to menu's outer DIV
				//customtheme: ["#1c5a80", "#18374a"],
				contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
			});
		</script>
	</head>
	<body>
		<div id="wrapper">
			<div id="header">
				<div id="site_title"><h1><a href="/">Biển Đảo Quê Hương</a></h1></div>
		        <div id="menu" class="ddsmoothmenu">
		            <ul>
		                <li><a href="Default.aspx">Trang Chủ</a></li>
		                <li><a href="profiles.aspx">Tài Khoản</a></li>
		                <li><a href="intro.aspx#top">Giới Thiệu</a>
		                    <ul>
		                        <li><a href="intro.aspx#top">Giới Thiệu Trò Chơi</a></li>
		                        <li><a href="rank.aspx#top">Bảng Xếp Hạng</a></li>
		                        <li><a href="http://support.biendaoquehuong.info/client.php?locale=vi" target="_blank" onclick="if(navigator.userAgent.toLowerCase().indexOf('opera') != -1 &amp;&amp; window.event.preventDefault) window.event.preventDefault();this.newWindow = window.open('http://support.biendaoquehuong.info/client.php?locale=vi&amp;url='+escape(document.location.href)+'&amp;referrer='+escape(document.referrer), 'webim', 'toolbar=0,scrollbars=0,location=0,status=1,menubar=0,width=640,height=480,resizable=1');this.newWindow.focus();this.newWindow.opener=window;return false;">Hỗ Trợ</a></li>
		                    </ul>
		                </li>
		            </ul>
		            <br style="clear: left" />
		        </div> <!-- end of menu -->
		        <div class="cleaner"></div>
		    </div> <!-- end of templatemo header -->

		    <div id="middle">
		    	<img id="imgBanner" src="image/banner.png" width="900" height="250" alt="Banner" />
			</div> <!-- end of middle -->

		    <div id="main">
                <div id="dialogChangePassword" class="dialog" title="Đổi Mật Khẩu">
                    <p>
                        <input type="password" placeholder="Mật Khẩu Cũ" id="txtOldPassword" autocomplete="off" maxlength="16" />
                        <input type="password" placeholder="Mật Khẩu Mới" id="txtNewPassword" autocomplete="off" maxlength="16" />
                        <input type="password" placeholder="Xác Nhận Mật Khẩu Mới" id="txtConfirmNewPassword" autocomplete="off" maxlength="16" />
                        <input type="button" value="Đổi Mật Khẩu" id="btnChangePassword" />
                    </p>
                </div>
				<div id="divContent" class="clearfix">
					<section id="left">
						<div id="userStats" class="clearfix">
							<div class="pic">
								<a href="#"><asp:Image ID="imgAvatar" runat="server" width="150" height="150"></asp:Image></a>
							</div>
							<div class="data">
								<h1><asp:Literal ID="lblCharacterName" runat="server"></asp:Literal><a href="map.aspx">Vào Chơi</a><a href="logout.aspx" style="font-size: 14px;">Đăng Xuất</a></h1>
								<asp:Literal ID="lblUsername" runat="server"></asp:Literal> - <a id="aChangePassword" href="#">Đổi Mật Khẩu</a><asp:Literal ID="litRestart" runat="server"></asp:Literal></h3>
								<ul class="numbers clearfix">
									<li>VÀNG<strong><span id="spanGold"><asp:Literal ID="lblGold" runat="server"></asp:Literal></span></strong></li>
									<li class="nobrdr">HẠNG<strong><asp:Literal ID="lblRank" runat="server"></asp:Literal></strong></li>
								</ul>
							</div>
						</div>
						<div class="gcontent">
							<div class="head"><h1>Lịch Sử Cắm Cờ<asp:Literal ID="litFlag" runat="server"></asp:Literal></h1></div>
							<div id="divFlaggingWrapper" class="boxy">
								<div class="badgeCount">
									<div>
									    <div id="divFlagging" class="CSSTableGenerator">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>Hạng</td>
                                                        <td>Vàng</td>
                                                        <td>Ngày</td>
                                                    </tr>
                                                    <asp:Literal ID="litFlagging" runat="server"></asp:Literal>
                                                </tbody>
                                            </table>
                                        </div>
                                        <input type="button" class="hide" id="btnTax" value="Đóng Thuế" />
									</div>
								</div>
							</div>
						</div>
					</section>

					<section id="right">
						<div id="divPrize" class="gcontent">
							<div class="head"><h1>Giải Thưởng</h1></div>
							<div class="boxy">
								<div class="badgeCount">
                                    <asp:Literal ID="litPrize" runat="server"></asp:Literal>
								</div>
							</div>
						</div>
						<div id="divBank" class="gcontent hide">
							<div class="head"><h1>Ngân hàng</h1></div>
							<div class="boxy">
								<div class="badgeCount">
									<div>
                                        <span id="spanBank"></span>
				                        <input type="text" placeholder="Số Tiền" id="txtBank" autocomplete="off" maxlength="7" />
                                        <input type="button" id="btnDeposit" value="Gửi" />
                                        <input type="button" id="btnWithdraw" value="Rút" />
									</div>
								</div>
							</div>
						</div>
						<div class="gcontent">
							<div class="head"><h1>Thuyền Của Bạn</h1></div>
							<div class="boxy">
								<div class="badgeCount">
								    <asp:Literal ID="litItem" runat="server"></asp:Literal>
						            <input type="button" class="hide" id="btnShip" value="Mua Bán Thuyền" />
								</div>
							</div>
						</div>
					</section>
				</div>
		    </div> <!-- end of main -->
		</div> <!-- wrapper -->
		
		<a id="aQuiz" target="_blank" href="quiz.aspx"><img width="125px" height="150px" src="image/quiz.png" /></a>
		
		<form id="frmInfomatin" runat="server">
		    <asp:HiddenField ID="hidShipID" runat="server" Value="" />
		</form>
		<div id="footer_wrapper">
			<div id="footer">
		    	<b>
		    	    Biển Đảo Quê Hương<br />
		    	    Số thành viên: <asp:Literal ID="litUsersCount" runat="server"></asp:Literal> - 
		    	        <a href="http://support.biendaoquehuong.info/client.php?locale=vi" target="_blank" onclick="if(navigator.userAgent.toLowerCase().indexOf('opera') != -1 &amp;&amp; window.event.preventDefault) window.event.preventDefault();this.newWindow = window.open('http://support.biendaoquehuong.info/client.php?locale=vi&amp;url='+escape(document.location.href)+'&amp;referrer='+escape(document.referrer), 'webim', 'toolbar=0,scrollbars=0,location=0,status=1,menubar=0,width=640,height=480,resizable=1');this.newWindow.focus();this.newWindow.opener=window;return false;"><b>Hỗ Trợ</b></a> - 
                        Email: <a href="mailto:hotro@biendaoquehuong.info">hotro@biendaoquehuong.info</a>
		    	</b>
		        <div class="cleaner"></div>
			</div>
		</div>
	</body>
</html>