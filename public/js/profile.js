$(function(){
  $(".question-body, .question-answer, .best-answer").hide();
    $(".show-more").on('click', function(event) {
    event.preventDefault();
    $(this).siblings("li, button").show()
  });
});
