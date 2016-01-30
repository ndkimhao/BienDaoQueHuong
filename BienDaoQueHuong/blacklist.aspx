<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="blacklist.aspx.vb" Inherits="BienDaoQueHuong.blacklist" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Xếp Hạng - Biển Đảo Quê Hương</title>

        <link rel="shortcut icon" href="image/icon.ico" />
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<link href="css/style_login_register.css" rel="stylesheet" type="text/css" />
		<link href="css/style_table.css" rel="stylesheet" type="text/css" />
		<link href="css/style_blacklist.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/ddsmoothmenu.js"></script>

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
				<div class="container">
					<section id="content">
						<form>
							<a name="top" class="anchor"><h1>Danh Sách Đen</h1></a>
							<span id="intro">
                                - Webgame <a href="/">biendaoquehuong.info</a> được thực hiện với mục đích giúp mọi người có thể vừa giải trí vừa có thêm kiến thức về biển đảo quê hương... từ đó đưa mọi người gần gũi, gắn bó hơn với quê hương đất nước...<br />
                                - Tuy nhiên trong quá trình chơi game, một số tài khoản đã có hành vi gian lận gây mất sự cân bằng của game. Nay BQT sẽ đưa ra các hình thức và nội dung xử lý các tài khoản gian lận tại đây.<br />
                                - Mọi thắc mắc, đóng góp xin vui lòng gửi email về <a href="mailto:hotro@biendaoquehuong.info">hotro@biendaoquehuong.info</a> hoặc <a href="http://support.biendaoquehuong.info/client.php?locale=vi" target="_blank" onclick="if(navigator.userAgent.toLowerCase().indexOf('opera') != -1 &amp;&amp; window.event.preventDefault) window.event.preventDefault();this.newWindow = window.open('http://support.biendaoquehuong.info/client.php?locale=vi&amp;url='+escape(document.location.href)+'&amp;referrer='+escape(document.referrer), 'webim', 'toolbar=0,scrollbars=0,location=0,status=1,menubar=0,width=640,height=480,resizable=1');this.newWindow.focus();this.newWindow.opener=window;return false;">tại đây</a>.<br />
                                <br />
                            </span>
                            <div class="CSSTableGenerator" >
                                <table>
                                    <tbody>
                                        <tr>
                                            <td>Tên Nhân Vật</td>
                                            <td>Nội Dung Vi Phạm</td>
                                            <td>Hình Thức Xử Phạt</td>
                                        </tr>
                                        <tr>
                                            <td>mememe</td>
                                            <td>Gian lận tiền</td>
                                            <td>Xóa tài khoản vĩnh viễn</td>
                                        </tr>
                                        <tr>
                                            <td>Napoleon</td>
                                            <td>Gian lận tiền</td>
                                            <td>Xóa tài khoản vĩnh viễn</td>
                                        </tr>
                                        <tr>
                                            <td>Ghost Rider</td>
                                            <td>Gian lận tiền</td>
                                            <td>Xóa tài khoản vĩnh viễn</td>
                                        </tr>
                                        <tr>
                                            <td>KhuongLuu</td>
                                            <td>Gian lận tiền</td>
                                            <td>Xóa tài khoản vĩnh viễn</td>
                                        </tr>
                                        <tr>
                                            <td>kutempro2009</td>
                                            <td>Gian lận tiền</td>
                                            <td>Xóa tài khoản vĩnh viễn</td>
                                        </tr>
                                        <tr>
                                            <td>profchan</td>
                                            <td>Gian lận tiền</td>
                                            <td>Xóa tài khoản vĩnh viễn</td>
                                        </tr>
                                        <tr>
                                            <td>Tỏn Xì Tin</td>
                                            <td>Gian lận tiền</td>
                                            <td>Xóa tài khoản vĩnh viễn</td>
                                        </tr>
                                        <tr>
                                            <td>Cong Lat Nhat</td>
                                            <td>Gian lận tiền</td>
                                            <td>Xóa tài khoản vĩnh viễn</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
						</form><!-- form -->
						<div class="button">
							<a href="#top">Về Đầu Trang</a>
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