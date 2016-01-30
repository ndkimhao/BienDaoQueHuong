<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="flag.aspx.vb" Inherits="BienDaoQueHuong.flag" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>Cắm Cờ - Biển Đảo Quê Hương</title>

        <link rel="shortcut icon" href="image/icon.ico" />
        <link href="css/style_login_register.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="css/style_game.css" type="text/css" />
		<link rel="stylesheet" href="css/style_flag.css" type="text/css" />

		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/script_flag.js"></script>
	</head>
	<body>
		<div id="wrapper">
			<div id="minwidth">
				<div id="holder">
					<div id="menu">
						<div id="left"></div>
						<div id="right"></div>
						<ul>
							<li class="selected" id="liStep1">Cắm cờ</li>
							<span id="spanFlag"><asp:Literal ID="litFlag" runat="server"></asp:Literal></span>
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
			<img src="image/flag_default.png" />
		</div>
		<div id="divFlagWrapper" class="hide">
		    <div>
		        <img src="image/flag_confirm.png" />
		    </div>
	        <input id="btnOK" type="button" value="Chắc Chắn" />
	        <input id="btnCancel" type="button" value="Hủy Bỏ" />
		</div>
	</body>
</html>