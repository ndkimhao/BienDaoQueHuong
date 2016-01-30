<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="rank.aspx.vb" Inherits="BienDaoQueHuong.rank" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Xếp Hạng - Biển Đảo Quê Hương</title>

        <link rel="shortcut icon" href="image/icon.ico" />
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<link href="css/style_login_register.css" rel="stylesheet" type="text/css" />
		<link href="css/style_table.css" rel="stylesheet" type="text/css" />
		<link href="css/style_rank.css" rel="stylesheet" type="text/css" />
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
							<a name="top" class="anchor"><h1>Bảng Xếp Hạng</h1></a>
							<div id="divRank">
						        <ul class="left">   
						            <li><a href="#fishing">Bãi Câu 1 - Bãi Câu 2</a></li>
						            <li><a href="#bachlongvi">Đảo Bạch Long Vĩ</a></li>
						            <li><a href="#lyson">Đảo Lý Sơn</a></li>
					            </ul>
					            <ul class="left">
						            <li><a href="#phanvinh">Đảo Phan Vinh</a></li>
						            <li><a href="#truongsa">Đảo Trường Sa</a></li>
						            <li><a href="#phuquy">Đảo Phú Quý</a></li>
				                </ul>
					            <ul class="left">
						            <li><a href="#condao">Côn Đảo</a></li>
						            <li><a href="#phuquoc">Đảo Phú Quốc</a></li>
						            <li><a href="#quiz">Trắc Nghiệm Biển Đảo</a></li>
						        </ul>
						        <img class="clear" src="image/intro/separator.png" />						    
    						    
						        <div class="clearfix"><a name="fishing" class="anchor"><span class="li1">Bãi Câu 1 - Bãi Câu 2</span></a><a href="#top">Về Đầu Trang</a></div>
						        <h3>&nbsp;&nbsp;___________&nbsp;Bãi Câu 1&nbsp;____________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;___________&nbsp;Bãi Câu 2&nbsp;____________</h3>
                                <div id="divTableTopIsland7" class="CSSTableGenerator left" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Tên</td>
                                                <td>Vàng</td>
                                            </tr>
                                            <asp:Literal ID="litTopIsland7" runat="server"></asp:Literal>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="divTableTopIsland8" class="CSSTableGenerator right" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Tên</td>
                                                <td>Vàng</td>
                                            </tr>
                                            <asp:Literal ID="litTopIsland8" runat="server"></asp:Literal>
                                        </tbody>
                                    </table>
                                </div>
                                <img class="clear separator" src="image/intro/separator.png" />
    						    
    						    <div class="clearfix"><a name="bachlongvi" class="anchor"><span class="li1">Đảo Bạch Long Vĩ</span></a><a href="#top">Về Đầu Trang</a></div>
						        <h3>&nbsp;&nbsp;_____________&nbsp;Đầu Tư&nbsp;____________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;____________&nbsp;Trò Chơi&nbsp;____________</h3>
                                <div id="divTableInvestment6" class="CSSTableGenerator left" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Tên</td>
                                                <td>Vàng</td>
                                                <td class="rate"></td>
                                            </tr>
                                            <asp:Literal ID="litTopInvestment6" runat="server"></asp:Literal>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="divTableTopIsland6" class="CSSTableGenerator right" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Tên</td>
                                                <td>Vàng</td>
                                            </tr>
                                            <asp:Literal ID="litTopIsland6" runat="server"></asp:Literal>
                                        </tbody>
                                    </table>
                                </div>
                                <img class="clear separator" src="image/intro/separator.png" />
    						    
						        <div class="clearfix"><a name="lyson" class="anchor"><span class="li1">Đảo Lý Sơn</span></a><a href="#top">Về Đầu Trang</a></div>
						        <h3>&nbsp;&nbsp;_____________&nbsp;Đầu Tư&nbsp;____________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;____________&nbsp;Trò Chơi&nbsp;____________</h3>
                                <div id="divTableInvestment5" class="CSSTableGenerator left" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Tên</td>
                                                <td>Vàng</td>
                                                <td class="rate"></td>
                                            </tr>
                                            <asp:Literal ID="litTopInvestment5" runat="server"></asp:Literal>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="divTableTopIsland5" class="CSSTableGenerator right" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Tên</td>
                                                <td>Vàng</td>
                                            </tr>
                                            <asp:Literal ID="litTopIsland5" runat="server"></asp:Literal>
                                        </tbody>
                                    </table>
                                </div>
                                <img class="clear separator" src="image/intro/separator.png" />
    						    
						        <div class="clearfix"><a name="phanvinh" class="anchor"><span class="li1">Đảo Phan Vinh</span></a><a href="#top">Về Đầu Trang</a></div>
						        <h3>&nbsp;&nbsp;_____________&nbsp;Đầu Tư&nbsp;____________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;____________&nbsp;Trò Chơi&nbsp;____________</h3>
                                <div id="divTableInvestment4" class="CSSTableGenerator left" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Tên</td>
                                                <td>Vàng</td>
                                                <td class="rate"></td>
                                            </tr>
                                            <asp:Literal ID="litTopInvestment4" runat="server"></asp:Literal>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="divTableTopIsland4" class="CSSTableGenerator right" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Tên</td>
                                                <td>Vàng</td>
                                            </tr>
                                            <asp:Literal ID="litTopIsland4" runat="server"></asp:Literal>
                                        </tbody>
                                    </table>
                                </div>
                                <img class="clear separator" src="image/intro/separator.png" />
    						    
						        <div class="clearfix"><a name="truongsa" class="anchor"><span class="li1">Đảo Trường Sa</span></a><a href="#top">Về Đầu Trang</a></div>
						        <h3>&nbsp;&nbsp;_____________&nbsp;Đầu Tư&nbsp;____________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;____________&nbsp;Trò Chơi&nbsp;____________</h3>
                                <div id="divTableInvestment3" class="CSSTableGenerator left" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Tên</td>
                                                <td>Vàng</td>
                                                <td class="rate"></td>
                                            </tr>
                                            <asp:Literal ID="litTopInvestment3" runat="server"></asp:Literal>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="divTableTopIsland3" class="CSSTableGenerator right" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Tên</td>
                                                <td>Vàng</td>
                                            </tr>
                                            <asp:Literal ID="litTopIsland3" runat="server"></asp:Literal>
                                        </tbody>
                                    </table>
                                </div>
                                <img class="clear separator" src="image/intro/separator.png" />
    						    
						        <div class="clearfix"><a name="phuquy" class="anchor"><span class="li1">Đảo Phú Quý</span></a><a href="#top">Về Đầu Trang</a></div>
						        <h3>&nbsp;&nbsp;_____________&nbsp;Đầu Tư&nbsp;____________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;____________&nbsp;Trò Chơi&nbsp;____________</h3>
                                <div id="divTableInvestment2" class="CSSTableGenerator left" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Tên</td>
                                                <td>Vàng</td>
                                                <td class="rate"></td>
                                            </tr>
                                            <asp:Literal ID="litTopInvestment2" runat="server"></asp:Literal>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="divTableTopIsland2" class="CSSTableGenerator right" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Tên</td>
                                                <td>Vàng</td>
                                            </tr>
                                            <asp:Literal ID="litTopIsland2" runat="server"></asp:Literal>
                                        </tbody>
                                    </table>
                                </div>
                                <img class="clear separator" src="image/intro/separator.png" />
    						    
						        <div class="clearfix"><a name="condao" class="anchor"><span class="li1">Côn Đảo</span></a><a href="#top">Về Đầu Trang</a></div>
						        <h3>&nbsp;&nbsp;_____________&nbsp;Đầu Tư&nbsp;____________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;____________&nbsp;Trò Chơi&nbsp;____________</h3>
                                <div id="divTableInvestment1" class="CSSTableGenerator left" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Tên</td>
                                                <td>Vàng</td>
                                                <td class="rate"></td>
                                            </tr>
                                            <asp:Literal ID="litTopInvestment1" runat="server"></asp:Literal>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="divTableTopIsland1" class="CSSTableGenerator right" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Tên</td>
                                                <td>Vàng</td>
                                            </tr>
                                            <asp:Literal ID="litTopIsland1" runat="server"></asp:Literal>
                                        </tbody>
                                    </table>
                                </div>
                                <img class="clear separator" src="image/intro/separator.png" />
    						    
						        <div class="clearfix"><a name="phuquoc" class="anchor"><span class="li1">Đảo Phú Quốc</span></a><a href="#top">Về Đầu Trang</a></div>
						        <h3>&nbsp;&nbsp;_____________&nbsp;Đầu Tư&nbsp;____________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;____________&nbsp;Trò Chơi&nbsp;____________</h3>
                                <div id="divTableInvestment0" class="CSSTableGenerator left" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Tên</td>
                                                <td>Vàng</td>
                                                <td class="rate"></td>
                                            </tr>
                                            <asp:Literal ID="litTopInvestment0" runat="server"></asp:Literal>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="divTableTopIsland0" class="CSSTableGenerator right" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Tên</td>
                                                <td>Vàng</td>
                                            </tr>
                                            <asp:Literal ID="litTopIsland0" runat="server"></asp:Literal>
                                        </tbody>
                                    </table>
                                </div>
                                <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                                <img class="clear" src="image/intro/separator.png" />
                                
						        <div class="clearfix"><a name="quiz" class="anchor"><span class="li1">Trắc Nghiệm Biển Đảo</span></a><a href="#top">Về Đầu Trang</a></div>
                                <br />
                                <div id="divTopQuiz" class="CSSTableGenerator full" >
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Tên</td>
                                                <td>Điểm</td>
                                                <td>Thời Gian</td>
                                                <td>Ngày Làm</td>
                                            </tr>
                                            <asp:Literal ID="litTopQuiz" runat="server"></asp:Literal>
                                        </tbody>
                                    </table>
                                </div>
                                <br />
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