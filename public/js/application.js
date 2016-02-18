$(document).ready(function(){

  // GET answer form
  $('.post_answer').on('click', 'a', function(e){
    e.preventDefault();
    var request = $.ajax({
      type: "GET",
      url: $(this).attr('href')
    });
    request.done(function(data) {
      // append to whatever class the answers are in
      $('footer').before(data);
    });
  });

  // POST answer
  $('#new-answer').on('submit', function(e) {
    e.preventDefault();
    var request = $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize()
    });
    request.done(function(data) {
      // append answer to wherever
      var xyz = data;
    });
  });

  // comment form





  // vote arrows



});