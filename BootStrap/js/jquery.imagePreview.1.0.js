// JavaScript Document
//copyright c by zhangxinxu 2009-10-17 
//http://www.zhangxinxu.com
/*由于大图绑定在href属性中，故一般而言，需使用a标签的href指向大图。仅支持png,gif,jpg,bmp四种格式的图片。用法是：目标.preview();
例如：<a href="xx.jpg">图片</a>
$("a").preview();就可以了//<p>"+$(this).attr('title')+"</p>
*/
(function($){
	$.fn.preview = function(){
		var xOffset = 10;
		var yOffset = 20;
		var w = $(window).width();
		var h = $(window).height();
		$(this).each(function(){
			$(this).hover(function(e){
				var topY = e.pageY - window.pageYOffset;
				if(/.png$|.gif$|.jpg$|.bmp$/.test($(this).children('img').attr("src"))){
					$("body").append("<div id='preview'><img src='"+$(this).children('img').attr('src')+"' /></div>");
				}else{
					$("body").append("<div id='preview'><div><p>"+$(this).children('img').attr('alt')+"</p></div></div>");
				}
				$("#preview").css({
					position:"absolute",
					padding:"4px",
					border:"1px solid #f3f3f3",
					backgroundColor:"#eeeeee",
					zIndex:1020
				});
				$("#preview > div").css({
					padding:"5px",
					backgroundColor:"white",
					border:"1px solid #cccccc"
				});
				$("#preview > div > p").css({
					textAlign:"center",
					fontSize:"12px",
					padding:"8px 0 3px",
					margin:"0"
				});
				if(e.pageX < w/2){
					$("#preview").css({
						left: e.pageX + xOffset + "px",
						right: "auto"
					}).fadeIn("fast");
				}else{
					$("#preview").css("right",(w - e.pageX + yOffset) + "px").css("left", "auto").fadeIn("fast");	
				}
				if(topY < h/2){
					$("#preview").css({
						top: e.pageY - xOffset + "px",
						bottom: "auto"
					}).fadeIn("fast");
				}else{
					$("#preview").css("bottom",(h - e.pageY + yOffset) + "px").css("top", "auto").fadeIn("fast");	
				}
			},function(){
				$("#preview").remove();
			}).mousemove(function(e){
				var topY = e.pageY - window.pageYOffset;
				if(e.pageX < w/2){
					$("#preview").css("left",(e.pageX + yOffset) + "px").css("right","auto");
				}else{
					$("#preview").css("right",(w - e.pageX + yOffset) + "px").css("left","auto");
				}
				if(topY < h/2){
					$("#preview").css("top",(e.pageY + xOffset) + "px").css("bottom","auto");
				}else{
					$("#preview").css("bottom",(h - e.pageY +yOffset) + "px").css("top","auto");
				}
			});						  
		});
	};
})(jQuery);