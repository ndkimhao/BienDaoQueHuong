$(document).ready(function(){
	$("#btnOK").click(function(){
		$.ajax({
			url: "AJAXSubmit.aspx",
			type: "POST",
			data: {
				Flag: "true"
			},
			success: function(data){
				alert("Đã cắm cờ thành công !\nBạn xếp hạng thứ "+data+" !");
				window.location.href = "map.aspx";
			}
		});
	});
	$("#btnCancel").click(function(){
		window.location.href = "map.aspx";
	});
});