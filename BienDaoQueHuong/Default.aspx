<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="BienDaoQueHuong._Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Trang Chủ - Biển Đảo Quê Hương</title>

        <link rel="shortcut icon" href="image/icon.ico" />
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<link href="css/style_login_register.css" rel="stylesheet" type="text/css" />
		<link href="css/style_home.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/ddsmoothmenu.js"></script>
		<script type="text/javascript" src="js/script_home.js"></script>

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
		                <asp:Literal ID="litRegisterOrProfile" runat="server"></asp:Literal>
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
				<a href="login.aspx">
					<img id="imgPlay" src="image/play.png" width="150px" height="150px" alt="Banner" />
				</a>
				<div id="divVideo">
				    <iframe width="519" height="292" src="http://www.youtube.com/embed/_ZYIZd9Sox4?rel=0&autoplay=1" frameborder="0" allowfullscreen></iframe>
				</div>
				<div id="divPhuHo">
		        	<img id="PhuHoBorder" src="image/phuHo_border.png" width="480px" height="380px" />
					<div id="divPhuHoContent">
                        <asp:Literal ID="litPhuHo" runat="server"></asp:Literal>
					</div>
				</div>
				
			    <div class="container">
				    <section id="content">
					    <form>
					        <h1><a href="intro.aspx#top" target="_blank">Giới Thiệu Biển Đảo Quê Hương</a></h1>
					        <img src="image/intro/fishing.jpg" width="180px" class="left" />
					        <div class="left">
					            <b>Câu Cá</b><br />
					            Câu được càng nhiều cá thì càng được nhiều vàng.<br />
					            <a href="intro.aspx#fishing" target="_blank">Xem thêm</a>
					        </div>
					        <img src="image/intro/puzzle.jpg" width="120px" class="left intro2" />
					        <div class="left intro2">
					            <b>Xếp Hình</b><br />
					            Một tấm hình bị chia nhỏ ra, xếp lộn xộn, phải sắp xếp lại.<br />
					            <a href="intro.aspx#puzzle" target="_blank">Xem thêm</a>
					        </div>
					    </form>
				    </section>
			    </div>
		    </div> <!-- end of main -->
		</div> <!-- wrapper -->

        <a id="aQuiz" target="_blank" href="quiz.aspx"><img width="125px" height="150px" src="image/quiz.png" /></a>

		<div id="footer_wrapper">
			<div id="footer">
		    	<b>
		    	    Biển Đảo Quê Hương<span id="blackList"><a href="blacklist.aspx#top">Danh sách đen</a></span><br />
		    	    Số thành viên: <asp:Literal ID="litUsersCount" runat="server"></asp:Literal> - 
		    	        <a href="http://support.biendaoquehuong.info/client.php?locale=vi" target="_blank" onclick="if(navigator.userAgent.toLowerCase().indexOf('opera') != -1 &amp;&amp; window.event.preventDefault) window.event.preventDefault();this.newWindow = window.open('http://support.biendaoquehuong.info/client.php?locale=vi&amp;url='+escape(document.location.href)+'&amp;referrer='+escape(document.referrer), 'webim', 'toolbar=0,scrollbars=0,location=0,status=1,menubar=0,width=640,height=480,resizable=1');this.newWindow.focus();this.newWindow.opener=window;return false;"><b>Hỗ Trợ</b></a> - 
                        Email: <a href="mailto:hotro@biendaoquehuong.info">hotro@biendaoquehuong.info</a>
		    	</b>
		        <div class="cleaner"></div>
			</div>
		</div>
	</body>
</html>