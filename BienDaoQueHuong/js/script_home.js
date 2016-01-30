$(document).ready(function(){
    /*jwplayer("divVideo").setup({
    	flashplayer: "media/jwplayer.flash.swf",
        file: "media/intro.mp4",
        image: "media/intro.jpg",
		width: 520,
		height: 292,
		autostart: true
    });*/
	$("#aQuiz").smoothScroll();
	$("#imgPlay").mouseenter(function(){
		$("#imgPlay").attr("src", "image/play_hover.png");
	}).mouseleave(function(){
		$("#imgPlay").attr("src", "image/play.png");
	});
	$("#aQuiz").click(function(){
		if($("#divVideo iframe").attr("src")=="http://www.youtube.com/embed/_ZYIZd9Sox4?rel=0&autoplay=1"){
			$("#divVideo iframe").attr("src", "http://www.youtube.com/embed/_ZYIZd9Sox4?rel=0&autoplay=0")
		}
	});
});