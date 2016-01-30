function ajax(d){
	$.ajax({
		url: "AJAXSubmit.aspx",
		type: "POST",
		data: d,
		success: function(data){
			result = data.split("|");
			$("#spanGold").html(result[0]);
			$("#spanBank").html(result[1]);
		}
	});
}

$(document).ready(function(){
	ajax({
    	GetGoldBank: "true"
    });
	$("#aQuiz").smoothScroll();
	var shipID = parseInt($("#hidShipID").val());
	if(shipID == -1){
		$("#divBank").show();
		$("#btnShip").show();
		$("#btnTax").show();
		$("#txtBank").focus();
	}
	$("#txtBank").keydown(function(event){
		if( event.keyCode != 8 && event.keyCode != 46 &&
			(event.keyCode < 35 || event.keyCode > 40) && // Arrow keys
			(event.keyCode < 48 || event.keyCode > 57) && // Numbers
			(event.keyCode < 96 || event.keyCode > 105)){ // Keypad numbers
				event.preventDefault();
				return false;
			}
	});
	$("#btnDeposit, #btnWithdraw").click(function(){
		var strGold = $("#txtBank").val();
		var isDeposit = (this.id == "btnDeposit");
		if(strGold == ""){
			alert("Bạn chưa nhập số tiền cần "+(isDeposit?"gửi":"rút")+" !");
		}else{
			var gold = parseInt(strGold);
			if(isDeposit){
				var curGold = parseInt($("#spanGold").html());
				if(gold > curGold){
					alert("Bạn không có đủ "+gold+" vàng để gửi vào ngân hàng !");
				}else{
					$("#txtBank").val("");
	            	ajax({
	            		DepositGold: gold
	            	});
				}
			}else{
				var bankGold = parseInt($("#spanBank").html());
				if(gold > bankGold){
					alert("Bạn không có đủ "+gold+" vàng trong ngân hàng để rút ra !");
				}else{
					$("#txtBank").val("");
					ajax({
	            		WithdrawGold: gold
	            	});
				}
			}
		}
	});
	$("#btnShip").click(function(){
		w = window.open("ship.aspx");
		if(w != undefined){
			w.onload = function(){
				var $w = $(w.document);
				$w.find("#divNotPlaying").hide();
				if($w.find("#hidShipID").val() == "-1"){
					$w.find("#aBack").show();
					$w.find("#divBuyShip").show();
					w.nextStep();
				}else{
					$w.find("#divSaleShip").show();
				}
				window.close();
				self.close();
				window.open("", "_self");
				window.close();
				window.location.href = "about:blank";
				$("body").remove();
			}
		}
	});
	$("#btnTax").click(function(){
		$.ajax({
			url: "AJAXSubmit.aspx",
			type: "POST",
			data: {
				Tax: "true"
			},
			success: function(data){
				result = data.split("|");
				$("#spanGold").html(result[0]);
				$("#spanFlag").html(result[1]).show();
			}
		});
	});
	$("#dialogChangePassword").dialog({
		autoOpen: false,
		width: 350,
		modal: true,
		draggable: false,
		resizable: false,
		buttons: {
			"Đóng": function () {
				$(this).dialog("close");
			}
		}
	});
	$("#aChangePassword").click(function(event){
		event.preventDefault();
		$("#dialogChangePassword").dialog("open");
	});
	$("#btnChangePassword").click(function(event){
		var message = "";
		if($("#txtOldPassword").val() == ""){
			message += "Bạn chưa nhập mật khẩu cũ !\n";
		}else if($("#txtOldPassword").val().length < 6){
			message += "Mật khẩu cũ phải có tối thiểu 6 ký tự !\n";
		}
		if($("#txtNewPassword").val() == ""){
			message += "Bạn chưa nhập mật khẩu mới !\n";
		}else if($("#txtNewPassword").val().length < 6){
			message += "Mật khẩu mới phải có tối thiểu 6 ký tự !\n";
		}
		if($("#txtConfirmNewPassword").val() == ""){
			message += "Bạn chưa xác nhận mật khẩu mới !\n";
		}else if($("#txtConfirmNewPassword").val().length < 6){
			message += "Xác nhận mật khẩu mới phải có tối thiểu 6 ký tự !\n";
		}else if($("#txtConfirmNewPassword").val() != $("#txtNewPassword").val()){
			message += "Mật khẩu mới và xác nhận mật khẩu mới phải giống nhau !\n";
		}
		if(message == ""){
			$.ajax({
				url: "AJAXSubmit.aspx",
				type: "POST",
				data: {
					ChangePassword: $("#txtNewPassword").val(),
					OldPassword: $("#txtOldPassword").val()
				},
				success: function(data){
					if(data == ""){
						alert("Bạn đã đổi mật khẩu thành công !");
						$("#txtOldPassword").val("");
						$("#txtNewPassword").val("");
						$("#txtConfirmNewPassword").val("");
						$("#dialogChangePassword").dialog("close");
					}else{
						alert(data+" !");
					}
				}
			});
		}else{
			alert(message);
		}
	});
	$("#aRestart").click(function(event){
		event.preventDefault();
		if( confirm("ĐỒNG Ý ?\nTài khoản của bạn sẽ trở về như lúc mới đăng ký !")&&
			confirm("ĐỒNG Ý ?") ){
				$.ajax({
					url: "AJAXSubmit.aspx",
					type: "POST",
					async: false,
					data: {
						Restart: "true"
					}
				});
				alert("Đã khởi tạo lại tài khoản");
				window.location.href = "profiles.aspx";
		}
	});
	$("#divPrize .badgeCount > a").click(function(event){
		event.preventDefault();
	});
});