function playWave() {
	var sound = createjs.Sound.play("wave");
	if(isMoving){
		sound.addEventListener("complete", this.playWave);
	}
}

function playBell() {
	var sound = createjs.Sound.play("bell");
}

function playArrive() {
	var sound = createjs.Sound.play("arrive");
}

function stopSound(){
	createjs.Sound.stop();
}

function game_play(w, type, islandID){
	var $game = $(w.document);
    $game.find(".hide").hide();
	switch(type){
		case "puzzle":
			$game.find("#divPuzzle, #divStep1Puzzle").show();
			break;
		case "memory":
			$game.find("#divMemory, #divStep1Memory").show();
			break;
		case "fishing":
			$game.find("#divFishing, #divStep1Fishing").show();
			break;
		case "flipImage":
			$game.find("#divFlipImage, #divStep1FlipImage").show();
			break;
		case "sort":
			$game.find("#liStep2, #liStep3").remove();
			$game.find("#spanGold").css("left", "350px");
			$game.find("#divSort, #divStep1Sort").show();
			break;
		case "shipWreck":
			$game.find("#divShipwreck, #divStep1Shipwreck").show();
			break;
	}
	$game.find("#hidIslandID").attr("value", islandID);
}

function bank_comeIn(w){
	var $bank = $(w.document);
	$bank.find("#divBank").show();
	$bank.find("#btnShip").show();
	$bank.find("#btnTax").show();
	$bank.find("#txtBank").focus();
	bank = w;
}

function bank_comeOut(){
	if(bank != undefined){
		$(bank.document).find("#divBank").hide();
		bank.close();
	}
}

function comeToBank(){
	if(localStorage.isNewGame == undefined){
		alert("Vui lòng tắt trình chặn pop-up để vào ngân hàng (nếu có) !");
		localStorage.isNewGame = false;
	}
	var b = window.open("profiles.aspx");
	if(b != undefined){
		b.onload = function(){
			isInBank = true;
			bank_comeIn(b);
			window.close();
			self.close();
			window.open("", "_self");
			window.close();
			window.location.href = "about:blank";
		}
		b.onbeforeunload = function(){
			isInBank = false;
		}
	}
}

function restart(){
	$.ajax({
		url: "AJAXSubmit.aspx",
		type: "POST",
		async: false,
		data: {
			Restart: "true"
		}
	});
}

function comeToFlag(){
	if(localStorage.isNewGame == undefined){
		alert("Vui lòng tắt trình chặn pop-up để cắm cờ (nếu có) !");
		localStorage.isNewGame = false;
	}
	$.ajax({
		url: "AJAXSubmit.aspx",
		type: "POST",
		async: false,
		data: {
			GetFlag: "true"
		},
		success: function(data){
			if(data == 0){
				alert("Bạn không có cờ để cắm !");
			}else{
				if(confirm("Bạn có muốn cắm cờ tại Hoàng Sa không ?")){
					var w = window.open("flag.aspx");
					if(w != undefined){
						w.onload = function(){
							var $w = $(w.document);
							$w.find("#divNotPlaying").hide();
							$w.find("#divFlagWrapper").show();
							window.close();
							self.close();
							window.open("", "_self");
							window.close();
							window.location.href = "about:blank";
						}
					}
				}
			}
		}
	});
}

function refreshOtherShip(){
	$.ajax({
		url: "AJAXSubmit.aspx",
		type: "POST",
		data: {
			GetOtherShip: "true"
		},
		success: function(data){
			var dt = data.split("||");
			dt.pop();
			var i;
			var $div = $("<div id=\"divOtherShip\" />")
			for(i=0; i<dt.length; i++){
				var dr = dt[i].split("|");
				var $img = $("<img class=\"otherShip\" />");
		        $img.attr("src", "image/ship/"+(parseInt(dr[0])+1)+".png");
				$img.css("left", dr[1]+"px");
				$img.css("top", dr[2]+"px");
				var $span = $("<span class=\"otherShip\" />");
				$span.html(dr[3]);
				$span.css("left", (parseInt(dr[1])+100)+"px");
				$span.css("top", (parseInt(dr[2])+80)+"px");
				$div.append($img);
				$div.append($span);
			}
			$("#divOtherShip").remove();
			$("body").before($div);
			setTimeout(refreshOtherShip, 60000);
		}
	});
}

function initGame(){
	var loadedSound = 0;
	isLoadedSound = false;
	createjs.Sound.addEventListener("fileload", function(){
		loadedSound += 1;
		if(loadedSound == 3) {
			isLoadedSound = true;
		}
	});
	createjs.Sound.registerSound("media/wave.wav", "wave");
	createjs.Sound.registerSound("media/bell.wav", "bell");
	createjs.Sound.registerSound("media/arrive.wav", "arrive");

	var shipsSpeed = [1, 1.5, 2, 2.5, 3, 3.5, 4, 5, 6, 7];
	shipSpeed = shipsSpeed[shipID];

    canvas = $("#canvasGame").get(0);
    game = canvas.getContext("2d");

    isMoving = false;

	land = new RectList();
	/*land.addItem(-1, -1, 652, 365);
	land.addItem(-1, 363, 791, 544);
	land.addItem(-1, 542, 936, 655);
	land.addItem(-1, 653, 1057, 781);
	land.addItem(-1, 779, 1258, 949);
	land.addItem(-1, 947, 1335, 1116);
	land.addItem(-1, 1114, 1427, 1779);
	land.addItem(650, -1, 773, 88);
	land.addItem(190, 1770, 1155, 1966);
	land.addItem(529, 1960, 952, 2107);
	land.addItem(540, 2104, 759, 2328);
	land.addItem(2461, 169, 3085, 579);
	land.addItem(-1, -1, 652, 365);
	land.addItem(1553, 673, 1923, 863);
	land.addItem(1423, 965, 1643, 1057);
	land.addItem(2197, 1590, 2425, 1714);
	land.addItem(2409, 1836, 2549, 1926);
	land.addItem(1900, 1870, 2303, 2066);
	land.addItem(1350, 1984, 1529, 2112);
	land.addItem(189, 1991, 405, 2130);
	land.addItem(837, 2465, 1214, 2529);
	land.addItem(148, 2364, 350, 2455);*/

	land.addItem(-1, -1, 771, 29);
	land.addItem(-1, 27, 728, 56);
	land.addItem(-1, 54, 674, 98);
	land.addItem(-1, 96, 653, 133);
	land.addItem(-1, 131, 637, 230);
	land.addItem(-1, 228, 615, 370);
	land.addItem(-1, 368, 661, 412);
	land.addItem(-1, 410, 772, 439);
	land.addItem(-1, 437, 777, 551);
	land.addItem(-1, 549, 714, 614);

	land.addItem(-1, 596, 863, 662);
	land.addItem(-1, 627, 905, 703);
	land.addItem(-1, 671, 964, 735);

	land.addItem(-1, 722, 1006, 800);
	land.addItem(-1, 770, 1111, 875);
	land.addItem(-1, 822, 1162, 971);
	land.addItem(-1, 894, 1231, 1030);

	land.addItem(-1, 1000, 1300, 1053);
	land.addItem(-1, 1051, 1320, 1186);
	land.addItem(-1, 1184, 1365, 1346);
	land.addItem(-1, 1344, 1378, 1687);
	land.addItem(181, 1684, 1295, 1771);
	land.addItem(241, 1765, 1200, 1827);
	land.addItem(238, 1825, 1132, 1872);
	land.addItem(439, 1870, 1026, 1918);
	land.addItem(589, 1916, 897, 2081);
	land.addItem(580, 2075, 803, 2156);
	land.addItem(580, 2154, 697, 2251);

	land.addItem(216, 2013, 400, 2100);
	land.addItem(155, 2383, 330, 2435);
	land.addItem(884, 2477, 1195, 2523);
	land.addItem(1371, 2000, 1495, 2085);
	land.addItem(1975, 1900, 2284, 2036);
	land.addItem(2419, 1864, 2506, 1914);
	land.addItem(2212, 1614, 2327, 1656);
	land.addItem(1430, 987, 1569, 1050);
	land.addItem(1028, 105, 1211, 270);
	land.addItem(2086, 1209, 2232, 1325);
	land.addItem(1600, 2246, 1774, 2372);
	land.addItem(1650, 685, 1860, 815);

	locations = new RectList();
	locations.addItem(216, 2013, 400, 2100); // đảo Phú Quốc - 0
	locations.addItem(884, 2477, 1195, 2523); // Côn Đảo
	locations.addItem(1371, 2000, 1495, 2085); // đảo Phú Quý
	locations.addItem(1975, 1900, 2284, 2036); // đảo Trường Sa
	locations.addItem(2212, 1614, 2327, 1656); // đảo Phan Vinh
	locations.addItem(1430, 987, 1569, 1050); // đảo Lý Sơn - 5
	locations.addItem(1028, 105, 1211, 270); // Bạch Long Vĩ - 6
	locations.addItem(2086, 1209, 2232, 1325); // Bãi Câu 1
	locations.addItem(1600, 2246, 1774, 2372); // Bãi Câu 2 - 8
	locations.addItem(1650, 685, 1860, 815); // Hoàng Sa - 9
	locations.addItem(507, 242, 739, 448); // Ngân hàng Vinh - 10
	locations.addItem(1156, 859, 1363, 1095); // Ngân hàng Đà Nẵng
	locations.addItem(1225, 1436, 1509, 1662); // Ngân hàng Nha Trang
	locations.addItem(783, 1776, 1116, 2082); // Ngân hàng Thành phố Hồ Chí Minh - 13

	locationsName = ["đảo Phú Quốc",  "Côn Đảo"  , "đảo Phú Quý", "đảo Trường Sa", "đảo Phan Vinh", "đảo Lý Sơn" , "đảo Bạch Long Vĩ" , "Bãi Câu 1", "Bãi Câu 2", "Hoàng Sa", "Vinh", "Đà Nẵng", "Nha Trang", "Thành phố Hồ Chí Minh"];
	islandsGame   = [   "memory"   , "flipImage" ,   "puzzle"   ,     "memory"   ,     "puzzle"   ,  "flipImage" ,       "sort"       ,  "fishing" ,  "fishing" ];
	islandsCode   = [   "phuquoc"  ,  "condao"   ,   "phuquy"   ,    "truongsa"  ,    "phanvinh"  ,    "lyson"   ,    "bachlongvi"    ,  "baicau1" ,  "baicau2" ];
	islandsDialog = [   "PhuQuoc"  ,  "ConDao"   ,   "PhuQuy"   ,    "TruongSa"  ,    "PhanVinh"  ,    "LySon"   ,    "BachLongVi"    ,  "BaiCau1" ,  "BaiCau2" ];

    dangerousSea = new Rect(2634, 930, 3427, 1333);
	goodSea = new Rect(3025, 1080, 3112, 1136);

	//game.strokeRect(dangerousSea.x, dangerousSea.y, dangerousSea.right-dangerousSea.x, dangerousSea.bottom-dangerousSea.y);
	//game.strokeRect(goodSea.x, goodSea.y, goodSea.right-goodSea.x, goodSea.bottom-goodSea.y);

	bank = w = undefined;
	playedIdland = -1;
	isInBank = false;

	//drawAllRect(land);
	//drawAllRect(locations);

    //lockScroll();
    //scrollTop(2000);
    //scrollLeft(100);
}

function move(){
    canvas.width = canvas.width;
	//drawAllRect(land);
	//drawAllRect(locations);

    curX += stepX;
    curY += stepY;

    game.drawImage(img, curX, curY);

	game.font = "bold 16px Times New Roman";
	game.fillStyle = "#FF0000";
	game.textAlign = "center";
	game.fillText(characterName, curX+200, curY+105);

	var touchedLand = false;
	var cenX = curX+(img.width/2);
    var cenY = curY+(img.height/2);
	if(goodSea.isContains(cenX, cenY)){
		$.ajax({
    		url: "AJAXSubmit.aspx",
			type: "POST",
    		data: {
	    		GoodSea: "true"
			},
			success: function(data){
				if(data != "fail"){
					alert("Bạn đã tìm thấy ngọc bí ẩn trị giá 300.000 vàng !");
					$("#spanGold").html(parseInt($("#spanGold").html())+300000);
				}
			}
		});
	}
	var rateShipwreck = dangerousSea.isContains(cenX, cenY)?0.05:0.00007;
    if(Math.random() <= rateShipwreck){
		localStorage.currentShipID = shipID;
		$.ajax({
    		url: "AJAXSubmit.aspx",
			type: "POST",
    		data: {
	    		CurrentShip: -1
			}
		});
		if(w != undefined){
			w.onbeforeunload = function(){
			};
		}
		var func = function (){
			$.ajax({
	    		url: "AJAXSubmit.aspx",
				type: "POST",
	    		data: {
		    		ShipWreck: "true"
				}
			});
			alert("Bạn đã bị mất thuyền !");
			window.onbeforeunload = function(){
			};
			window.location.reload()
		};
		window.onbeforeunload = func;
		alert("Thuyền của bạn đã bị thủng !");
		if(localStorage.isNewGame == undefined){
			alert("Vui lòng tắt trình chặn pop-up để vá tàu (nếu có) !");
			localStorage.isNewGame = false;
		}
		w = window.open("game.aspx");
		if(w != undefined){
			w.onload = function (){
				$("#hidIsPlayingGame").attr("value", "true");
				game_play(w, "shipWreck", 0);
			}
			w.onbeforeunload = func;
		}
		isMoving = false;
    }else{
	    var aStepX = Math.abs(stepX);
	    var aStepY = Math.abs(stepY);
		touchedLand = land.isContains(cenX, cenY);
	    isMoving = !((((curX>=destX-aStepX) && (curX<=destX+aStepX)) || ((curY>=destY-aStepY) && (curY<=destY+aStepY))) || touchedLand);
	}

    if(isMoving){
        setTimeout(function(){
            move();
        }, 20);
    }else{
		if(touchedLand){
		    curX -= stepX;
		    curY -= stepY;
		}
    	$.ajax({
    		url: "AJAXSubmit.aspx",
			type: "POST",
    		data: {
	    		MapX: curX,
				MapY: curY
			}
		});
    	if(isLoadedSound){
    		stopSound();
			if(touchedLand){
				playArrive();
			}
		}
        $("#movingTo").hide();
		if(touchedLand){
			containsIndex = locations.containsIndex(cenX, cenY);
			if((containsIndex>=0) && (containsIndex<=8)){
				/*if(playedIdland == containsIndex){
					alert("Bạn vừa làm nhiệm vụ tại "+locationsName[containsIndex]+" !\nHãy sang nơi khác làm nhiệm vụ trước khi quay lại đây !");
				}else{
					$("body").unbind("click");
					$("#dialogInfomation"+islandsDialog[containsIndex]).dialog("open");
				}*/
				$("body").unbind("click");
				$("#dialogInfomation"+islandsDialog[containsIndex]).dialog("open");
			}
			if((containsIndex>=10) && (containsIndex<=13)){
				if(confirm("Bạn có muốn vào ngân hàng "+locationsName[containsIndex]+" không ?")){
					comeToBank();
				}
			}
			if(containsIndex == 9){
				comeToFlag();
			}
		}
    }
}

function speedUp(mul){
	stepX *= mul;
	stepY *= mul;
}

function Rect(x, y, right, bottom){
	this.x = x;
	this.y = y;
	this.right = right;
	this.bottom = bottom;
}

Rect.prototype.isContains = function(x, y){
	return (x>this.x) && (x<this.right) && (y>this.y) && (y<this.bottom);
}

function RectList(){
	this.items = [];
}

RectList.prototype.addItem = function(x, y, right, bottom){
	this.items.push(new Rect(x, y, right, bottom));
}

RectList.prototype.isContains = function(x, y){
	for (var i = 0; i < this.items.length; i++) {
		if(this.items[i].isContains(x, y))
		{
			return true;
		}
	}
	return false;
}

RectList.prototype.containsIndex = function(x, y){
	for (var i = 0; i < this.items.length; i++) {
		if(this.items[i].isContains(x, y))
		{
			return i;
		}
	}
	return -1;
}

function drawAllRect(rectList){
	game.save();
	game.strokeStyle = "red";
	for (var i = 0; i < rectList.items.length; i++) {
		var rect = rectList.items[i];
		game.strokeRect(rect.x, rect.y, rect.right-rect.x, rect.bottom-rect.y);
	}
	game.restore();
}

$(document).ready(function(){
	shipID = parseInt($("#hidShipID").val());
	if(shipID == -1){
		alert("Bạn chưa mua thuyền nên không thể vào chơi được !\nHãy mua thuyền trước khi quay lại !");
		window.location.href = "profiles.aspx";
		return;
	}else{
	    initGame();

	    /*curX = 950;
	    curY = 1850;*/
		curX = parseInt($("#hidMapX").attr("value"));
		curY = parseInt($("#hidMapY").attr("value"));
		$("html, body").animate({
			scrollLeft: (curX-450),
			scrollTop: (curY-120)
		}, 0);

		characterName = $("#hidCharacterName").attr("value");

	    img = new Image();
	    img.onload = function(){
	        game.drawImage(img, curX, curY);

			game.font = "bold 16px Times New Roman";
			game.fillStyle = "#FF0000";
			game.textAlign = "center";
			game.fillText(characterName, curX+200, curY+105);
	    };
	    img.src = "image/ship/"+(shipID+1)+".png";

		bodyClick = function(e){
	    	if($("#hidIsPlayingGame").attr("value") == "true"){
	    		alert("Bạn đang làm nhiệm vụ nên không thể di chuyển !");
			}else{
				if(isInBank){
					bank_comeOut();
				}
		        destX = e.pageX-(img.width/2);
		        destY = e.pageY-(img.height/2);

		    	if(!(((destX>=curX-5) && (destX<=curX+5)) && ((destY>=curY-5) && (destY<=curY+5)))){
		            diffX = destX - curX;
		            diffY = destY - curY;

		            if(Math.abs(diffX) > Math.abs(diffY)){
		                stepX = diffX==0?0:diffX<0?-1:1;
		                stepY = diffY/(diffX==0?Math.abs(diffY):Math.abs(diffX));
		            }else{
		                stepX = diffX/(diffY==0?Math.abs(diffX):Math.abs(diffY));
		                stepY = diffY==0?0:diffY<0?-1:1;
		            }
					speedUp(shipSpeed);

			        $("#movingTo").css("top", (e.pageY-(parseInt($("#movingTo").attr("width"))/2))+"px");
			        $("#movingTo").css("left", (e.pageX-(parseInt($("#movingTo").attr("height"))/2))+"px");
			        $("#movingTo").show();

			        if(isMoving){
			   			if(isLoadedSound){
				    		playBell();
						}
					}else{
			            isMoving = true;
			    		if(isLoadedSound){
							stopSound();
							playBell();
				    		playWave();
						}
			            move();
			        }
				}
			}
	    };
	    $("body").click(bodyClick);
		$("#btnRestart").click(function(event){
			event.stopPropagation();
			if( confirm("ĐỒNG Ý ?\nTài khoản của bạn sẽ trở về như lúc mới đăng ký !")&&
				confirm("ĐỒNG Ý ?") ){
					$("#btnRestart").unbind("click");
					restart();
					alert("Đã khởi tạo lại tài khoản");
					window.location.href = "profiles.aspx";
			}
		});
		if($("#hidAllowRestart").val() == "true"){
			$("#btnRestart").show();
		}

		$(".dialog").dialog({
			autoOpen: false,
			width: 620,
			modal: true,
			draggable: false,
			resizable: false,
			buttons: {
				"Bắt Đầu": function () {
					$(this).dialog("close");
					if(w != undefined){
						w.onbeforeunload = function(){
						};
					}
					if(localStorage.isNewGame == undefined){
						alert("Vui lòng tắt trình chặn pop-up để làm nhiệm vụ (nếu có) !");
						localStorage.isNewGame = false;
					}
					localStorage.islandCode = islandsCode[containsIndex];
					w = window.open("game.aspx");
	                if(w != undefined){
	                	w.onload = function(){
		                	$("#hidIsPlayingGame").attr("value", "true");
							playedIdland = containsIndex;
							game_play(w, islandsGame[containsIndex], containsIndex);
							w.checkIsland(containsIndex);
						}
						w.onbeforeunload = function(){
							$("#hidIsPlayingGame").attr("value", "false");
							alert("Bạn đã từ bỏ nhiệm vụ !");
						}
	                }
				},
				"Từ Bỏ": function () {
					$(this).dialog("close");
				}
			},
			close: function(){
				$("body").click(bodyClick);
			}
		});
		$(".ui-widget-overlay, .ui-dialog").click(function(event){
			event.stopPropagation();
		});
		$("#btnLogout").click(function(event){
			event.stopPropagation();
			window.location.href = "logout.aspx";
		});
		refreshOtherShip();
	}
});