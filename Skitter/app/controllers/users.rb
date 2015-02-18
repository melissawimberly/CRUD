# ############################ INDEX ######################################
get '/users' do
	display a list of all users
	erb :user_index
end

########## Add a new user ####################
get '/users/new' do
	erb :users_new
end

########## Create a new user ####################
post '/users' do
	  new_user = User.create(params[:user])
  redirect "/users/#{new_squirrel.id}"
	# create a new photo
	# form to create a new user should be called create_user
end

########## display a specific user ####################
get '/users/:id' do
  display a specific user
  begin
    @user = User.find( params[:id] )
    erb :show_user
  rescue
    404
  end
end

########## show the form to edit a user ####################
get '/users/:id/edit' do
	# should show a form to edit user
	erb :edit_user
end

########## update a specific user ####################
put 'users/:id' do
  # update a specific user
  begin
    User.find(params[:id]).update_attributes(params[:user])
    redirect "index/users/#{params[:id]}"
  rescue
    404
  end
end

########## delete a specific user ####################
delete '/users/:id' do
  begin
    User.find(params[:id]).destroy
    redirect "/index"
  rescue
  end
end