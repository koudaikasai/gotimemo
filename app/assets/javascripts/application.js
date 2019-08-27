// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.raty
//= require rails-ujs
//= require activestorage
//= require bootstrap-sprockets
//= require_tree ../../../vendor/assets/javascripts/.


//= require_tree .
$(function(){
$("document").ready(function(){


$("#theTarget").skippr({

	transition : 'fade',

	speed : 1000,

	easing : 'easeOutQuart',

	navType : 'bubble',

	childrenElementType : 'div',

	arrows : true,

	autoPlay : true,

	autoPlayDuration : 5000,

	keyboardOnAlways : true,

	hidePrevious : false
});
});

});



$(function(){
	$('#myfade').hide().fadeIn(2000);
});

$(function(){
	$('#myfade2').hide().fadeIn(3000);
});

$(function(){
	$('#myfade3').hide().fadeIn(4000);
});

$(function(){
	$('#myfade4').hide().fadeIn(5000);
});



$(function(){
var topBtn=$('#pageTop');
topBtn.hide();

$(window).scroll(function(){
  if($(this).scrollTop()>400){
    topBtn.fadeIn();

  }else{
    topBtn.fadeOut();
  }
});


topBtn.click(function(){
  $('body,html').animate({
  scrollTop: 0},500);
  return false;

});
});




$(window).load(function(){
var slide = $('.slideshow');
var i = 0;

slide.find('.item').eq(i).fadeIn(2000).addClass('in');

var total = $('.slideshow .item').length -1;

setInterval(function(){
  if(i < total){
  slide.find('.item').eq(i).addClass('out');
  slide.find('.item').eq(i).removeClass('in');
    j = i;
    i++;
    setTimeout(function(){

      slide.find('.item').eq(i).fadeIn(3500).addClass('in').removeClass('out');
    },1000);

    slide.find('.item').eq(j).fadeOut(4500);
  } else if(i == total){
  slide.find('.item').eq(i).addClass('out');
  slide.find('.item').eq(i).removeClass('in');
    j = i;
    i = 0;
    setTimeout(function(){
      slide.find('.item').eq(i).fadeIn(3500).addClass('in').removeClass('out');
    },1000);
    slide.find('.item').eq(j).fadeOut(4500);
  };

},8000);
});