jQuery.noConflict();
(function($){
	$(document).ready(function() {
		$('#slider').nivoSlider();
		$('html, body').animate({
		    scrollTop: $(".big-content").offset().top
		}, 500);
	});
})(jQuery);