function endQuiz(){
	window.onbeforeunload = function(){
	};
	window.close();
	self.close();
	window.open("", "_self");
	window.close();
	window.location.href = "about:blank";
}

function setTimer(id, minute, second){
	if(second == undefined){
		setTimer(id, Math.floor(minute/60), minute%60);
	}else{
		$(id).html((minute<10?"0"+minute:minute)+":"+(second<10?"0"+second:second));
	}
}

function parseTimer(minute, second){
	if(second == undefined){
		return parseTimer(Math.floor(minute/60), minute%60);
	}else{
		return (minute<10?"0"+minute:minute)+":"+(second<10?"0"+second:second);
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
		endTimer();
	}
}

function endTimer(){
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

function nextStep(){
	 $("#menu ul > li.selected").next().andSelf().toggleClass("selected");
}

$(document).ready(function(){
	window.onbeforeunload = function(){
		$.ajax({
			url: "AJAXSubmit.aspx",
			type: "POST",
			data: {
				QuizCode: quizCode,
				QuizTime: -1,
				QuizPoints: -1
			}
		});
	};

	var currentQuestion = 0;
	var correctQuestion = 0;
	setTimer("#spanTimerQuestion", 600);
	endTimer = function(){
		$.ajax({
			url: "AJAXSubmit.aspx",
			type: "POST",
			data: {
				QuizCode: quizCode,
				QuizTime: 600,
				QuizPoints: correctQuestion
			}
		});
		alert("Bạn đã hết thời gian làm bài !\nSố câu đúng: "+correctQuestion+"/15 câu.\nThời gian: 20:00.");
		endQuiz();
	};
	$("#btnStartTimerQuestion").click(function(){
		$("#btnStartTimerQuestion").hide();
		$("#divWrapperQuestion, #btnDoneAnswer").show();
		startTimer("#spanTimerQuestion");
		displayQuestion();
		$(".container").show();

		$("#divQuestion span.question, #divQuestion div.answer").hide();
		$($("#divQuestion span.question").get(currentQuestion)).show();
		$($("#divQuestion div.answer").get(currentQuestion)).show();
	});
	$("#btnDoneAnswer").click(function(){
		$selectedAnswer = $("#divAnswerQuestion"+currentQuestion+" input[type='radio']:checked");
        if($selectedAnswer.get(0) != undefined){
			if(parseInt($selectedAnswer.attr("class").replace("answer", "")) == answers[currentQuestion]){
				correctQuestion++;
			}
        }
		if(currentQuestion == 14){
			clearInterval(timer);
			$.ajax({
				url: "AJAXSubmit.aspx",
				type: "POST",
				data: {
					QuizCode: quizCode,
					QuizTime: 600-getTimer("#spanTimerQuestion"),
					QuizPoints: correctQuestion
				}
			});
			alert("Bạn đã hoàn thành bài trắc nghiệm !\nSố câu đúng: "+correctQuestion+"/15 câu.\nThời gian: "+parseTimer(600-getTimer("#spanTimerQuestion"))+".");
			endQuiz();
		}else{
			currentQuestion++;
			$("#divQuestion span.question, #divQuestion div.answer").hide();
			$($("#divQuestion span.question").get(currentQuestion)).show();
			$($("#divQuestion div.answer").get(currentQuestion)).show();
		}
	});

	var quizCode = prompt("Bạn hãy nhập mã làm bài (nếu không có thì để trống):", "");
	if(quizCode == null){
		quizCode = "";
	}
	$.ajax({
		url: "AJAXSubmit.aspx",
		type: "POST",
		data: {
			QuizCodeCheck: quizCode
		},
		success: function(data){
			if(data == "ok"){
				nextStep();
				$("#divAnswerQuestion").show();
			}else{
				alert("Mã làm bài không hợp lệ !");
				endQuiz();
			}
		}
	});
});