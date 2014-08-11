$(document).ready(function(){

  // ACCORDION
  $('#accordion > ul > li > a').click(function() {
    var checkElement = $(this).next();
    if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
      $(this).closest('li').removeClass('active');
      checkElement.slideUp('normal');
    }
    if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
      $('#accordion ul ul:visible').slideUp('normal');
      checkElement.slideDown('normal');
    }

  });
});