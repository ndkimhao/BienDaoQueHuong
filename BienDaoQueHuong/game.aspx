<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="game.aspx.vb" Inherits="BienDaoQueHuong.game" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>Làm Nhiệm Vụ - Biển Đảo Quê Hương</title>

        <link rel="shortcut icon" href="image/icon.ico" />
        <link href="css/style_login_register.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="css/style_game.css" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/jquery-ui-smoothness/jquery-ui.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="css/style_table.css" media="screen" />

		<script type="text/javascript" language="javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" language="javascript" src="js/snapfit.js"></script>
	    <script type="text/javascript" language="javascript" src="js/swfobject.js"></script>
	    <script type="text/javascript" language="javascript" src="js/fishing.js"></script>
	    <script type="text/javascript" language="javascript" src="js/jquery-ui.min.js"></script>
		<script type="text/javascript" language="javascript" src="js/script_game.js"></script>
	</head>
	<body>
		<div id="wrapper">
			<div id="minwidth">
				<div id="holder">
					<div id="menu">
						<div id="left"></div>
						<div id="right"></div>
						<ul>
							<li class="selected" id="liStep1">Thông tin nhiệm vụ</li>
							<li id="liStep2">Mua vật phẩm cần thiết</li>
							<li id="liStep3">Trả lời câu hỏi</li>
							<li id="liStep4">Làm nhiệm vụ</li>
							<span id="spanGold"></span>
						</ul>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</div>
        <div id="dialogInvestmentTop" class="dialog" title="Bảng xếp hạng đầu tư và trò chơi tại đảo">
            <p>
                <h3>&nbsp;___________&nbsp;Đầu Tư&nbsp;___________&nbsp;&nbsp;&nbsp;&nbsp;__________&nbsp;Trò Chơi&nbsp;___________</h3>
                <div id="divTableInvestment" class="CSSTableGenerator" >
                    <table>
                        <tbody>
                            <tr>
                                <td>Tên</td>
                                <td>Vàng</td>
                                <td class="rate"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="divTableTopIsland" class="CSSTableGenerator" >
                    <table>
                        <tbody>
                            <tr>
                                <td>Tên</td>
                                <td>Vàng</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
				<div id="divInvestment">
                    <input type="text" placeholder="Số Tiền" id="txtInvestment" autocomplete="off" maxlength="7" />
                    <input type="button" id="btnInvestment" value="Đầu Tư" />
                    <span id="spanInvestment" class="gold investment"></span>
				</div>
            </p>
        </div>
		<div id="divFail" class="hide header">
			<!--
			Bạn đã không hoàn thành nhiệm vụ !<br />
			Hãy trở về bản đồ và làm nhiệm vụ tiếp theo !
			-->
			<img src="image/game/fail.png" />
		</div>
		<div id="divSuccess" class="hide header">
		    <!--
			Bạn đã hoàn thành nhiệm vụ ! Chúc mừng bạn !<br />
			Hãy trở về bản đồ và làm nhiệm vụ tiếp theo !
			-->
			<img src="image/game/success.png" />
		</div>
		<div id="divNotPlaying" class="hide header" style="display: block;">
		    <!--
			Bạn chưa vào đảo nên không thể làm nhiệm vụ được !<br />
			Hãy trở về bản đồ và vào đảo để làm nhiệm vụ !
			-->
			<img src="image/game/notPlaying.png" />
		</div>
		<div id="divBankruptcy" class="hide header">
		    <!--
		    Bạn đã bị phá sản !<br />
		    Bạn có muốn chơi lại từ đầu không ?<br />
		    -->
		    <img src="image/game/bankruptcy.png" />
		    <input type="button" id="btnRestart" value="Chơi Lại Từ Đầu" />
		</div>
	    <div id="divRestartSuccess" class="hide header">
	        <!--
	        Đã khởi tạo lại tài khoản !<br />
	        Hãy trở về bản đồ và vào đảo để làm nhiệm vụ !
	        -->
	        <img src="image/game/restarted.png" />
	    </div>
		<div id="divPuzzle" class="hide">
			<div id="divStep1Puzzle" class="hide">
			    <!--
				<div class="header">
					Xếp Hình - Bước 1: Thông tin nhiệm vụ
				</div>
				<p>Một tấm hình bị chia nhỏ ra xếp lộn xộn, phải xắp xếp lại. Sau khi hoàn thành thì thời gian còn lại chính là điểm số.</p>
		        <div class="intro">
		            - Kéo các mảnh hình vào đúng vị trí<br />
		            - Nếu mảnh hình đen có nghĩa là bị lật úp xuống, bấm chuột phải để lật mảnh hình lên<br />
		            - Nhấp đôi chuột để xoay mảnh hình theo ý muốn
		        </div>
		        -->
		        <img src="image/game/puzzle/introStep1.png" />
				<input id="btnNextStep1Puzzle" type="button" value="Bắt Đầu Làm Nhiệm Vụ" />
				<input type="button" class="abandonGame" />
			</div>
			<div id="divStep2Puzzle" class="hide">
				<div class="header">
					Xếp Hình - Bước 2: Mua vật phẩm cần thiết
				</div>
				<div class="shelf">
					<div class="left"></div>
					<div class="right"></div>
					<div class="inside">
						<div class="books">
							<div class="col w2">
								<a href="#">
									<span>1800</span>
									<img src="image/items/add30s.png" />
								</a>
							</div>
							<div class="col w2">
								<a href="#">
									<span>4000</span>
									<img src="image/items/add60s.png" />
								</a>
							</div>
							<div class="col w2">
								<a href="#">
									<span>3000</span>
									<img src="image/items/x2time.png" />
								</a>
							</div>
							<div class="col w2 last">
								<a href="#">
									<span>300</span>
									<img src="image/items/add1trueAnswer.png" />
								</a>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<input id="btnNextStep2Puzzle" type="button" value="Tiếp Tục" />
			</div>
			<div id="divStep4Puzzle" class="hide">
			    <div class="header">
			        Xếp Hình - Bước 4: Làm nhiệm vụ:<br />
			        Bạn hãy hoàn thành nhiệm vụ trong thời gian cho phép !<br />
			        <span id="spanTimerPuzzle" class="timer">00:00</span>
			        <input id="btnStartTimerPuzzle" type="button" value="Bắt Đầu" />
			    </div>
			    <div id="divWrapperPuzzleGame" class="hide">
			        <img id="imgPuzzleGame" width="800px" height="800px" />
		        </div>
			</div>
		</div>
		<div id="divMemory" class="hide">
		    <div id="divStep1Memory" class="hide">
		        <!--
			    <div class="header">
				    Thử Tài Trí Nhớ - Bước 1: Thông tin nhiệm vụ
			    </div>
			    <p>
			        Những tấm hình được xếp ngẫu nhiên vào các khung ảnh.<br />
			        Bạn có thời gian để ghi nhớ, sau đó bạn sẽ phải sắp xếp các hình vào trong khung ảnh theo trật tự đã ghi nhớ sau khi các tấm hình được sắp xếp lộn xộn.<br />
			        Bạn có thể thử nhiều lần cho đến khi hết thời gian.
			    </p>
			    <div class="intro">
			        - Dùng chuột kéo các tấm hình vào vị trị đã ghi nhớ trước đó
			    </div>
			    -->
			    <img src="image/game/memory/introStep1.png" />
			    <input id="btnNextStep1Memory" type="button" value="Bắt Đầu Làm Nhiệm Vụ" />
			    <input type="button" class="abandonGame" />
		    </div>
			<div id="divStep2Memory" class="hide">
				<div class="header">
					Thử Tài Trí Nhớ - Bước 2: Mua vật phẩm cần thiết
				</div>
				<div class="shelf">
					<div class="left"></div>
					<div class="right"></div>
					<div class="inside">
						<div class="books">
							<div class="col w2">
								<a href="#">
									<span>300</span>
									<img src="image/items/add10s.png" />
								</a>
							</div>
							<div class="col w2">
								<a href="#">
									<span>1200</span>
									<img src="image/items/add30s.png" />
								</a>
							</div>
							<div class="col w2">
								<a href="#">
									<span>3000</span>
									<img src="image/items/add60s.png" />
								</a>
							</div>
							<div class="col w2 last">
								<a href="#">
									<span>300</span>
									<img src="image/items/add1trueAnswer.png" />
								</a>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="shelf">
					<div class="left"></div>
					<div class="right"></div>
					<div class="inside">
						<div class="books">
							<div class="col w2">
								<a href="#">
									<span>300</span>
									<img src="image/items/add10s_remember.png" />
								</a>
							</div>
							<div class="col w2">
								<a href="#">
									<span>1500</span>
									<img src="image/items/add20s_remember.png" />
								</a>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<input id="btnNextStep2Memory" type="button" value="Tiếp Tục" />
			</div>
			<div id="divStep41Memory" class="hide">
			    <div class="header">
			        Thử Tài Trí Nhớ - Bước 4.1: Làm nhiệm vụ (ghi nhớ):<br />
			        Bạn hãy ghi nhớ trật tự của các hình trong các khung ảnh !<br />
			        <span id="spanTimerMemoryRemember" class="timer">00:00</span>
			        <input id="btnStartTimerMemoryRemember" type="button" value="Bắt Đầu" />
			    </div>
			    <div id="divMemoryRememberWrapper" class="hide">
                    <div class="albums" id="divMemoryRemember">
                        <div class="album" id="divMemoryRemember1"><h2>Album 1</h2></div>
                        <div class="album" id="divMemoryRemember2"><h2>Album 2</h2></div>
                        <div class="album" id="divMemoryRemember3"><h2>Album 3</h2></div>
                    </div>
			        <input id="btnMemoryDoneRemember" type="button" value="Xong" />
		        </div>
			</div>
			<div id="divStep42Memory" class="hide">
			    <div class="header">
			        Thử Tài Trí Nhớ - Bước 4.2: Làm nhiệm vụ:<br />
			        Bạn hãy sắp xếp các hình vào khung ảnh theo trật tự đã ghi nhớ !<br />
			        <span id="spanTimerMemory" class="timer">00:00</span>
			        <input id="btnStartTimerMemory" type="button" value="Bắt Đầu" />
			    </div>
			    <div id="divMemoryWrapper" class="hide">
                    <div class="albums" id="divPlay">
                        <div class="album" id="divMemoryPlay1" droppable="true"><h2>Album 1</h2></div>
                        <div class="album" id="divMemoryPlay2" droppable="true"><h2>Album 2</h2></div>
                        <div class="album" id="divMemoryPlay3" droppable="true"><h2>Album 3</h2></div>
                    </div>
                    <div class="clear"></div>
                    <div id="divMemoryGallery" class="gallery">
                    </div>
			        <input id="btnMemoryDonePlay" type="button" value="Xong" />
		        </div>
			</div>
		</div>
		<div id="divFishing" class="hide">
		    <div id="divStep1Fishing" class="hide">
	            <div class="header">
				    Câu Cá - Bước 1: Thông tin nhiệm vụ
	            </div>
                <img class="clear" src="image/game/fishing/introStep1.png" />
			    <input id="btnNextStep1Fishing" type="button" value="Bắt Đầu Làm Nhiệm Vụ" />
			    <input type="button" class="abandonGame" />
		    </div>
			<div id="divStep2Fishing" class="hide">
				<div class="header">
					Câu Cá - Bước 2: Mua vật phẩm cần thiết
				</div>
				<div class="shelf">
					<div class="left"></div>
					<div class="right"></div>
					<div class="inside">
						<div class="books">
							<div class="col w2">
								<a href="#">
									<span>500</span>
									<img src="image/items/x2gold.png" />
								</a>
							</div>
							<div class="col w2">
								<a href="#">
									<span>2500</span>
									<img src="image/items/x3gold.png" />
								</a>
							</div>
							<div class="col w2 last">
								<a href="#">
									<span>300</span>
									<img src="image/items/add10s.png" />
								</a>
							</div>
							<div class="col w2">
								<a href="#">
									<span>700</span>
									<img src="image/items/add20s.png" />
								</a>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="shelf">
					<div class="left"></div>
					<div class="right"></div>
					<div class="inside">
						<div class="books">
							<div class="col w2">
								<a href="#">
									<span>1000</span>
									<img src="image/items/x2goldFish.png" />
								</a>
							</div>
							<div class="col w2">
								<a href="#">
									<span>300</span>
									<img src="image/items/add1trueAnswer.png" />
								</a>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<input id="btnNextStep2Fishing" type="button" value="Tiếp Tục" />
			</div>
			<div id="divStep4Fishing" class="hide">
			    <div class="header">
			        Câu Cá - Bước 4: Làm nhiệm vụ:<br />
			        Bạn hãy câu thật nhiều cá trong thời gian cho phép !<br />
			    </div>
                <div id="divFishingPlay"></div>
			</div>
		</div>
		<div id="divFlipImage" class="hide">
		    <div id="divStep1FlipImage" class="hide">
			    <!--
			    <div class="header">
				    Lật Hình - Bước 1: Thông tin nhiệm vụ
			    </div>
			    <p>
			        Những tấm hình được lật úp xuống.<br />
			        Bạn phải lật lên các cặp hình giống nhau.
			    </p>
			    <div class="intro">
			        - Bấm chuột vào các cặp hình giống nhau cho tới khi mở hết tất cả các hình
			    </div>
			    <input id="btnNextStep1FlipImage" type="button" value="Bắt Đầu Làm Nhiệm Vụ" />
			    <input type="button" class="abandonGame" />
			    -->
			    <img src="image/game/flipImage/introStep1.png" />
			    <input id="btnNextStep1FlipImage" type="button" value="Bắt Đầu Làm Nhiệm Vụ" />
			    <input type="button" class="abandonGame" />
		    </div>
		    <div id="divStep2FlipImage" class="hide">
				<div class="header">
					Lật Hình - Bước 2: Mua vật phẩm cần thiết
				</div>
				<div class="shelf">
					<div class="left"></div>
					<div class="right"></div>
					<div class="inside">
						<div class="books">
							<div class="col w2">
								<a href="#">
									<span>1000</span>
									<img src="image/items/x2gold.png" />
								</a>
							</div>
							<div class="col w2">
								<a href="#">
									<span>4000</span>
									<img src="image/items/x3gold.png" />
								</a>
							</div>
							<div class="col w2">
								<a href="#">
									<span>1200</span>
									<img src="image/items/add20s.png" />
								</a>
							</div>
							<div class="col w2">
								<a href="#">
									<span>3000</span>
									<img src="image/items/add40s.png" />
								</a>
							</div>
							<div class="col w2 last">
								<a href="#">
									<span>500</span>
									<img src="image/items/add1trueAnswer.png" />
								</a>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<input id="btnNextStep2FlipImage" type="button" value="Tiếp Tục" />
			</div>
			<div id="divStep4FlipImage" class="hide">
			    <div class="header">
			        Lật Hình - Bước 4: Làm nhiệm vụ:<br />
			        Bạn hãy hoàn thành nhiệm vụ trong thời gian cho phép !<br />
			        <span id="spanTimerFlipImage" class="timer">00:00</span>
			        <input id="btnStartTimerFlipImage" type="button" value="Bắt Đầu" />
			    </div>
                <div id="divFlipImagePlay" class="hide"></div>
			</div>
		</div>
		<div id="divSort" class="hide">
		    <div id="divStep1Sort" class="hide">
			    <img src="image/game/sort/introStep1.png" />
			    <input id="btnNextStep1Sort" type="button" value="Bắt Đầu Làm Nhiệm Vụ" />
			    <input type="button" class="abandonGame" />
		    </div>
		    <div id="divStep21Sort" class="hide">
			    <div class="header">
			        Sắp Xếp Tên Đảo - Bước 2.1: Làm nhiệm vụ (ghi nhớ):<br />
			        Bạn hãy ghi nhớ thứ tự của các đảo !<br />
			        <span id="spanTimerRememberSort" class="timer">00:00</span>
			        <input id="btnStartRememberSort" type="button" value="Bắt Đầu" />
			    </div>
			    <div id="divRememberSort" class="container hide">
			        <section id="content">
				        <form>
				            <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Từ Bắc vào Nam&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Diện tích từ bé đến lớn</h3>
                            <ul class="sortable1">
                            </ul>
                            <ul class="sortable2">
                            </ul>
                            <input id="btnDoneSortRemember" type="button" value="Xong" />
                        </form>
                    </section>
                </div>
		    </div>
		    <div id="divStep22Sort" class="hide">
			    <div class="header">
			        Sắp Xếp Tên Đảo - Bước 2.2: Làm nhiệm vụ:<br />
			        Bạn hãy sắp xếp các đảo theo thứ tự !<br />
			        <span id="spanTimerSort" class="timer">00:00</span>
			        <input id="btnStartSort" type="button" value="Bắt Đầu" />
			    </div>
			    <div id="divDoSort" class="container hide">
			        <section id="content">
				        <form>
				            <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Từ Bắc vào Nam&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Diện tích từ bé đến lớn</h3>
                            <ul class="sortable1">
                            </ul>
                            <ul class="sortable2">
                            </ul>
                            <input id="btnDoneSort" type="button" value="Xong" />
                        </form>
                    </section>
                </div>
		    </div>
		</div>
		<div id="divShipwreck" class="hide">
		    <div id="divStep1Shipwreck">
                <img src="image/shipWrack.png" />
			    <input id="btnStartShipwreck" type="button" value="Bắt Đầu Vá Thuyền" />
			    <input id="btnCancelShipwreck" type="button" value="Từ Bỏ" />
		    </div>
		</div>
		<div id="divAnswerQuestion" class="hide">
			<div class="header">
			    <span id="spanGameName"></span> - Bước 3: Trả lời câu hỏi:<br />
			    Bạn hãy trả lời chính xác các câu hỏi sau đây trong 1 phút !<br />
			    <span id="spanTimerQuestion" class="timer">00:00</span>
			    <input id="btnStartTimerQuestion" type="button" value="Bắt Đầu" />
			</div>
			<div class="container hide">
			    <section id="content">
				    <form>
                        <div id="divWrapperQuestion" class="hide">
                        </div>
                        <br />
                        <input id="btnDoneAnswer" type="button" class="hide" value="Nộp Bài" />
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