function endGame(){
	window.onbeforeunload = function(){
	};
	if(window.opener != null){
		$(window.opener.document).find("#hidIsPlayingGame").attr("value", "false");
	}
	setTimeout(function(){
		window.close();
		self.close();
		window.open("", "_self");
		window.close();
		window.location.href = "about:blank";
	}, 1000);
	if(window.opener != null){
		window.opener.onbeforeunload = function(){
		};
	}
}

function hide(){
	$(".hide").hide();
}

function fail(){
	hide();
	$("#divFail").show();
	endGame();
}

function success(){
	hide();
	$("#divSuccess").show();
	endGame();
}

function bankruptcy(){
	hide();
	$("#divBankruptcy").show();
	endGame();
}

function answerQuestion(gameName){
	hide();
	$("#spanGameName").html(gameName);
	$("#divAnswerQuestion").show();
}

function setBackground(url){
	$("body").css("background", "url('"+url+"')").css("background-size", "cover");
}

function setTimer(id, minute, second){
	if(second == undefined){
		setTimer(id, Math.floor(minute/60), minute%60);
	}else{
		$(id).html((minute<10?"0"+minute:minute)+":"+(second<10?"0"+second:second));
	}
}

function getTimer(id){
	var data = $(id).html().split(":");
	return (parseInt(data[0])*60)+parseInt(data[1]);
}

function startTimer(id){
	timer = setInterval("doTimer(\""+id+"\")", 1000);
}

function doTimer(id){
	var data = $(id).html().split(":");
	var minute = parseInt(data[0]);
	var second = parseInt(data[1]);
	if(second == 0){
		minute--;
		second = 59;
    }else{
    	second--;
    }
    setTimer(id, minute, second);
	if((second == 0) && (minute <= 0)){
		clearInterval(timer);
		if(beforeEndTimer() == undefined){
			alert("Bạn đã hết thời gian !");
		}
		endTimer();
	}
}

function endTimer(){
}

function beforeEndTimer(){
}

function displayQuestion(){
	var $question = $("<div id=\"divQuestion\" />");
	var questionsAnswers = $("#hidQuestionAnswer").attr("value").split("|||");
	var i;
	answers = [];
	for(i = 0; i < questionsAnswers.length; i++){
		var questionAnswer = questionsAnswers[i].split("||");
		var question = questionAnswer[0];
		var answer = questionAnswer[1].split("|");
		answers.push(parseInt(answer[1]));
        var $span = $("<span class=\"question header\" />");
        $span.html((i+1)+". "+question+" ?");
		$question.append($span);
		$question.append("<br />");
		var $answer = $("<div class=\"answer\" />");
		$answer.attr("id", "divAnswerQuestion"+i);
		answer[0] = parseInt(answer[0]);
		switch(answer[0]){
			case 0:
				for(j=0; j<2; j++){
					var $rdAnswer = $("<input type=\"radio\" />");
			        $rdAnswer.attr("id", "rdAnswer"+j+"Question"+i);
					$rdAnswer.attr("name", "rdAnswerQuestion"+i);
                	$rdAnswer.attr("class", "answer"+j);
					$answer.append($rdAnswer);
					var $label = $("<label />");
                    $label.attr("for", $rdAnswer.attr("id"));
                    $label.html(String.fromCharCode(65+j)+". "+(j==0?"Đúng":"Sai"));
					$answer.append($label);
					$answer.append("<br />");
				}
				break;
			case 1:
			case 2:
			case 3:
			case 4:
				var j;
				for(j=2; j<answer.length; j++){
					var $rdAnswer = $("<input type=\"radio\" />");
			        $rdAnswer.attr("id", "rdAnswer"+j+"Question"+i);
					$rdAnswer.attr("name", "rdAnswerQuestion"+i);
					$rdAnswer.attr("class", "answer"+(j-2));
					$answer.append($rdAnswer);
					var $label = $("<label />");
                    $label.attr("for", $rdAnswer.attr("id"));
                    $label.html(String.fromCharCode(63+j)+". "+answer[j]);
					$answer.append($label);
					$answer.append("<br />");
				}
				if((answer[0] == 2) || (answer[0] == 4)){
					var $rdAnswer = $("<input type=\"radio\" />");
			        $rdAnswer.attr("id", "rdAnswer"+j+"Question"+i);
					$rdAnswer.attr("name", "rdAnswerQuestion"+i);
					$rdAnswer.attr("class", "answer"+(j-2));
					$answer.append($rdAnswer);
					var $label = $("<label />");
                    $label.attr("for", $rdAnswer.attr("id"));
                    $label.html(String.fromCharCode(63+j)+". Tất cả các câu trên đều đúng");
					$answer.append($label);
					$answer.append("<br />");
					j++;
				}
				if((answer[0] == 3) || (answer[0] == 4)){
					var $rdAnswer = $("<input type=\"radio\" />");
			        $rdAnswer.attr("id", "rdAnswer"+j+"Question"+i);
					$rdAnswer.attr("name", "rdAnswerQuestion"+i);
					$rdAnswer.attr("class", "answer"+(j-2));
					$answer.append($rdAnswer);
					var $label = $("<label />");
                    $label.attr("for", $rdAnswer.attr("id"));
                    $label.html(String.fromCharCode(63+j)+". Tất cả các câu trên đều sai");
					$answer.append($label);
					$answer.append("<br />");
					j++;
				}
				break;
		}
		$question.append($answer);
		$question.append("<br />");
	}
	$("#divWrapperQuestion").append($question);
}

function countCorrectAnswer(){
	var i;
	var result = 0;
	for(i=0; i<answers.length; i++){
		var $selectedAnswer = $("#divAnswerQuestion"+i+" input[type='radio']:checked");
        if($selectedAnswer.get(0) != undefined){
			if(parseInt($selectedAnswer.attr("class").replace("answer", "")) == answers[i]){
				$selectedAnswer.next().after($("<img src=\"image/answerTrue.png\">"));
				result++;
			}else{
				$selectedAnswer.next().after($("<img src=\"image/answerFalse.png\">"));
			}
        }
	}
	if(items.add1trueAnswer && (result < answers.length)){
		result++;
	}
	return result;
}

function decrementGold(gold){
	var result;
	$.ajax({
		url: "AJAXSubmit.aspx",
		type: "POST",
		data: {
			DecrementGold: gold
		},
		async: false,
		success: function(data){
			result = !data.startsWith("fail");
			data = data.replace("fail", "");
			$("#spanGold").html(data);
			$(window.opener.document).find("#spanGold").html(data);
		}
	});
	return result;
}

function forceDecrementGold(gold){
	var result;
	$.ajax({
		url: "AJAXSubmit.aspx",
		type: "POST",
		data: {
			DecrementGold: gold,
			Force: "true"
		},
		async: false,
		success: function(data){
			result = !data.startsWith("fail");
			data = data.replace("fail", "");
			$("#spanGold").html(data);
			$(window.opener.document).find("#spanGold").html(data);
		}
	});
	return result;
}

/*function incrementGold(gold){
	$.ajax({
		url: "AJAXSubmit.aspx",
		type: "POST",
		data: {
			IncrementGold: gold
		}
	});
}

function recordGold(gold){
	$.ajax({
		url: "AJAXSubmit.aspx",
		type: "POST",
		data: {
			IslandID: $("#hidIslandID").attr("value"),
			RecordGold: gold
		}
	});
}*/

function incrementRecordGold(gold){
	$.ajax({
		url: "AJAXSubmit.aspx",
		type: "POST",
		data: {
			IncrementGold: gold,
			IslandID: parseInt($("#hidIslandID").attr("value")),
			RecordGold: gold
		},
		success: function(data){
			$("#spanGold").html(data);
			$(window.opener.document).find("#spanGold").html(data);
		}
	});
}

function updateGold(){
	$.ajax({
		url: "AJAXSubmit.aspx",
		type: "POST",
		data: {
			GetGold: "true"
		},
		success: function(data){
			$("#spanGold").html(data);
			$(window.opener.document).find("#spanGold").html(data);
		}
	});
}

function restart(){
	$.ajax({
		url: "AJAXSubmit.aspx",
		type: "POST",
		data: {
			Restart: "true"
		}
	});
}

function nextStep(){
	 $("#menu ul > li.selected").next().andSelf().toggleClass("selected");
}

function updateInvestment(islandID){
	$.ajax({
		url: "AJAXSubmit.aspx",
		type: "POST",
		data: {
			GetInvestmentTop: islandID
		},
		success: function(data){
			$("#divTableInvestment table tbody").append(data);
			$("#dialogInvestmentTop").dialog("option", "position", "center");
		}
	});
	$.ajax({
		url: "AJAXSubmit.aspx",
		type: "POST",
		data: {
			GetUserInvestment: islandID
		},
		success: function(data){
			$("#spanInvestment").html(data);
		}
	});
}

function updateTopIsland(islandID){
	$.ajax({
		url: "AJAXSubmit.aspx",
		type: "POST",
		data: {
			GetTopIsland: islandID
		},
		success: function(data){
			$("#divTableTopIsland table tbody").append(data);
			$("#dialogInvestmentTop").dialog("option", "position", "center");
		}
	});
}

function updateTopInvestment(islandID){
	updateTopIsland(islandID);
	updateInvestment(islandID);
}

function checkIsland(id){
	islandID = id;
	if((islandID>=0) && (islandID<=6)){
		updateTopInvestment(islandID);
		$("#dialogInvestmentTop").dialog("open");
	}else if((islandID==7) || (islandID==8)){
		updateTopIsland(islandID);
		$("#dialogInvestmentTop h3").html("__________&nbsp;Trò Chơi&nbsp;___________");
		$("#divTableInvestment, #divInvestment").hide();
		$("#divTableTopIsland").css("float", "none").css("width", "100%");
		$(".ui-dialog-title").html("Bảng xếp hạng trò chơi tại bãi câu");
		$("#dialogInvestmentTop").dialog("option", "width", "auto").dialog("open");
	}
}

//Function for Memory
function getRandomInt(max) {
	return Math.floor(Math.random()*max)+1;
}

function updateAllDragableObject(){
	$("a[draggable='true']").bind("dragstart", function(event){
		$draggingObject = $(this);
	});
}

$(document).ready(function(){
	//Global intitalization
	updateGold();

	islandCode = localStorage.islandCode;
	localStorage.removeItem("islandCode");

	$("#dialogInvestmentTop").dialog({
		autoOpen: false,
		width: 800,
		modal: true,
		draggable: false,
		resizable: false,
		buttons: {
			"Đóng": function () {
				$(this).dialog("close");
			}
		}
	});
	$("#txtInvestment").keydown(function(event){
		if( event.keyCode != 8 && event.keyCode != 46 &&
			(event.keyCode < 35 || event.keyCode > 40) && // Arrow keys
			(event.keyCode < 48 || event.keyCode > 57) && // Numbers
			(event.keyCode < 96 || event.keyCode > 105)){ // Keypad numbers
				event.preventDefault();
				return false;
			}
	});
	$("#btnInvestment").click(function(){
		if($("#txtInvestment").val() == ""){
			alert("Bạn chưa nhập số tiền cần đầu tư !");
		}else{
			var investment = parseInt($("#txtInvestment").val());
			if(investment == 0){
				alert("Số tiền đầu tư phải lớn hơn 0 !");
			}else{
				$.ajax({
					url: "AJAXSubmit.aspx",
					type: "POST",
					data: {
						Investment: islandID,
						Gold: investment
					},
					success: function(data){
						if(data == ""){
							$("#divTableInvestment table tbody").html("<tr><td>Tên</td><td>Vàng</td><td class=\"rate\"></td></tr>");
							updateInvestment(islandID);
							updateGold();
							$("#txtInvestment").val("");
						}else{
							alert(data+" !");
						}
					}
				});
			}
		}
	});

	$("li").disableSelection();
	//setBackground("image/game/background/"+islandCode+".png");
    $(".abandonGame").attr("value", "Từ Bỏ Nhiệm Vụ");
    $(".abandonGame").click(function(){
    	fail();
    });

	$(".shelf a img").mouseenter(function(){
		this.src = this.src.replace(".png", "_hover.png");
	}).mouseleave(function(){
		this.src = this.src.replace("_hover.png", ".png");
	}).click(function(){
		var srcSplited = this.src.split("/");
		var itemName = srcSplited[srcSplited.length-1].replace("_hover.png", "");
		if((items.x2gold || items.x3gold) && ((itemName=="x2gold") || (itemName=="x3gold"))){
			alert("Bạn đã mua "+(items.x2gold?"x2 vàng":"x3 vàng")+" nên không thể mua thêm "+(items.x3gold?"x2 vàng":"x3 vàng")+" !");
		}else{
			if(decrementGold(itemsPrice[itemName])){
		        $(this).parent().parent().hide();
				items[itemName] = true;
			}else{
				alert("Bạn không có đủ "+itemsPrice[itemName]+" vàng để mua vật phẩm này !");
			}
		}
	});

	setTimer("#spanTimerQuestion", 60);
	$("#btnStartTimerQuestion").click(function(){
		$("#btnStartTimerQuestion").hide();
		$("#divWrapperQuestion, #btnDoneAnswer").show();
		startTimer("#spanTimerQuestion");
		displayQuestion();
		$(".container").show();
	});

	$("#btnDoneAnswer").click(function(){
		clearInterval(timer);
		endTimer();
	});

	$("#btnRestart").click(function(){
		restart();
		hide();
		$("#divRestartSuccess").show();
	});

	//Script for Puzzle
	$("#btnNextStep1Puzzle").click(function(){
		hide();
		if(confirm("Cần trả 500 vàng để làm nhiệm vụ !\nBạn có muốn tiếp tục ?")){
			if(decrementGold(500)){
		        $("#divPuzzle, #divStep2Puzzle").show();
				nextStep();
				items = {
					add30s: false,
					add60s: false,
					x2time: false,
					add1trueAnswer: false
				};
				itemsPrice = {
					add30s: 1800,
					add60s: 4000,
					x2time: 3000,
					add1trueAnswer: 300
				};
			}else{
				alert("Bạn không có đủ 500 vàng để làm nhiệm vụ !");
				fail();
			}
		}else{
			fail();
		}
	});

	$("#btnNextStep2Puzzle").click(function(){
		endTimer = function(){
			$("#btnDoneAnswer").unbind("click");
			var count = countCorrectAnswer();
			$("#btnDoneAnswer").attr("value", "Vào Chơi");
			$("#btnDoneAnswer").click(function(){
				var message = "Bạn đã trả lời đúng "+count+" câu hỏi !";
				attr = {
					time: 60
				};
				switch(count){
					case 0:
						attr.time -= 10;
	                    message += "\nBạn bị phạt giảm 10 giây làm nhiệm vụ !";
					case 1:
						if(!forceDecrementGold(500)){
							alert("Bạn đã trả lời đúng "+count+" câu hỏi !\nBạn bị phạt 500 vàng nhưng lại không có đủ vàng !");
							bankruptcy();
							return;
						}
						message += "\nBạn bị phạt 500 vàng !"
						break;
					case 2:
						attr.time += 10;
						message += "\nBạn được thưởng 10 giây làm nhiệm vụ !";
						break;
					case 3:
						attr.time += 20;
						message += "\nBạn được thưởng 20 giây làm nhiệm vụ !";
						break;
					case 4:
						attr.time += 40;
						message += "\nBạn được thưởng 40 giây làm nhiệm vụ !";
						break;
					case 5:
						attr.time += 60;
						message += "\nBạn được thưởng 1 phút làm nhiệm vụ !";
						break;
				}
				if(items.x2time){
					attr.time *= 2;
				}
				if(items.add30s){
					attr.time += 30
				}
				if(items.add60s){
					attr.time += 60;
				}
				alert(message);
				hide();
				setTimer("#spanTimerPuzzle", attr.time);
				endTimer = function(){
					if(isSolved){
						var prizeGold = (islandCode=="phanvinh"?(10000+(getTimer("#spanTimerPuzzle")*250)):(getTimer("#spanTimerPuzzle")*60));
						incrementRecordGold(prizeGold);
						alert("Bạn đã hoàn thành nhiệm vụ ! Chúc mừng bạn !\nBạn được thưởng "+prizeGold+" vàng !");
						success();
					}else{
						alert("Bạn đã không hoàn thành nhiệm vụ !");
						fail();
					}
				}
				$("#divPuzzle, #divStep4Puzzle").show();
				nextStep();
			});
		}
		answerQuestion("Xếp Hình");
        nextStep();
	});

	$("#btnStartTimerPuzzle").click(function(){
		$("#btnStartTimerPuzzle").hide();
		$("#divWrapperPuzzleGame").show();
		isSolved = false;
		$("#imgPuzzleGame").load(function(){
			snapfit.add($("#imgPuzzleGame").get(0), {
				aborder: true,
				aimage: true,
				polygon: true,
				nokeys: true,
				space: 50,
				callback: function(){
					isSolved = true;
					clearInterval(timer);
					endTimer();
				},
			});
			snapfit.reset($("#imgPuzzleGame").get(0), (islandCode=="phanvinh"?3:0));
			snapfit.admix($("#imgPuzzleGame").get(0), false);
		});
		var src = "image/game/puzzle/"+islandCode+"/"+getRandomInt(4)+".jpg";
		$("#imgPuzzleGame").attr("src", src);
		startTimer("#spanTimerPuzzle");
	});

	//Script for Memory
	$("#btnNextStep1Memory").click(function(){
		hide();
		if(confirm("Cần trả 500 vàng để làm nhiệm vụ !\nBạn có muốn tiếp tục ?")){
			if(decrementGold(500)){
		        $("#divMemory, #divStep2Memory").show();
				nextStep();
				items = {
					add10s: false,
					add30s: false,
					add60s: false,
					add10s_remember: false,
					add20s_remember: false,
					add1trueAnswer: false
				};
				itemsPrice = {
					add10s: 300,
					add30s: 1200,
					add60s: 3000,
					add10s_remember: 300,
					add20s_remember: 1500,
					add1trueAnswer: 300
				};
			}else{
				alert("Bạn không có đủ 500 vàng để làm nhiệm vụ !");
				fail();
			}
		}else{
			fail();
		}
	});

	$("#btnNextStep2Memory").click(function(){
		endTimer = function(){
			$("#btnDoneAnswer").unbind("click");
			var count = countCorrectAnswer();
			$("#btnDoneAnswer").attr("value", "Vào Chơi");
			$("#btnDoneAnswer").click(function(){
				var message = "Bạn đã trả lời đúng "+count+" câu hỏi !";
				attr = {
					rememberTime: 10,
					time: 60,
					picturesNumber: 12
				};
				switch(count){
					case 0:
						attr.rememberTime -= 5;
	                    message += "\nBạn bị phạt giảm 5 giây thời gian nhớ !";
						break;
					case 1:
						attr.picturesNumber += 3;
						message += "\nBạn bị phạt tăng 1 hình mỗi khung hình !";
						break;
					case 2:
						attr.time -= 15;
	                    message += "\nBạn bị phạt giảm 15 giây làm nhiệm vụ !";
						break;
					case 3:
						attr.rememberTime += 10;
						message += "\nBạn được thưởng 10 giây thời gian nhớ !";
						break;
					case 4:
						attr.time += 10;
						attr.picturesNumber -= 3;
						message += "\nBạn được thưởng 10 giây làm nhiệm vụ và giảm 1 hình mỗi khung hình !";
						break;
					case 5:
						attr.time += 30;
						attr.picturesNumber -= 3;
						message += "\nBạn được thưởng 30 giây làm nhiệm vụ và giảm 1 hình mỗi khung hình !";
						break;
				}
				if(items.add10s){
					attr.time += 10;
				}
				if(items.add30s){
					attr.time += 30
				}
				if(items.add60s){
					attr.time += 60;
				}
				if(items.add10s_remember){
					attr.rememberTime += 10;
				}
				if(items.add20s_remember){
					attr.rememberTime += 20;
				}
				alert(message);
				hide();
				var arrayMemory = [];
				while(arrayMemory.length < attr.picturesNumber){
					var num = getRandomInt(attr.picturesNumber);
					if(arrayMemory.indexOf(num) == -1){
						arrayMemory.push(num);
					}
				}
				var i, j;
				arrayTrueMemory = [];
				for(i=0; i<arrayMemory.length; ){
					for(j=0; j<3; j++,i++){
						if((i>=0) && (i<=2)){
							arrayTrueMemory[j] = [];
						}
						arrayTrueMemory[j].push(arrayMemory[i]);
						var $a = $("<a href=\"#\" />");
						var $img = $("<img />");
						$img.attr("src", "image/game/memory/"+islandCode+"/"+arrayMemory[i]+".jpg");
						$a.append($img);
						$("#divMemoryRemember"+(j+1)).append($a);
					}
				}
				setTimer("#spanTimerMemoryRemember", attr.rememberTime);
				beforeEndTimer = function(){
					hide();
				}
				endTimer = function(){
					beforeEndTimer = function(){
					};
					var arrayRandom = [];
					while(arrayRandom.length < attr.picturesNumber){
						var num = getRandomInt(attr.picturesNumber);
						if(arrayRandom.indexOf(num) == -1){
							arrayRandom.push(num);
						}
					}
					var i;
					for(i=0; i<arrayRandom.length; i++){
						var $a = $("<a href=\"#\" draggable=\"true\" />");
						var $img = $("<img />");
						$img.attr("id", "imgMemory"+arrayRandom[i]);
						$img.attr("src", "image/game/memory/"+islandCode+"/"+arrayRandom[i]+".jpg");
						$a.append($img);
						$("#divMemoryGallery").append($a);
					}
					updateAllDragableObject();
					$("div[droppable='true']").bind("dragover dragleave", function(event){
						event.preventDefault();
						this.style.borderColor = event.type=="dragover"?"#000000":"#CCCCCC";
						return false;
					});
					$("div[droppable='true']").bind("dragenter", function(event){
						event.preventDefault();
						return false;
					});
					$("div[droppable='true']").bind("drop", function(event){
						event.preventDefault();
						$draggingObject.addClass("hidden");
						var self = this;
						var $_draggingObject = $draggingObject;
						var nextFunction = function(){
					    	$(self).append($_draggingObject);
							$_draggingObject.attr("class", "dropped");
							self.style.borderColor = "#CCCCCC";
							updateAllDragableObject();
					    };
						if($draggingObject.hasClass("dropped")){
							nextFunction();
						}else{
					    	setTimeout(nextFunction, 500);
						}
						return false;
					});
					endTimer = function(){
						if(!btnMemoryDonePlayClick){
							alert("Bạn đã không hoàn thành nhiệm vụ !");
							fail();
							return;
						}
						btnMemoryDonePlayClick = false;
						var i, j;
						for(i=0; i<3; i++){
							var $curDiv = $("#divMemoryPlay"+(i+1)+" a img");
							for(j=0; j<(attr.picturesNumber/3); j++){
								if($curDiv.get(j) == undefined){
	                            	alert("Hãy thử lại ! Vẫn còn thời gian !");
									return;
								}else{
									if(arrayTrueMemory[i].indexOf(parseInt($curDiv.get(j).id.replace("imgMemory", ""))) == -1){
										alert("Hãy thử lại ! Vẫn còn thời gian !");
										return;
									}
								}
							}
						}
						var prizeGold = getTimer("#spanTimerMemory")*(islandCode=="phuquoc"?100:60);
						incrementRecordGold(prizeGold);
						alert("Bạn đã hoàn thành nhiệm vụ ! Chúc mừng bạn !\nBạn được thưởng "+prizeGold+" vàng !");
						success();
					};
					setTimer("#spanTimerMemory", attr.time);
					$("#btnStartTimerMemory").click(function(){
						$("#btnStartTimerMemory").hide();
						$("#divMemoryWrapper").show();
						startTimer("#spanTimerMemory");
					});
					$("#divMemory, #divStep42Memory").show();
				};
				$("#btnMemoryDoneRemember").click(function(){
					clearInterval(timer);
					hide();
					endTimer();
				});
				btnMemoryDonePlayClick = false;
				$("#btnMemoryDonePlay").click(function(){
					btnMemoryDonePlayClick = true;
					endTimer();
				});
				$("#btnStartTimerMemoryRemember").click(function(){
					$("#btnStartTimerMemoryRemember").hide();
					$("#divMemoryRememberWrapper").show();
					startTimer("#spanTimerMemoryRemember");
				});
				$("#divMemory, #divStep41Memory").show();
				nextStep();
			});
		}
		answerQuestion("Thử Tài Trí Nhớ");
        nextStep();
	});

	//Script for Fishing
	$("#btnNextStep1Fishing").click(function(){
		hide();
		if(confirm("Cần trả 300 vàng để mua bộ dụng cụ đánh cá !\nBạn có muốn tiếp tục ?")){
			if(decrementGold(300)){
		        $("#divFishing, #divStep2Fishing").show();
				nextStep();
				items = {
					x2gold: false,
					x3gold: false,
					x2goldFish: false,
					add10s: false,
					add20s: false,
					add1trueAnswer: false
				};
				itemsPrice = {
					x2gold: 500,
					x3gold: 2500,
					x2goldFish: 1000,
					add10s: 300,
					add20s: 700,
					add1trueAnswer: 300
				};
			}else{
				alert("Bạn không có đủ 300 vàng để mua bộ dụng cụ đánh cá !");
				fail();
			}
		}else{
			fail();
		}
	});

	$("#btnNextStep2Fishing").click(function(){
		endTimer = function(){
			$("#btnDoneAnswer").unbind("click");
			var count = countCorrectAnswer();
			$("#btnDoneAnswer").attr("value", "Vào Chơi");
			$("#btnDoneAnswer").click(function(){
				var message = "Bạn đã trả lời đúng "+count+" câu hỏi !";
				attr = {
					time: 20,
					goldFish: 2,
					jellyFish: 5,
					multiplier: 1
				};
				switch(count){
					case 0:
						attr.jellyFish += 5;
	                    message += "\nBạn bị phạt tăng 5 con sứa !";
						break;
					case 1:
						attr.jellyFish += 3;
	                    message += "\nBạn bị phạt tăng 3 con sứa !";
						break;
					case 2:
						attr.goldFish += 1;
	                    message += "\nBạn được thưởng tăng 1 con cá vàng !";
						break;
					case 3:
						attr.jellyFish -= 1;
						attr.goldFish += 2;
	                    message += "\nBạn được thưởng giảm 1 con sứa và tăng 2 con cá vàng !";
						break;
					case 4:
						attr.jellyFish -= 1;
						attr.goldFish += 3;
	                    message += "\nBạn được thưởng giảm 1 con sứa và tăng 3 con cá vàng !";
						break;
					case 5:
						attr.jellyFish -= 3;
						attr.goldFish += 5;
	                    message += "\nBạn được thưởng giảm 3 con sứa và tăng 5 con cá vàng !";
						break;
				}
				if(items.add10s){
					attr.time += 10;
				}
				if(items.add20s){
					attr.time += 20;
				}
				if(items.x2goldFish){
					attr.goldFish *= 2;
				}
				if(items.x2gold){
					attr.multiplier = 2;
				}
				if(items.x3gold){
					attr.multiplier = 3;
				}
				if(islandCode == "baicau2"){
					attr.jellyFish *= 2;
					attr.multiplier *= 2;
				}
				alert(message);
				hide();
				fishingGame.init("divFishingPlay");
				$("#divFishing, #divStep4Fishing").show();
				nextStep();
			});
		}
		answerQuestion("Câu Cá");
        nextStep();
	});

	//Script for Flip Image
	$("#btnNextStep1FlipImage").click(function(){
		hide();
		if(confirm("Cần trả 300 vàng để làm nhiệm vụ !\nBạn có muốn tiếp tục ?")){
			if(decrementGold(300)){
		        $("#divFlipImage, #divStep2FlipImage").show();
				nextStep();
				items = {
					x2gold: false,
					x3gold: false,
					add20s: false,
					add40s: false,
					add1trueAnswer: false
				};
				itemsPrice = {
					x2gold: 1000,
					x3gold: 4000,
					add20s: 1200,
					add40s: 3000,
					add1trueAnswer: 500
				};
			}else{
				alert("Bạn không có đủ 300 vàng để làm nhiệm vụ !");
				fail();
			}
		}else{
			fail();
		}
	});

	$("#btnNextStep2FlipImage").click(function(){
		endTimer = function(){
			$("#btnDoneAnswer").unbind("click");
			var countTrueAnswer = countCorrectAnswer();
			$("#btnDoneAnswer").attr("value", "Vào Chơi");
			$("#btnDoneAnswer").click(function(){
				var message = "Bạn đã trả lời đúng "+countTrueAnswer+" câu hỏi !";
				attr = {
					time: 30,
					multiplier: 1
				};
				switch(countTrueAnswer){
					case 0:
						attr.time -= 15;
	                    message += "\nBạn bị phạt giảm 15 giây làm nhiệm vụ !"
						break;
					case 1:
						attr.time += 5;
	                    message += "\nBạn được thưởng 5 giây làm nhiệm vụ !"
						break;
					case 2:
						attr.time += 15;
	                    message += "\nBạn được thưởng 15 giây làm nhiệm vụ !"
						break;
					case 3:
						attr.time += 25;
	                    message += "\nBạn được thưởng 25 giây làm nhiệm vụ !"
						break;
					case 4:
						attr.time += 35;
	                    message += "\nBạn được thưởng 35 giây làm nhiệm vụ !"
						break;
					case 5:
						attr.time += 45;
	                    message += "\nBạn được thưởng 45 giây làm nhiệm vụ !"
						break;
				}
				if(items.add20s){
					attr.time += 20;
				}
				if(items.add40s){
					attr.time += 40;
				}
				if(items.x2gold){
					attr.multiplier = 2;
				}
				if(items.x3gold){
					attr.multiplier = 3;
				}
				alert(message);
				hide();
				arrayRandom = [];
				var i;
				while(arrayRandom.length < 16){
					var num = getRandomInt(8);
					var count = 0;
					var flag = true;
					for(i=0; i<arrayRandom.length; i++){
						if(arrayRandom[i] == num){
							count++;
						}
						if(count == 2){
							flag = false;
							break;
						}
					}
					if(flag){
						arrayRandom.push(num);
					}
				}
				flipedImage = 0;
				var defaultImage = "image/game/flipImage/"+islandCode+"/default.jpg";
				for(i=0; i<arrayRandom.length; i++){
					var $img = $("<img />");
					$img.attr("id", "imgFlipImage"+i);
	                $img.attr("src", defaultImage);
					$img.click(function(){
						var thisClass = $(this).attr("class");
						if((thisClass==undefined) || (thisClass=="")){
							var imgNo = parseInt(this.id.replace("imgFlipImage", ""));
							$(this).attr("class", "opened");
							this.src = this.src.replace("default", arrayRandom[imgNo]);
							if(flipedImage == 0){
								flipedImage = arrayRandom[imgNo];
							}else{
								if(flipedImage == arrayRandom[imgNo]){
									$(this).unbind("click");
									setTimeout(function(){
										$("#divFlipImagePlay span img[class='opened']").attr("class", "disappear")
											.attr("src", "image/game/flipImage/disappear.png");
										if($("#divFlipImagePlay span img[class='disappear']").length == 16){
											clearInterval(timer);
											var prizeGold = getTimer("#spanTimerFlipImage")*60*attr.multiplier;
											incrementRecordGold(prizeGold);
											alert("Bạn đã hoàn thành nhiệm vụ !\nBạn được thưởng "+prizeGold+" vàng !");
											success();
										}
									}, 200);
								}else{
		                        	setTimeout(function(){
										$("#divFlipImagePlay span img[class='opened']").attr("class", "").attr("src", defaultImage);
									}, 200);
								}
								flipedImage = 0;
							}
						}
					});
					$("#divFlipImagePlay").append($("<span />").append($img));
				}
				endTimer = function(){
					alert("Bạn đã không hoàn thành nhiệm vụ !");
					fail();
				};
				$("#btnStartTimerFlipImage").click(function(){
					$("#btnStartTimerFlipImage").hide();
					$("#divFlipImagePlay").show();
					startTimer("#spanTimerFlipImage");
				});
				setTimer("#spanTimerFlipImage", attr.time);
				$("#divFlipImage, #divStep4FlipImage").show();
				nextStep();
			});
		}
		answerQuestion("Lật Hình");
        nextStep();
	});

	//Script for Sort
	$("#btnNextStep1Sort").click(function(){
		hide();
		if(confirm("Cần trả 500 vàng để làm nhiệm vụ !\nBạn có muốn tiếp tục ?")){
			if(decrementGold(500)){
				setTimer("#spanTimerRememberSort", 15);
				beforeEndTimer = function(){
					hide();
				};
				endTimer = function(){
					beforeEndTimer = function(){
					};
					setTimer("#spanTimerSort", 60);
					endTimer = function(){
						if(!btnDoneSortClick){
							alert("Bạn đã không hoàn thành nhiệm vụ !");
							fail();
							return;
						}
						btnDoneSortClick = false;
						var i, j;
						for(i=0; i<2; i++){
							var $ul = $("#divDoSort ul.sortable"+(i+1)+" li");
							var oldID = parseInt($ul.get(0).id.replace("liSort", ""));
							for(j=1; j<5; j++){
								var newID = parseInt($ul.get(j).id.replace("liSort", ""));
								if(newID < oldID){
									alert("Hãy thử lại ! Vẫn còn thời gian !");
									return;
								}
								oldID = newID;
							}
						}
						var prizeGold = getTimer("#spanTimerSort")*500;
						incrementRecordGold(prizeGold);
						alert("Bạn đã hoàn thành nhiệm vụ ! Chúc mừng bạn !\nBạn được thưởng "+prizeGold+" vàng !");
						success();
					};
					$("#btnStartSort").click(function(){
						$("#btnStartSort").hide();
						$("#divDoSort").show();
						startTimer("#spanTimerSort");
					});
					btnDoneSortClick = false;
					$("#btnDoneSort").click(function(){
						btnDoneSortClick = true;
						endTimer();
					});
					$("#divDoSort .sortable1, #divDoSort .sortable2").sortable({
						placeholder: "ui-state-highlight",
						containment: "#divDoSort #content"
					});
					$("#divSort, #divStep22Sort").show();
				};
				$("#btnStartRememberSort").click(function(){
					$("#btnStartRememberSort").hide();

                    var arrSortData = [
						[
							"Đảo Cái Bầu",
							"Đảo Cát Bà",
							"Đảo Bạch Long Vĩ",
							"Đảo Cồn Cỏ",
							"Cù Lao Chàm",
							"Đảo Lý Sơn",
							"Đảo Song Tử Tây",
							"Đảo Phú Quý",
							"Đảo Phú Quốc",
							"Hòn Rái",
							"Côn Đảo",
							"Hòn Khoai"
						],
						[
							"Đảo Cồn Cỏ",
							"Đảo Lý Sơn",
							"Côn Đảo",
							"Đảo Cát Bà",
							"Đảo Phú Quốc"
						]
					];
					var i, j;
					var arrSort = [[], []];
					for(i=0; i<2; i++){
						while(arrSort[i].length < 5){
							var num = getRandomInt(arrSortData[i].length)-1;
							if(arrSort[i].indexOf(num) == -1){
								arrSort[i].push(num);
							}
						}
						for(j=0; j<arrSort[i].length; j++){
							var $span = $("<span class=\"ui-icon ui-icon-arrowthick-2-n-s\">");
							var $li = $("<li class=\"ui-state-default\" />");
							$li.append($span);
							$li.append(arrSortData[i][arrSort[i][j]]);
							$li.attr("id", "liSort"+arrSort[i][j]);
							$("#divDoSort .sortable"+(i+1)).append($li);
						}
						arrSort[i].sort(function(a, b){
							return (a > b);
						});
						for(j=0; j<arrSort[i].length; j++){
							var $li = $("<li class=\"ui-state-default\" />").html(arrSortData[i][arrSort[i][j]]);
							$("#divRememberSort .sortable"+(i+1)).append($li);
						}
					}
					$("li").disableSelection();
					$("#btnDoneSortRemember").click(function(){
						clearInterval(timer);
						hide();
						endTimer();
					});

					$("#divRememberSort").show();
					startTimer("#spanTimerRememberSort");
				});
		        $("#divSort, #divStep21Sort").show();
				nextStep();
			}else{
				alert("Bạn không có đủ 500 vàng để làm nhiệm vụ !");
				fail();
			}
		}else{
			fail();
		}
	});

	//Script for Shipwreck
	if(localStorage.currentShipID != undefined){
		shipID = localStorage.currentShipID;
		localStorage.removeItem("currentShipID");
	}
	$("#btnStartShipwreck").click(function(){
		$("#divAnswerQuestion .header").append($("<span class=\"wreck\">Lỗ thủng hiện tại: </span>"));
		$("#divAnswerQuestion .header").append($("<span class=\"wreck\" id=\"spanWrack\"></span>"));
		answerQuestion("Thủng Thuyền");

		beforeEndTimer = function(){
			return false;
		};
		currentQuestion = 0;
		currentWreck = getRandomInt(3);
		$("#spanWrack").html(currentWreck);
		endTimer = function(){
			$selectedAnswer = $("#divAnswerQuestion"+currentQuestion+" input[type='radio']:checked");
	        if($selectedAnswer.get(0) != undefined){
				if(parseInt($selectedAnswer.attr("class").replace("answer", "")) == answers[currentQuestion]){
					currentWreck -= 1;
				}else{
					currentWreck += 1;
				}
	        }else{
	        	currentWreck += 1;
	        }
			$("#spanWrack").html(currentWreck);
			if(currentWreck >= 7){
				window.onbeforeunload();
				fail();
			}
            currentQuestion++;
			if(currentWreck==0){
				$.ajax({
		    		url: "AJAXSubmit.aspx",
					type: "POST",
		    		data: {
			    		CurrentShip: shipID
					}
				});
				alert("Bạn đã vá thuyền thành công !");
				success();
			}else{
				if(currentQuestion==5){
					window.onbeforeunload();
					fail();
				}else{
					setTimer("#spanTimerQuestion", 15);
					startTimer("#spanTimerQuestion");
					$("#divQuestion span.question, #divQuestion div.answer").hide();
					$($("#divQuestion span.question").get(currentQuestion)).show();
					$($("#divQuestion div.answer").get(currentQuestion)).show();
				}
			}
		};
		setTimer("#spanTimerQuestion", 15);
		$("#btnStartTimerQuestion").click(function(){
			$("#divQuestion span.question, #divQuestion div.answer").hide();
			$($("#divQuestion span.question").get(currentQuestion)).show();
			$($("#divQuestion div.answer").get(currentQuestion)).show();
			$(".wreck").show();
		});

		nextStep();
		nextStep();
	});
	$("#btnCancelShipwreck").click(function(){
		window.onbeforeunload();
		fail();
	});
});