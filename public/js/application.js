$(document).ready(function() {
  $('.question-form-post-button').on('click', function(event){
    event.preventDefault();
    $(this).addClass('hide');
    $('.post-question-form').removeClass('hide');
  });

  $('.questions-container').on('click', '.question-post-button', function(event){
    event.preventDefault();

    var questionInfo = $(this).closest('form').serialize();
    $.ajax({
      method: "POST",
      url: "/questions",
      data: questionInfo
    })
    .done(function(response){
      $('.questions-container').prepend(response);
      $('.post-question-form').addClass('hide');
      $('.question-form-post-button').removeClass('hide');
    })
    .fail(function(response){
      $('.questions-container').prepend(response.responseText);
    })
  })
  $('.questions-container').on('click', '.delete-button', function(event){
    event.preventDefault();
    var question = $(this).closest('.question-box');
    var questionId = $(this).closest('form').attr('action');

    $.ajax({
      method: "DELETE",
      url: questionId
    }).done(function(response){
      $(question).remove();
    })
  })

  // Login Link Listener
  $('a#login').on('click', function(e){
    e.preventDefault();
    if ($('form#login-form').is(":visible")){
      // This catches the action if the Login form is already fetched to reduce
      // Server load.
      // This may be considered a work around here.
    }else{
      getLoginForm();
    }
  });

  // Login form submission listener
  $('div#form-catcher').on('submit', '#login-form', function(e){
    e.preventDefault();

    var data = $(this).serialize();
    loginUserIfValid(data)
  })

  // Logout listener
  $('a#logout').on('click', function(e){
    e.preventDefault();

    // Sends the logout request to the HREF of the link being clicked.
    logoutUser(this.href);
  });

  $('.questions-container').on('click', '.upvote-button', createUpvote);
  $('.questions-container').on('click', '.downvote-button', createDownvote);

});

var createUpvote = function(e){
  e.preventDefault();
  var that = this;
  createVote(true, that);
};

var createDownvote = function(e){
  e.preventDefault();
  var that = this;
  createVote(false, that);
};

var createVote = function(voteFlag, that){

  // Removes any 'button clicked' styles from the children of a question
  // Method chained together for readability.
  $(that).closest('.button-holder')
  .children()
  .removeClass('vote-button-clicked');

  // This will set the button color if it's been clicked
  $(that).addClass('vote-button-clicked');

  $.ajax({
    url: that.href,
    type: 'POST',
    data: {vote_flag: voteFlag}
  })
  .done(function(voteCount){
    var $question = $(that).closest('.question-box');
    $question.find('.vote-count').html(voteCount)
  });
}

var getLoginForm = function(){
  $.ajax({
    type: 'GET',
    url: '/sessions/new'
  })
  .done(function(form){
    // Sets the inner HTML of our catcher to the form served back.
    $('div#form-catcher').html(form);
  })
  .fail(function(response){
    (responseresponseText);
    $('div#form-catcher').html(response.responseText);
  });
};

// Called from above. Logs in users.
var loginUserIfValid = function(data){
  $.ajax({
    type: 'POST',
    url: '/sessions',
    data: data
  })
  .done(function(jsonResponse){
    // This will redirect the user to home when the response code is valid
    window.location.replace(jsonResponse.redirect);
  })
  .fail(function(response){
    // Resets the form and includes the errors this time.
    $('#form-catcher').html(response.responseText);
  });
}

// Called from above. Logs outs users.
var logoutUser = function(url){
  $.ajax({
    type: 'DELETE',
    url: url
  })
  .done(function(jsonResponse){
    window.location.replace(jsonResponse.redirect);
  });
};

