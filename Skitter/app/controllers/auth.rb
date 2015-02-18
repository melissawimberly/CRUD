
######################### LOGIN ###########################################
# don't need bc of ajax
# get '/login' do
#   erb :login
# end

post '/login' do
  #still use instances bc its just this one
  @user = User.find_by( username: params[:user][:username] )
  # skatelogs = Skatelog.all  this is a whole different model
  if @user.try(:authenticate, params[:user][:password])
    session[:id] = @user.id
    #this is an id method (getter) that active record has made for us
    # user_id is a foreign key on the skatelog table, bc a user has many skatelogs

    if request.xhr?
      erb :'_partials/_auth', layout: false
    end
  else
    return 401
    # redirect '/signup'
  end
end

######################### SIGNUP ###########################################
# # don't need bc of ajax; but do need bc of the signup if/else
# get '/signup' do
#   erb :signup
# end

post '/signup' do
  # a request
  #probs don't use create bc you want to keep it in a temp state, and won't 
  # save it to my db, unless i tell it to this means that they will 
  #this way if they put in unvalid info, it doesnt crash
  # @user = User.create(params[:user])
  @user = User.new(params[:user])

    if @user.save
      session[:id] = @user.id
      redirect '/'
    else
      #if request.xhr?
        # erb :'_partials/_auth', layout: false
      # else
      return 401
      # redirect '/signup'
    # end
  end
end

######################### LOGOUT ###########################################

get '/logout' do
  session[:id] = nil
  redirect '/'
end
