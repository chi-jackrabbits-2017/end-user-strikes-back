$(document).ready(function() {
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
  console.log(that.href);
  $.ajax({
    url: that.href,
    type: 'POST'
  })
  .done(function(voteCount){
    console.log(that);
  };
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
    window.location.replace(jsonResponse.redirect)
  });
};
