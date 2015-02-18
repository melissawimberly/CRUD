
# ############################ INDEX ######################################
get '/' do
  redirect '/skatelogs'
end

get '/skatelogs' do
  @skatelogs = Skatelog.all
  erb :index
end

########## Add a new skatelog ####################
get '/skatelogs/new' do
  @skatelog = Skatelog.all
  erb :new
end


########## Create a new skatelog ####################
post '/skatelogs' do
  params[:skatelog][:user_id] = current_user.id
  #you have to do this bc otherwise these will be empty params in the field
  skatelog = Skatelog.create(params[:skatelog]) 
  
  # now i don't need this bc i already set the user id
  # skatelog.user = User.find(session[:id])
  
  redirect '/'
  # the form should be called create
end


########## display a specific skatelog ####################
get '/skatelogs/:id' do
  # 
end

########## show the form to edit a skatelog ####################
get '/skatelogs/:id/edit' do
  @skatelog = Skatelog.find(params[:id])
  erb :edit_skatelog
end

########## update a specific skatelog ####################
put '/skatelogs/:id' do

  skatelog = Skatelog.find(params[:id])

  if session[:id] == skatelog.user.id
    begin
      Skatelog.find(params[:id]).update_attributes(params[:skatelog])
      redirect '/'
    rescue
      404
    end
  end
end


########## delete a specific skatelog ####################
delete '/skatelogs/:id' do
  # delete a specific skatelog
  # erb :destroy

  skatelog = Skatelog.find(params[:id])
  skatelog.destroy

  redirect '/'
end
