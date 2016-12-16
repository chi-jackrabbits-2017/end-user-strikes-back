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
});

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
    console.log(response.responseText);
    $('div#form-catcher').html(response.responseText);
  });
};
