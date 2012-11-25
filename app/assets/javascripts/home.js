jQuery.noConflict();
(function($){
	$(document).ready(function() {
		$('#slider').nivoSlider();
		if(window.location.pathname == "/" || window.location.pathname == "/users/sign_in" ){
			$('html, body').animate({
			    scrollTop: $(".big-content").offset().top
			}, 500);
		}
	});
})(jQuery);