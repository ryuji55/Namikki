$(window).on('scroll', function() {
    scrollHeight = $(document).height();
    scrollPosition = $(window).height() + $(window).scrollTop();
    if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.01) {
          $('.jscroll').jscroll({
            contentSelector: '.board-list',
            nextSelector: 'span.next:last a'
          });
    }
});
