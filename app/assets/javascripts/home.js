jQuery.noConflict();
(function($){
	$(document).ready(function() {
		$('#slider').nivoSlider();
		if(window.location.pathname == "/" || window.location.pathname == "/users/sign_in" ){
			$('html, body').animate({
			    scrollTop: $(".big-content").offset().top
			}, 500);
		}
		else {
			$('html, body').animate({
				    scrollTop: $("#main").offset().top
				}, 250);	
		}
	});
})(jQuery);