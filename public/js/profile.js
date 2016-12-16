$(function(){
  $(".question-body, .question-answer, .best-answer").hide();
    $(".show-more").on('click', function(event) {
    event.preventDefault();
    $(this).siblings("li, button").show()
  });
});

$(function(){
   $(".best-answer").on('click', function(event) {
   var id = $(this).prev()
   var answer_id = id.attr('id')
   console.log(answer_id)


   function setBestAnswer(){
    $.ajax({
      url: '/users/:id/questions/:id',
      type: 'PUT',
      data: {id: answer_id}
    });
  };
});
});
// On 'best answer' button click
  // $.ajax call to PUT to '/questions/:id'
    // Find answer that was clicked
    // Set the routed question's best_answer_id to the clicked_answer.id
    // Send back the form for what a best answer looks like in the request
  // END AJAX CODE
  // .done() CODE
    // prepend the result, delete the answer that was clicked from the DOM
  // END .done()
