<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="register.aspx.vb" Inherits="BienDaoQueHuong.register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Đăng Ký - Biển Đảo Quê Hương</title>

        <link rel="shortcut icon" href="image/icon.ico" />
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<link href="css/style_login_register.css" rel="stylesheet" type="text/css" />
		<link href="css/style_register.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.validate.min.js"></script>
		<script type="text/javascript" src="js/messages_vi.js"></script>
		<script type="text/javascript" src="js/ddsmoothmenu.js"></script>
		<script type="text/javascript" src="js/script_register.js"></script>

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
		                <li><a href="register.aspx">Đăng Ký</a></li>
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
				<div class="container">
					<section id="content">
						<form id="frmRegister" name="frmRegister" method="post" runat="server">
							<h1>Đăng Ký</h1>
							<div>
								<input type="text" placeholder="Tên Tài Khoản" id="txtUsername" name="txtUsername" autocomplete="off" maxlength="16" />
							</div>
							<div>
								<input type="password" placeholder="Mật Khẩu" id="txtPassword" name="txtPassword" autocomplete="off" maxlength="16" />
							</div>
							<div>
								<input type="password" placeholder="Xác Nhận Mật Khẩu" id="txtConfirmPassword" name="txtConfirmPassword" autocomplete="off" maxlength="16" />
							</div>
							<div>
								<input type="text" placeholder="Địa Chỉ Email" id="txtEmail" name="txtEmail" autocomplete="off" maxlength="50" />
							</div>
							<div>
								<input type="text" placeholder="Tên Nhân Vật" id="txtCharacterName" name="txtCharacterName" autocomplete="off" maxlength="16" />
							</div>
							<div id="divAvatar">
                            	<img id="btnPreviousAvatar" src="image/register_previous_avatar.png" width="100" height="80" />
								<img id="imgAvatar" src="image/Avatar/1.png" width="60" height="80" />
								<img id="btnNextAvatar" src="image/register_next_avatar.png" width="100" height="80" />
								<input type="hidden" id="hidAvatarID" name="hidAvatarID" value="1" />
							</div>
							<div>
								<asp:Button ID="btnRegister" runat="server" Text="Đăng Ký"></asp:Button>
								<a href="login.aspx">Đăng Nhập</a>
							</div>
						</form><!-- form -->
						<div class="button">
							<a href="Default.aspx">Về Trang Chủ</a>
						</div><!-- button -->
					</section><!-- content -->
				</div><!-- container -->
		    </div> <!-- end of main -->
  		</div> <!-- wrapper -->

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