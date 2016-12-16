
$(function(){
  $(".question-body, .question-answer, .best-answer").hide();
    $(".show-more").on('click', function(event) {
    event.preventDefault();
    console.log(this)
    $(this).siblings("li, button").show()
  });
});
