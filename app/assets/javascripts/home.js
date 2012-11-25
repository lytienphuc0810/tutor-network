$(window).load(function() {
	$('#slider').nivoSlider();
	$('html, body').animate({
	    scrollTop: $(".big-content").offset().top
	}, 500);
});
