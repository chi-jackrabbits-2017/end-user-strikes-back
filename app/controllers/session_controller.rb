get '/sessions/new' do
  if request.xhr?
    # Debugging p statement (Don't ship it)
    # p "You hit here!"
    erb :'session/_new', layout: false, locals: { error: false }
  else
    # CHANGE before the project. This shoudn't server anything.
    # Maybe redirect instead of status 404?
    status 404
  end
end

post '/sessions' do
  # This route should refresh, so I'll have to do some weird stuff here.
  if request.xhr?
    if user = User.validate(params[:user])
      # session[:user_id] = user.id
      content_type :json
      status 200
      {redirect: '/'}.to_json
    else
      status 422
      erb :'session/_new',
          layout: false,
          locals: { error: "Invalid Username/Password Combination." }
    end
  else
    # Again, refer to above
    status 404
  end
end
