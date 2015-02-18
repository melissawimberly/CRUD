
######################### LOGIN ###########################################
get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by( username: params[:user][:username] )
  skatelogs = Skatelog.all
  if user.try(:authenticate, params[:user][:password])
    session[:id] = user.id

    if request.xhr?
      erb :'_partials/_auth', layout: false
    end
  else
    return 401
    # redirect '/signup'
  end
end

######################### SIGNUP ###########################################

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.create(params[:user])

  if user.save
    session[:id] = user.id
    redirect '/'
  else
    redirect '/signup'
  end
end

######################### LOGOUT ###########################################

get '/logout' do
  session[:id] = nil
  redirect '/'
end
