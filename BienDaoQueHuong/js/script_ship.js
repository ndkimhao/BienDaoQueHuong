function setBackground(url){
	$("body").css("background", "url('"+url+"')").css("background-size", "cover");
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
			$("#spanGold").html(data.replace("fail", ""));
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
			$("#spanGold").html(data.replace("fail", ""));
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

function saleShip(gold){
	$.ajax({
		url: "AJAXSubmit.aspx",
		type: "POST",
		data: {
			IncrementGold: gold,
			CurrentShip: -1
		},
		success: function(data){
			$("#spanGold").html(data);
		}
	});
}

function buyShip(shipID){
	$.ajax({
		url: "AJAXSubmit.aspx",
		type: "POST",
		data: {
			CurrentShip: shipID
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
		}
	});
}

function nextStep(){
	 $("#menu ul > li.selected").next().andSelf().toggleClass("selected");
}

$(document).ready(function(){
	// Global intitalization
	updateGold();
	var shipID = parseInt($("#hidShipID").val());

	// Script for Sale Ship
	shipPrice = [9000, 25000, 40000, 60000, 80000, 100000, 150000, 300000, 500000, 700000];
//	shipSpeed = [ 10 ,   15 ,   20 ,   25 ,   30 ,   35  ,   40  ,   50  ,   60  ,   70  ];

	var salePrice = shipPrice[shipID]*0.4;
	$("#spanSaleGold").html(salePrice);
	$("#btnSaleShip").click(function(){
        saleShip(salePrice);
		alert("Bạn đã bán thành công chiếc thuyền của bạn với giá "+salePrice+" vàng !");
		$("#divSaleShip").hide();
		$("#aBack").show();
		$("#divBuyShip").show();
		nextStep();
	});
	$("#btnCancelSaleShip").click(function(){
		window.location.href = "map.aspx";
	});

	// Script for Buy Ship
	$(".shelf a img").mouseenter(function(){
		this.src = this.src.replace(".png", "_hover.png");
	}).mouseleave(function(){
		this.src = this.src.replace("_hover.png", ".png");
	}).click(function(event){
		var srcSplited = this.src.split("/");
		var buyShipID = parseInt(String(srcSplited[srcSplited.length-1].replace("_hover.png", "")).replace("ship", ""))-1;
		if(decrementGold(shipPrice[buyShipID])){
			buyShip(buyShipID);
			alert("Bạn đã mua thành công chiếc thuyền với giá "+shipPrice[buyShipID]+" !");
			window.location.href = "map.aspx";
		}else{
			alert("Bạn không có đủ "+shipPrice[buyShipID]+" vàng để mua chiếc thuyền này !");
		}
		event.preventDefault();
		return false;
	});
});