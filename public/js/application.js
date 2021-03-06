$(document).ready(function(){

  // GET answer form
  $('.post_answer').on('click', 'a', function(e){
    e.preventDefault();
    var link = $(this);
    var request = $.ajax({
      type: "GET",
      url: $(this).attr('href')
    });
    request.done(function(data) {
      // append to whatever class the answers are in
      $('#answers_container').after(data);
      link.hide();
    });
  });

  // POST answer
  $('article').on('submit', "#new-answer", function(e) {
    e.preventDefault();
    var request = $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize()
    });
    request.done(function(data) {
      // append answer to wherever
      $('.errs').remove();
      $('#answers_container').append(data);
      $("article").find("#question-form").hide();
      $(".post_answer").find("a").show();
    });
  });

  // comment form
  $('article').on('click', ".comment-form-link", function(e){
    e.preventDefault();
    var link = $(this);
    var comment_div = $(this).closest('.comments-div')
    var request = $.ajax({
      type: "GET",
      url: $(this).attr('href')
    });
    request.done(function(data) {
      $('.errs').remove();
      $('article').find('#question-form').remove();
      comment_div.find('ul').after(data);
      link.hide();
    });
  });


  // post a comment
  $('article').on('submit', "#new-comment", function(e) {
    e.preventDefault();
    var commentList = $(this).closest('.comments-div');
    var request = $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize()
    });
    request.done(function(data) {
      $('.errs').remove();
      commentList.find('ul').append(data);
      $('article').find("#question-form").remove();
      commentList.find(".comment-form-link").show();
    });
  });



  // activities - show more
  $(".show-all").on('click', function(e) {
    e.preventDefault();
    var content = $(this).closest(".user-content");
    var activityType = content.attr('id');
    var request = $.ajax({
      type: "GET",
      url: $(this).attr('href'),
      data: { activityType: activityType }
    });
    request.done(function(data) {
      content.html(data);
    });

  })


  $('article').on('click', '.arrow-up, .arrow-down', function(e) {
    e.preventDefault();
    var link = $(this).closest('a');
    var request = $.ajax({
      type: "GET",
      url: link.attr('href')
    });
    request.done(function(data){
      link.closest('#vote_question, #vote_answer, #accepted_vote_answer').find('.score').text(data);
    });
  });

});
