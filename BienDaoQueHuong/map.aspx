<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="map.aspx.vb" Inherits="BienDaoQueHuong.map" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
		<title>Bản Đồ - Biển Đảo Quê Hương</title>
		
        <link rel="shortcut icon" href="image/icon.ico" />
		<link rel="stylesheet" type="text/css" href="css/style_login_register.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="css/style_map.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="css/jquery-ui-smoothness/jquery-ui.css" media="screen" />
		
		<script type="text/javascript" language="javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" language="javascript" src="js/soundjs-0.4.1.min.js"></script>
		<script type="text/javascript" language="javascript" src="js/jquery-ui.min.js"></script>
		<script type="text/javascript" language="javascript" src="js/script_map.js"></script>
	</head>
	<body>
		<canvas id="canvasGame" width="3522px" height="2696px"></canvas>
		<img id="movingTo" src="image/movingTo.png" width="32px" height="41px" style="display: none;" />
		<div id="divNav">
		    <div id="divSmallMap">
		        <img src="image/map_small.jpg">
		    </div>
	        <div id="divGoldWeather">
	            <span>Thời Tiết: </span>
	            <img src="image/weather/1.png" width="50px" height="50px"><br />
	            <span id="spanGold" class="gold"><asp:Literal ID="litGold" runat="server"></asp:Literal></span><br />
	            <input id="btnLogout" type="button" value="Đăng Xuất" />
	            <input type="button" id="btnRestart" class="hide" value="Khởi tạo lại TK" />
	        </div>
		</div>
        <div id="dialogInfomationPhuQuoc" class="dialog" title="Thông tin về đảo Phú Quốc. Bạn có muốn làm nhiệm vụ ?">
            <p>
                <img src="image/island/phuquoc.jpg" />
                Đảo<strong> Ph&uacute; Quốc</strong> c&ograve;n được mệnh danh l&agrave;&nbsp;<strong>Đảo Ngọc</strong>, l&agrave;&nbsp;h&ograve;n đảo&nbsp;<strong>lớn nhất</strong> của&nbsp;Việt Nam, cũng l&agrave; đảo <strong>lớn nhất</strong> trong quần thể <strong>22 đảo</strong> tại đ&acirc;y, nằm trong&nbsp;<strong>vịnh Th&aacute;i Lan</strong>. <strong>Đảo Ph&uacute; Quốc</strong> c&ugrave;ng với c&aacute;c đảo kh&aacute;c tạo th&agrave;nh&nbsp;<strong>huyện đảo Ph&uacute; Quốc</strong>&nbsp;trực thuộc tỉnh&nbsp;<strong>Ki&ecirc;n Giang</strong>. To&agrave;n bộ huyện đảo c&oacute; tổng diện t&iacute;ch <strong>589,23&nbsp;km&sup2;</strong>.&nbsp;(theo Wikipedia)
            </p>
        </div>
        <div id="dialogInfomationConDao" class="dialog" title="Thông tin về Côn Đảo. Bạn có muốn làm nhiệm vụ ?">
            <p>
                <img src="image/island/condao.jpg" />
                <strong>C&ocirc;n Đảo</strong>&nbsp;l&agrave; một&nbsp;<strong>quần đảo</strong>&nbsp;ở ngo&agrave;i khơi <strong>bờ biển&nbsp;</strong><strong>Nam Bộ</strong>&nbsp;(Việt Nam) v&agrave; cũng l&agrave; huyện trực thuộc tỉnh&nbsp;<strong>B&agrave; Rịa-Vũng T&agrave;u</strong>. <strong>C&ocirc;n Đảo</strong> hay&nbsp;<strong>C&ocirc;n Sơn </strong>cũng hay d&ugrave;ng cho <strong>t&ecirc;n của&nbsp;</strong><strong>h&ograve;n đảo&nbsp;lớn nhất</strong> trong quần đảo n&agrave;y. (theo Wikipedia)
            </p>
        </div>
        <div id="dialogInfomationPhuQuy" class="dialog" title="Thông tin về đảo Phú Quý. Bạn có muốn làm nhiệm vụ ?">
            <p>
                <img src="image/island/phuquy.jpg" />
                Đảo<strong> Ph&uacute; Qu&yacute;</strong>&nbsp;(c&ograve;n gọi l&agrave;&nbsp;<strong>C&ugrave; Lao Thu</strong>&nbsp;hay&nbsp;<strong>C&ugrave; Lao Khoai Xứ</strong>) l&agrave; một&nbsp;đảo&nbsp;c&oacute; diện t&iacute;ch <strong>16&nbsp;km&sup2;</strong> nằm ngo&agrave;i khơi bờ biển&nbsp;<strong>Nam Trung Bộ</strong>&nbsp;thuộc&nbsp;Việt Nam. <strong>Xung quanh</strong> <strong>đảo ch&iacute;nh</strong> <strong>Ph&uacute; Qu&yacute;</strong> c&ograve;n c&oacute; c&aacute;c đảo kh&aacute;c như <strong>h&ograve;n Đ&aacute; Cao</strong> hướng <strong>T&acirc;y Bắc</strong>,&nbsp;<strong>h&ograve;n Đỏ</strong>&nbsp;hướng <strong>Đ&ocirc;ng Bắc</strong> v&agrave;&nbsp;<strong>h&ograve;n Tranh</strong>&nbsp;v&agrave;&nbsp;<strong>h&ograve;n Hải</strong>&nbsp;hướng <strong>T&acirc;y Nam</strong>. Quần đảo n&agrave;y nằm dưới <strong>sự quản l&iacute;</strong> của huyện <strong>Ph&uacute; Qu&yacute;</strong>, tỉnh&nbsp;<strong>B&igrave;nh Thuận</strong>. (theo Wikipedia)
            </p>
        </div>
        <div id="dialogInfomationTruongSa" class="dialog" title="Thông tin về đảo Trường Sa. Bạn có muốn làm nhiệm vụ ?">
            <p>
                <img src="image/island/truongsa.jpg" />
                <strong>Đảo Trường Sa</strong> l&agrave; một&nbsp;<strong>đảo san h&ocirc;</strong> thuộc&nbsp;<strong>cụm Trường Sa</strong>&nbsp;của&nbsp;<strong>quần đảo Trường Sa</strong>. Đảo n&agrave;y nằm c&aacute;ch&nbsp;<strong>Cam Ranh</strong>&nbsp;khoảng <strong>254 hải l&iacute; (470,4&nbsp;km)</strong> v&agrave; c&aacute;ch&nbsp;<strong>Vũng T&agrave;u</strong>&nbsp;hơn <strong>500&nbsp;km</strong> đường biển, l&agrave; h&ograve;n đảo <strong>lớn nhất</strong> ở <strong>quần đảo Trường Sa</strong>. (theo Wikipedia)
            </p>
        </div>
        <div id="dialogInfomationPhanVinh" class="dialog" title="Thông tin về đảo Phan Vinh. Bạn có muốn làm nhiệm vụ ?">
            <p>
                <img src="image/island/phanvinh.jpg" />
                Đảo&nbsp;<strong>Phan Vinh</strong>&nbsp;l&agrave; phần nổi tr&ecirc;n v&agrave;nh san h&ocirc; của một&nbsp;<strong>rạn san h&ocirc; v&ograve;ng</strong>&nbsp;lớn hơn. Thực thể n&agrave;y thuộc&nbsp;<strong>cụm Trường Sa</strong>&nbsp;của&nbsp;<strong>quần đảo Trường Sa</strong> v&agrave; nằm c&aacute;ch&nbsp;<strong>đ&aacute; Tốc Tan</strong>&nbsp;khoảng <strong>14 hải l&iacute;</strong> <strong>(25,9&nbsp;km)</strong> về ph&iacute;a <strong>T&acirc;y Bắc</strong>.(theo Wikipedia)
            </p>
        </div>
        <div id="dialogInfomationLySon" class="dialog" title="Thông tin về đảo Lý Sơn. Bạn có muốn làm nhiệm vụ ?">
            <p>
                <img src="image/island/lyson.jpg" />
                Diện t&iacute;ch&nbsp;của <strong>huyện đảo L&yacute; Sơn</strong> l&agrave; khoảng <strong>9,97&nbsp;km&sup2;</strong> nhưng&nbsp;<strong>d&acirc;n số</strong>&nbsp;lại l&ecirc;n đến con số hơn <strong>20.460 người</strong>. <strong>Gồm 3 đảo</strong>: <strong>đảo Lớn</strong> (<strong>L&yacute; Sơn</strong> hay <strong>C&ugrave; Lao R&eacute;</strong>), <strong>đảo B&eacute;</strong> (<strong>C&ugrave; Lao Bờ B&atilde;i</strong>) ở <strong>ph&iacute;a Bắc</strong> <strong>đảo Lớn</strong>, v&agrave; <strong>h&ograve;n M&ugrave; Cu </strong>ở <strong>ph&iacute;a Đ&ocirc;ng</strong> của <strong>đảo Lớn</strong>. Huyện được chia l&agrave;m <strong>3&nbsp;</strong><strong>x&atilde;</strong>: <strong>An Vĩnh</strong> (huyện Lỵ - đảo Lớn), <strong>An Hải </strong>(đảo Lớn) v&agrave; <strong>An B&igrave;nh</strong> (đảo B&eacute;).<br />H&ograve;n đảo l&agrave; <strong>vết t&iacute;ch c&ograve;n lại</strong> của một&nbsp;<strong>n&uacute;i lửa</strong>&nbsp;với <strong>5 miệng</strong>, được h&igrave;nh th&agrave;nh c&aacute;ch đ&acirc;y <strong>25-30 triệu năm</strong>. <strong>C&aacute;c mạch nước ngầm n&oacute;ng dưới ch&acirc;n n&uacute;i lửa</strong> cung cấp&nbsp;<strong>nhiệt năng</strong>&nbsp;để sản xuất điện phục vụ sinh hoạt cho <strong>L&yacute; Sơn</strong>. (theo Wikipedia)
            </p>
        </div>
        <div id="dialogInfomationBachLongVi" class="dialog" title="Thông tin về Bạch Long Vĩ. Bạn có muốn làm nhiệm vụ ?">
            <p>
                <img src="image/island/bachlongvi.jpg" />
                <strong>Bạch Long Vĩ</strong> l&agrave; một đảo đồng thời l&agrave; một huyện thuộc th&agrave;nh phố <strong>Hải Ph&ograve;ng, Việt Nam</strong>. Đ&acirc;y l&agrave; <strong>đảo xa bờ nhất</strong> trong <strong>vịnh Bắc Bộ</strong>, nằm ở <strong>khoảng giữa vịnh</strong>, c&aacute;ch <strong>h&ograve;n D&aacute;u</strong>(Hải Ph&ograve;ng) <b>110 km</b>, c&aacute;ch đảo <strong>Hạ Mai</strong>(Hải Ph&ograve;ng) <b>70 km</b>. (theo Wikipedia)
            </p>
        </div>
        <div id="dialogInfomationBaiCau1" class="dialog" title="Xác nhận nhiệm vụ">
            <p>
                Bạn có muốn làm nhiệm vụ tại Bãi Câu 1 ?
            </p>
        </div>
        <div id="dialogInfomationBaiCau2" class="dialog" title="Xác nhận nhiệm vụ">
            <p>
                Bạn có muốn làm nhiệm vụ tại Bãi Câu 2 ?
            </p>
        </div>
		<form id="frmInfomatin" runat="server">
		    <asp:HiddenField ID="hidMapX" runat="server" Value="950" />
		    <asp:HiddenField ID="hidMapY" runat="server" Value="1850" />
		    <asp:HiddenField ID="hidIsPlayingGame" runat="server" Value="false" />
		    <asp:HiddenField ID="hidShipID" runat="server" Value="" />
		    <asp:HiddenField ID="hidAllowRestart" runat="server" Value="" />
		    <asp:HiddenField ID="hidCharacterName" runat="server" Value="" />
		</form>
	</body>
</html>