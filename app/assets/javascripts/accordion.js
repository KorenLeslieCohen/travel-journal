$(document).ready(function () {

    // ACCORDION
    $('#accordion ul ul li:odd').addClass('odd');
    $('#accordion ul ul li:even').addClass('even');
    $('#accordion > ul > li > a').click(function () {
        var $checkElement = $(this).next();
        if ($checkElement.is('ul') && $checkElement.is(':visible')) {
            $(this).closest('li').removeClass('active');
            $checkElement.slideUp('normal');
        } else {
            $checkElement.slideDown('normal');
        }
    });
});