//= require jquery

$(window).load(function(){
  $('.steps > li > div img').each(function(idx, elem){
  	var link = $('<a href="' + elem.src + '"/>').fancybox();
		$(elem).wrap(link);
	});
});