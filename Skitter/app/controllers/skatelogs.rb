
# ############################ INDEX ######################################
get '/' do
  redirect '/index'
end

get '/index' do
  @skatelogs = Skatelog.all
  erb :index
end

get '/index/skatelogs/new' do
  @skatelog = Skatelog.all
  erb :new
end

# profile
get '/index/users/:id' do
  begin
    @user = User.find( params[:id] )
    erb :show_user
  rescue
    404
  end
end

put '/index/users/:id' do
  begin
    User.find(params[:id]).update_attributes(params[:user])
    redirect "index/users/#{params[:id]}"
  rescue
    404
  end
end

post '/index/users/create' do
  new_user = User.create(params[:user])
  redirect "/users/#{new_squirrel.id}"
end

delete '/index/users/:id' do
  begin
    User.find(params[:id]).destroy
    redirect "/index"
  rescue
  end
end
