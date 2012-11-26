jQuery.noConflict();
(function($){
	$(window).load(function() {
		$('#slider').nivoSlider();
		if(window.location.pathname == "/" || window.location.pathname == "/users/sign_in" ){
			$('html, body').animate({
			    scrollTop: $(".big-content").offset().top
			}, 500);
		}
		else {
			$('html, body').animate({
				    scrollTop: $("#menu-bar").offset().top
				}, 250);	
		}
	});
})(jQuery);