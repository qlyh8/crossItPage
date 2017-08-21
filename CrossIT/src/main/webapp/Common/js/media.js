$(document).ready(function(){
if (matchMedia("screen and (max-width: 530px)").matches) {

	  // $('#media-530').removeClass('cross_it');
	$('.cross_it').remove();
	} else {

	  // $('#media-530').addClass('cross_it');
	  $('.cross_it').html();
	}
  });