<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="game.aspx.vb" Inherits="BienDaoQueHuong.ship" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>Mua Bán Thuyền - Biển Đảo Quê Hương</title>

        <link rel="shortcut icon" href="image/icon.ico" />
        <link href="css/style_login_register.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="css/style_game.css" type="text/css" />
		<link rel="stylesheet" href="css/style_ship.css" type="text/css" />

		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/script_ship.js"></script>
	</head>
	<body>
		<div id="wrapper">
			<div id="minwidth">
				<div id="holder">
					<div id="menu">
						<div id="left"></div>
						<div id="right"></div>
						<ul>
							<li class="selected" id="liStep1">Bán thuyền cũ</li>
							<li id="liStep2">Mua thuyền mới</li>
							<span id="spanGold">0</span>
							<a href="profiles.aspx" id="aBack" class="hide">Quay Lại</a>
						</ul>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</div>
		<div id="divNotPlaying" class="header">
			<!--
			Bạn đã không hoàn thành nhiệm vụ !<br />
			Hãy trở về bản đồ và làm nhiệm vụ tiếp theo !
			-->
			<img src="image/ship_default.png" />
		</div>
	    <div id="divSaleShip" class="hide">
			<div class="header">
			    <font color="blue">Bán Thuyền</font><br />
			    Bạn có muốn bán chiếc thuyền của bạn với giá <span id="spanSaleGold"></span> không ?<br />
			    <input id="btnSaleShip" type="button" value="Chấp Nhận" />
			    <input id="btnCancelSaleShip" type="button" value="Từ Chối" />
			</div>
	    </div>
		<div id="divBuyShip" class="hide">
			<div class="header">
			    <font color="blue">Mua Thuyền</font>
			</div>
			<div id="divShelf1" class="shelf">
				<div class="left"></div>
				<div class="right"></div>
				<div class="inside">
					<div class="books">
						<div class="col w2">
							<a href="#">
								<span class="gold">9.000</span><span class="speed">10</span>
								<img src="image/items/ship1.png" />
							</a>
						</div>
						<div class="col w2">
							<a href="#">
								<span class="gold">25.000</span><span class="speed">15</span>
								<img src="image/items/ship2.png" />
							</a>
						</div>
						<div class="col w2">
							<a href="#">
								<span class="gold">40.000</span><span class="speed">20</span>
								<img src="image/items/ship3.png" />
							</a>
						</div>
						<div class="col w2 last">
							<a href="#">
								<span class="gold">60.000</span><span class="speed">25</span>
								<img src="image/items/ship4.png" />
							</a>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div id="divShelf2" class="shelf">
				<div class="left"></div>
				<div class="right"></div>
				<div class="inside">
					<div class="books">
						<div class="col w3">
							<a href="#">
								<span class="gold">80.000</span><span class="speed">30</span>
								<img src="image/items/ship5.png" />
							</a>
						</div>
						<div class="col w2">
							<a href="#">
								<span class="gold">100.000</span><span class="speed">35</span>
								<img src="image/items/ship6.png" />
							</a>
						</div>
						<div class="col w3 last">
							<a href="#">
								<span class="gold">150.000</span><span class="speed">40</span>
								<img src="image/items/ship7.png" />
							</a>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div id="divShelf3" class="shelf">
				<div class="left"></div>
				<div class="right"></div>
				<div class="inside">
					<div class="books">
						<div class="col w2">
							<a href="#">
								<span class="gold">300.000</span><span class="speed">50</span>
								<img src="image/items/ship8.png" />
							</a>
						</div>
                        <div class="col w4">
							<a href="#">
								<span class="gold">500.000</span><span class="speed">60</span>
								<img src="image/items/ship9.png" />
							</a>
						</div>
						<div class="col w3 last">
							<a href="#">
								<span class="gold">700.000</span><span class="speed">70</span>
								<img src="image/items/ship10.png" />
							</a>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<form id="frmInfomatin" runat="server">
		    <asp:HiddenField ID="hidShipID" runat="server" Value="" />
		</form>
	</body>
</html>