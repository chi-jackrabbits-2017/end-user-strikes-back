
$(function(){
  console.log("Hello!")
  $(".question-body").hide();
  $(".show-more").on('click', function(event) {
    event.preventDefault();
    $(".question-body").show();
  });
});
