<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="quiz.aspx.vb" Inherits="BienDaoQueHuong.quiz" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>Trả Lời Trắc Nghiệm - Biển Đảo Quê Hương</title>

        <link rel="shortcut icon" href="image/icon.ico" />
        <link href="css/style_login_register.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="css/style_game.css" type="text/css" />

		<script type="text/javascript" language="javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" language="javascript" src="js/script_quiz.js"></script>
	</head>
	<body>
		<div id="wrapper">
			<div id="minwidth">
				<div id="holder">
					<div id="menu">
						<div id="left"></div>
						<div id="right"></div>
						<ul>
							<li class="selected" id="liStep1">Nhập mã làm bài</li>
							<li id="liStep2">Trả lời trắc nghiệm</li>
						</ul>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</div>
		<div id="divAnswerQuestion" class="hide">
			<div class="header">
			    Trả lời trắc nghiệm:<br />
			    Bạn hãy trả lời chính xác các câu hỏi sau đây trong 10 phút !<br />
			    <span id="spanTimerQuestion" class="timer">00:00</span>
			    <input id="btnStartTimerQuestion" type="button" value="Bắt Đầu" />
			</div>
			<div class="container hide">
			    <section id="content">
				    <form>
                        <div id="divWrapperQuestion" class="hide">
                        </div>
                        <br />
                        <input id="btnDoneAnswer" type="button" class="hide" value="Tiếp Tục" />
                    </form>
                </section>
            </div>
		</div>
		<form id="frmInfomatin" runat="server">
		    <asp:HiddenField ID="hidQuestionAnswer" runat="server" Value="" />
		    <input id="hidIslandID" type="hidden" value="" />
		</form>
	</body>
</html>