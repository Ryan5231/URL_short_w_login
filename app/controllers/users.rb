get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/createaccount' do

  erb :createaccount, :layout => false
end

post '/create_account' do
  User.create(params)

  redirect '/'
end

get '/login' do
 erb :login
end


post '/login' do
  p "heeeelllloooooo"
  email = params[:user_email]
  ryan  = params[:user_password]

  user = User.authenticate(email, ryan)

  if user
    session[:id] = user.id
    redirect "/user/#{user.id}"
  else
    erb :index
  end
end

get '/user/:user' do |user|
  @user = User.find(session[:id])
  erb :welcome
end

get '/logout' do
  session.clear

  erb :index
end