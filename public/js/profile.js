
$(function(){
  $(".question-body, .question-answer").hide();
    $(".show-more").on('click', function(event) {
    event.preventDefault();
    console.log(this)
    $(this).siblings("li").show()
  });
});
