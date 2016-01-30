<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="intro.aspx.vb" Inherits="BienDaoQueHuong.intro" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Giới Thiệu - Biển Đảo Quê Hương</title>

        <link rel="shortcut icon" href="image/icon.ico" />
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<link href="css/style_login_register.css" rel="stylesheet" type="text/css" />
		<link href="css/style_intro.css" rel="stylesheet" type="text/css" />
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
							<a name="top" class="anchor"><h1>Giới Thiệu Biển Đảo Quê Hương</h1></a>
							<div id="divIntro">
							    <ul class="left">
							        <li><a href="#story">Sự Tích</a></li>
							        <li><a href="#puzzle">Game Xếp Hình</a></li>
							        <li><a href="#flipImage">Game Lật Hình</a></li>
							        <li><a href="#fishing">Game Câu Cá</a></li>
						        </ul>
						        <ul class="left">
							        <li><a href="#memory">Game Thử Tài Trí Nhớ</a></li>
							        <li><a href="#dangerousSea">Vùng Biển Nguy Hiểm</a></li>
							        <li><a href="#tax">Đóng Thuế</a></li>
							        <li><a href="#ship">Mua Bán Thuyền</a></li>
						        </ul>
						        <ul class="left">
							        <li><a href="#bank">Ngân Hàng</a></li>
							        <li><a href="#investment">Đầu Tư</a></li>
							        <li><a href="#restart">Khởi Tạo Lại Tài Khoản</a></li>
							        <li><a href="#prize">Giải Thưởng</a></li>
							    </ul>
							    <img class="clear" src="image/intro/separator.png" />
							    
							    <a name="story" class="anchor"><span class="li1">Sự Tích</span></a><a href="#top">Về Đầu Trang</a>
							    <p class="li2" style="color: #B22222;">
							        <br />
                                    &emsp;&emsp;&emsp;&emsp;Ngày xưa, có một anh ngư dân vừa hiền lành vừa chăm chỉ. Cha anh mất đã lâu nên anh phải ở chung với mẹ. Mẹ anh tuổi cũng đã già, không còn đủ sức nuôi anh như ngày trước nữa. Hằng ngày, anh ra khơi, đánh bắt cá để có tiền nuôi mẹ.Năm ấy, mẹ anh lâm bệnh nặng. Anh đi khắp nơi vay mượn nhưng vẫn không đủ. Anh đành phải đánh cá xa hơn để bán kiếm tiền.Thật không may trong một lần đi đánh cá, thuyền anh gặp bão. Sóng nước như nổi cơn thịnh nộ, mây đen che kín cả bầu trời trong xanh. Vì đánh cá xa bờ nên thuyền anh bị sóng cuốn ra thật xa, không còn biết đâu là đâu nữa !
                                </p>
                                <p class="li2" style="color: #006400;">
                                    &emsp;&emsp;&emsp;&emsp;Anh ngư dân chìm trong vô vọng rồi ngất thiếp đi. Trong lúc hôn mê, anh chỉ luôn nghĩ về người mẹ của mình đang ở nhà chờ mình trở về. Nghĩ tới việc đó, anh chợt tỉnh dậy, bằng nghị lực và những kinh nghiệm biển có được anh đã vượt qua được cơn bão. Ngày lúc đó anh nhặt được một cái lọ trôi trên biển, mở ra thì đó là thư cầu cứu của một người bị nạn trong cơn bão vừa rồi... không màn nguy hiểm, anh theo tấm bản đồ đi cứu người, đi, đi mãi vượt qua nhiều khó khăn anh cũng tới được hòn đảo có người bị nạn.
                                </p>
                                <p class="li2" style="color: #B22222;">
                                    &emsp;&emsp;&emsp;&emsp;Đến nơi anh không thấy ai cả chỉ toàn là vàng trên đảo lúc đó anh mới biết là tiên ông thử lòng mình, anh đem một ít vàng về chữa bệnh cho mẹ, xây nhà, mua thuyền lớn nhưng hàng ngày vẫn chăm chỉ ra khơi đánh cá... Từ đó câu chuyện đảo vàng lan truyền khắp nơi... Nhiều người hăm hở mua thuyền ra biển với hy vọng tìm được đảo vàng... Vậy còn bạn thì sao? Hãy vào trò chơi và thử vận may của mình nhé.... !
							    </p>
							    <img class="clear" src="image/intro/separator.png" />
							    
							    <a name="puzzle" class="anchor"><span class="li1">Game Xếp Hình</span></a><a href="#top">Về Đầu Trang</a>
							    <p>
							        <br />
							        <div>
							            <div class="left">
							                <img width="300px" src="image/intro/puzzle.jpg" />
							            </div>
							            <div class="left1">
							                <p>
							                    &emsp;&emsp;&emsp;&emsp;<b>Một tấm hình bị chia nhỏ ra, xếp lộn xộn, phải sắp xếp lại. Sau khi hoàn thành thì thời gian còn lại chính là điểm số. Hình ảnh được sử dụng để xếp là biển, đảo Việt Nam.</b>
							                </p>
							                <p>
                                                <span class="law">Luật Chơi:</span><br /> 
                                                <span class="law1">
                                                    &emsp;&emsp;&emsp;- Mới vào sẽ cho chọn mua:<br /> 
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Thêm 30 giây làm nhiệm vụ: 1800 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Thêm 1 phút làm nhiệm vụ: 4000 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ x2 thời gian (không tính thời gian thêm): 3000 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Trả lời đúng 1 câu: 300 vàng<br />
                                                    &emsp;&emsp;&emsp;- Trả lời câu hỏi.<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;* Thời gian cố định: 1 phút.<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 0 câu: -10 giây làm nhiệm vụ<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 1 câu: bị phạt 500 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 2 câu: +10 giây làm nhiệm vụ<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 3 câu: +20 giây làm nhiệm vụ<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 4 câu: +40 giây làm nhiệm vụ<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 5 câu: +60 giây làm nhiệm vụ<br />
                                                    <span class="law">Kết thúc:</span><br />
                                                    &emsp;&emsp;&emsp;- <span class="islandName">Đảo Phan Vinh</span>: tiền thưởng =<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;(thời gian còn lại * 250) + 10000 vàng<br />
                                                    &emsp;&emsp;&emsp;- <span class="islandName">Đảo Phú Quý</span>: tiền thưởng = thời gian còn lại * 60 vàng<br />
                                                </span>
							                </p>
							            </div>
							        </div>
							    </p>
							    <img class="clear" src="image/intro/separator.png" />
							    
							    <a name="flipImage" class="anchor"><span class="li1">Game Lật Hình</span></a><a href="#top">Về Đầu Trang</a>
							    <p>
							        <br />
							        <div>
							            <div class="left">
							                <img width="300px" src="image/intro/flipImage.jpg" />
							            </div>
							            <div class="left1">
							                <p>
							                    &emsp;&emsp;&emsp;&emsp;<b>Sẽ có một số cặp hình giống nhau, lật hết các hình sẽ hoàn thành nhiệm vụ, thời gian còn lại chính là điểm số của của trò chơi. Hình sử dụng cho trò chơi là hình về biển, đảo, các anh hải quân ...</b>
							                </p>
							                <p>
                                                <span class="law">Luật Chơi:</span><br /> 
                                                <span class="law1">
                                                    &emsp;&emsp;&emsp;- Mới vào sẽ cho chọn mua:<br /> 
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ x2 tiền: 1000 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ x3 tiền: 4000 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Thêm 20 giây làm nhiệm vụ: 1200 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Thêm 40 giây làm nhiệm vụ: 3000 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Trả lời đúng 1 câu: 500 vàng<br />
                                                    &emsp;&emsp;&emsp;- Trả lời câu hỏi.<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;* Thời gian cố định: 1 phút.<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 0 câu: -15 giây làm nhiệm vụ<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 1 câu: +5 giây làm nhiệm vụ<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 2 câu: +15 giây làm nhiệm vụ<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 3 câu: +25 giây làm nhiệm vụ<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 4 câu: +35 giây làm nhiệm vụ<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 5 câu: +45 giây làm nhiệm vụ<br />
                                                    <span class="law">Kết thúc:</span><br />
                                                    &emsp;&emsp;&emsp;- <span class="islandName">Côn Đảo, Đảo Lý Sơn</span>:<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;tiền thưởng = thời gian còn lại * 60 vàng<br />
                                                </span>
							                </p>
							            </div>
							        </div>
							    </p>
							    <img class="clear" src="image/intro/separator.png" />
							    
							    <a name="fishing" class="anchor"><span class="li1">Game Câu Cá</span></a><a href="#top">Về Đầu Trang</a>
							    <p>
							        <br />
							        <div>
							            <div class="left">
							                <img width="300px" src="image/intro/fishing.jpg" />
							            </div>
							            <div class="left1">
							                <p>
							                    &emsp;&emsp;&emsp;&emsp;<b>Câu cá ở biển, câu được càng nhiều cá trong thời gian quy định thì càng được nhiều vàng, câu phải sứa thì bị trừ vàng.</b>
							                </p>
							                <p>
                                                <span class="law">Luật Chơi:</span><br /> 
                                                <span class="law1">
                                                    &emsp;&emsp;&emsp;- Mới vào sẽ cho chọn mua:<br /> 
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ x2 vàng: 500 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ x3 vàng: 2500 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ x2 cá vàng: 1000 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Thêm 10 giây làm nhiệm vụ: 300 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Thêm 20 giây làm nhiệm vụ: 700 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Trả lời đúng 1 câu: 300 vàng<br />
                                                    &emsp;&emsp;&emsp;- Trả lời câu hỏi.<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;* Thời gian cố định: 1 phút.<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 0 câu: phạt tăng 5 con sứa<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 1 câu: phạt tăng 3 con sứa<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 2 câu: thưởng tăng 1 con cá vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 3 câu: thưởng giảm 1 con sứa, tăng 2 cá vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 4 câu: thưởng giảm 1 con sứa, tăng 3 cá vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 5 câu: thưởng giảm 3 con sứa, tăng 5 cá vàng<br />
                                                    <span class="law">Kết thúc:</span><br />
                                                    &emsp;&emsp;&emsp;- <span class="islandName">Bãi Câu 1</span>: tiền thưởng = số tiền kiếm được<br />
                                                    &emsp;&emsp;&emsp;- <span class="islandName">Bãi Câu 2</span>: tiền thưởng = số tiền kiếm được * 2<br />
                                                </span>
							                </p>
							            </div>
							        </div>
							    </p>
							    <img class="clear" src="image/intro/separator.png" />
							    
							    <a name="memory" class="anchor"><span class="li1">Game Thử Tài Trí Nhớ</span></a><a href="#top">Về Đầu Trang</a>
							    <p>
							        <br />
							        <div>
							            <div class="left">
							                <img width="300px" src="image/intro/memory.jpg" />
							            </div>
							            <div class="left1">
							                <p>
							                    &emsp;&emsp;&emsp;&emsp;<b>Những tấm hình được xếp ngẫu nhiên vào các khung ảnh. Bạn có thời gian để ghi nhớ, sau đó bạn sẽ phải sắp xếp các hình vào trong khung ảnh theo trật tự đã ghi nhớ sau khi các tấm hình được sắp xếp lộn xộn. Bạn có thể thử nhiều lần cho đến khi hết thời gian.</b>
							                </p>
							                <p>
                                                <span class="law">Luật Chơi:</span><br /> 
                                                <span class="law1">
                                                    &emsp;&emsp;&emsp;- Mới vào sẽ cho chọn mua:<br /> 
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Thêm 10 giây thời gian nhớ: 300 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Thêm 20 giây thời gian nhớ: 1500 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Thêm 10 giây thời gian làm nhiệm vụ: 300 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Thêm 30 giây thời gian làm nhiệm vụ: 1200 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Thêm 1 phút thời gian làm nhiệm vụ: 3000 vàng<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Trả lời đúng 1 câu: 300 vàng<br />
                                                    &emsp;&emsp;&emsp;- Trả lời câu hỏi.<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;* Thời gian cố định: 1 phút.<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 0 câu: phạt -5 giây thời gian nhớ<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 1 câu: phạt -15 giây làm nhiệm vụ<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 2 câu: phạt +1 hình mỗi khung<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 3 câu: thưởng +10s nhớ<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 4 câu: thưởng -1 hình mỗi khung,<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+10 giây làm nhiệm vụ<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+ Đúng 5 câu: thưởng -1 hình mỗi khung,<br />
                                                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+30 giây làm nhiệm vụ<br />
                                                    <span class="law">Kết thúc:</span><br />
                                                    &emsp;&emsp;&emsp;- <span class="islandName">Đảo Trường Sa</span>: tiền thưởng = thời gian còn lại * 60 vàng<br />
                                                    &emsp;&emsp;&emsp;- <span class="islandName">Đảo Phú Quốc</span>: tiền thưởng = thời gian còn lại * 100 vàng<br />
                                                </span>
							                </p>
							            </div>
							        </div>
							    </p>
							    <img class="clear" src="image/intro/separator.png" />
							    
							    <a name="dangerousSea" class="anchor"><span class="li1">Vùng Biển Nguy Hiểm</span></a><a href="#top">Về Đầu Trang</a>
							    <p>
							        <br />
							        <div>
							            <div class="left">
							                <img width="300px" src="image/intro/dangerousSea.jpg" />
							            </div>
							            <div class="left1">
							                <p>
                                                <span class="law">Nếu đi vào vùng biển nguy hiểm:</span><br /> 
                                                <span class="law1">
                                                    &emsp;&emsp;&emsp;- Đột ngột xuất hiện tình trạng báo động thuyền bị thủng, xuất hiện câu hỏi (trả lời trong 15 giây, nếu sau 15 giây không có câu trả lời coi như trả lời sai), trả lời sai thì lổ thủng sẽ càng to, trả lời đúng thì sẽ vá được thuyền (lổ thủng sẽ có cấp từ 1 - 7, trả lời sai thì tăng cấp và ngược lại, cấp độ lỗ thủng ban đầu là ngẫu nhiên từ 1 đến 2).<br />
                                                    &emsp;&emsp;&emsp;- Lỗ thủng quá 7 hoặc đã trả lời hết 5 câu hỏi nhưng vẫn chưa vá được thuyền thì thuyền sẽ bị đắm, mất hết hàng hóa, tiền đang giữ trong người (chỉ còn lại tiền trong ngân hàng).<br />
                                                    &emsp;&emsp;&emsp;- May mắn: bạn sẽ nhận được ngọc bí ẩn ở vùng biển này (rất có giá trị).<br />
                                                </span>
                                                <br /><br />
							                </p>
							            </div>
							        </div>
							    </p>
							    <img class="clear" src="image/intro/separator.png" />
							    
							    <a name="tax" class="anchor"><span class="li1">Đóng Thuế</span></a><a href="#top">Về Đầu Trang</a>
							    <p>
							        <br />
							        <div>
							            <div class="left">
							                <img width="300px" src="image/intro/tax.jpg" />
							            </div>
							            <div class="left1">
							                <p>
                                                <span class="law1">
                                                    - Người chơi hoàn thành nhiệm vụ sẽ nhận được số vàng nhất định. Vàng dùng để <a href="#investment">đầu tư</a> và <a href="#ship">mua bán thuyền</a>.<br />
                                                    - Người chơi có thể xem thứ xếp hạng số vàng ở trang cá nhân. Tuy nhiên để cập nhật thứ hạng lên trang chủ, người chơi phải “Đóng thuế” (-20% số vàng hiện có), rồi đem cờ vừa có được lên Hoàng Sa để cắm.<br />
                                                    - Chỉ có thể đóng thuế khi vào đất liền.<br />
                                                </span>
                                                <br /><br />
							                </p>
							            </div>
							        </div>
							    </p>
							    <img class="clear" src="image/intro/separator.png" />
							    
							    <a name="ship" class="anchor"><span class="li1">Mua Bán Thuyền</span></a><a href="#top">Về Đầu Trang</a>
							    <p>
							        <br />
							        <div>
							            <div class="left">
							                <img width="300px" src="image/intro/ship.jpg" />
							            </div>
							            <div class="left1">
							                <p>
                                                <span class="law1">
                                                    - Chỉ có thể mua bán thuyền khi vào đất liền.
                                                </span>
                                                <br /><br /><br /><br /><br /><br /><br /><br /><br />
							                </p>
							            </div>
							        </div>
							    </p>
							    <img class="clear" src="image/intro/separator.png" />
							    
							    <a name="bank" class="anchor"><span class="li1">Ngân Hàng</span></a><a href="#top">Về Đầu Trang</a>
							    <p>
							        <br />
							        <div>
							            <div class="left">
							                <img width="300px" src="image/intro/bank.jpg" />
							            </div>
							            <div class="left1">
							                <p>
                                                <span class="law1">
                                                    - Khi đi biển nếu không may bạn sẽ bị đắm tàu, tàu và toàn bộ số tiền mang theo sẽ bị mất...  Vậy nên hãy mang theo đủ số vàng bạn cần, số vàng còn lại bạn nên gửi vào ngân hàng.
                                                </span>
                                                <br /><br /><br /><br /><br /><br /><br /><br /><br />
							                </p>
							            </div>
							        </div>
							    </p>
							    <img class="clear" src="image/intro/separator.png" />
							    
							    <a name="investment" class="anchor"><span class="li1">Đầu Tư</span></a><a href="#top">Về Đầu Trang</a>
							    <p>
							        <br />
							        <div>
							            <div class="left">
							                <img width="300px" src="image/intro/investment.jpg" />
							            </div>
							            <div class="left1">
							                <p>
                                                <span class="law1">
                                                    - Nếu đầu tư đúng cách thì đây sẽ là tính năng mang lại nguồn lợi cực lớn cho bạn, giúp bạn nhanh chóng thành một phú hộ giàu có.<br />
                                                    - Mỗi ngày, lúc 12h trưa, người đầu tư nhiều nhất ở mỗi đảo sẽ nhận được 10% tổng đầu tư của đảo đó. Tương tự, người đứng thứ 2 sẽ nhận được 7%, người đứng thứ 3 nhận được 4%.
                                                </span>
                                                <br /><br />
							                </p>
							            </div>
							        </div>
							    </p>
							    <img class="clear" src="image/intro/separator.png" />
							    
							    <a name="restart" class="anchor"><span class="li1">Khởi Tạo Lại Tài Khoản</span></a><a href="#top">Về Đầu Trang</a>
							    <p>
							        <br />
							        <div>
							            <div class="left">
							                <img width="300px" src="image/intro/restart.jpg" />
							            </div>
							            <div class="left1">
							                <p>
                                                <span class="law1">
                                                    - Những rủi ro trên biển có thể khiến bạn mất hết tài sản, nhưng đừng lo, bạn chỉ cần chọn “Khởi tạo lại TK” ở trang cá nhân hoặc bản đồ thì sẽ có thể tiếp tục hành trình. Chúc bạn may mắn !
                                                </span>
                                                <br /><br /><br /><br /><br />
							                </p>
							            </div>
							        </div>
							    </p>
							    <img class="clear" src="image/intro/separator.png" />
							    
							    <a name="prize" class="anchor"><span class="li1">Giải Thưởng</span></a><a href="#top">Về Đầu Trang</a>
							    <p>
							        <br />
							        <div>
							            <div class="left">
							                <img width="300px" src="image/intro/prize.jpg" />
							            </div>
							            <div class="left1">
							                <p>
                                                <span class="law1">
                                                    - Ở mỗi đảo sẽ có bảng xếp hạng trò chơi, người đứng nhất nhì và ba sẽ nhận được “Huy chương” của đảo đó cho đến khi bị vượt qua. Người giữ huy chương mỗi ngày sẽ nhận được những phần thưởng hấp dẫn. Riêng bảng xếp hạng ở trang chủ thì phần thưởng sẽ gấp đôi so với ở đảo...<br />
                                                    - Hãy thu thập càng nhiều danh hiệu càng tốt và mỗi ngày bạn sẽ được phần thưởng xứng đáng !
                                                </span>
							                </p>
							            </div>
							        </div>
							    </p>
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