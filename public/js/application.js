$(document).ready(function() {
  $('form').submit(function(e){
    e.preventDefault();

    $.ajax({
      url: '/urls',
      type: 'post',
      data: $(this).serialize()
    }).done(function(links){
      $('.link').html(links);
    });
  });
});
