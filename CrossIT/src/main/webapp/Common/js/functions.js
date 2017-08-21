var pContainerHeight = $('.home').height();

$(window).scroll(function(){

  var wScroll = $(this).scrollTop();

  if (wScroll <= pContainerHeight) {

    $('.logo').css({
      'transform' : 'translate(0px, '+ wScroll /2 +'%)'
    });

    $('.back-bird').css({
      'transform' : 'translate(0px, '+ wScroll /4 +'%)'
    });

    $('.fore-bird').css({
      'transform' : 'translate(0px, -'+ wScroll /40 +'%)'
    });

  }


  // Landing Elements
  // if(wScroll > $('.pic').offset().top - ($(window).height() / 1.5)) {

  //   $('.clothes-pics figure').each(function(i){

  //     setTimeout(function(){
  //       $('.clothes-pics figure').eq(i).addClass('is-showing');
  //     }, (700 * (Math.exp(i * 0.14))) - 700);
  //   });

  // }

  //   if(wScroll > $('.pic3').offset().top - ($(window).height() /0.5)) {

  //   $('.clothes-pics figure').each(function(i){

  //     setTimeout(function(){
  //       $('.clothes-pics figure').eq(i).addClass('is-showing');
  //     }, i*150);
  //   });

  // }

// transition: all 0.3s ease-in-out

  if(wScroll > $('.blog-posts').offset().top - $(window).height()){

    var offset = (Math.min(0, wScroll - $('.blog-posts').offset().top +$(window).height() - 270)).toFixed();

    $('.post-1').css({'transform': 'translate('+ offset +'px, '+ Math.abs(offset * 0.3) +'px)'});

    $('.post-2').css({'transform': 'translate('+ Math.abs(offset * 0.3) +'px, '+ offset +'px)'});

    $('.post-3').css({'transform': 'translate('+ Math.abs(offset * 0.3) +'px, '+ -offset +'px)'});

    $('.post-4').css({'transform': 'translate('+ Math.abs(offset) +'px, '+ Math.abs(offset * 0.3) +'px)'});

  }

});
  // Promoscope
  // if(wScroll > $('.large-window').offset().top - $(window).height()){

  //   $('.large-window').css({'background-position':'center '+ (wScroll - $('.large-window').offset().top) +'px'});

  //   var opacity = (wScroll - $('.large-window').offset().top + 400) / (wScroll / 5);

  //   $('.window-tint').css({'opacity': opacity});

  // }


  // Floating Elements

  // if(wScroll > $('.blog-posts').offset().top - $(window).height()){

  //   var offset = (Math.min(0, wScroll - $('.blog-posts').offset().top +$(window).height() - 350)).toFixed();

  //   $('.post-1').css({'transform': 'translate('+ offset +'px, '+ Math.abs(offset * 0.2) +'px)'});

  //   $('.post-3').css({'transform': 'translate('+ Math.abs(offset) +'px, '+ Math.abs(offset * 0.2) +'px)'});

  // }
// });
