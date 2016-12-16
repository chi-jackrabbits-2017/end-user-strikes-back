get '/sessions/new' do
  if request.xhr?
    # Debugging p statement (Don't ship it)
    p "You hit here!"
    erb :'session/_new', layout: false
  else
    # CHANGE before the project. This shoudn't server anything.
    # Maybe redirect instead of status 404?
    status 404
    ""
  end
end

post '/sessions' do

end
