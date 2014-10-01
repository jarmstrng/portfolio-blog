get '/' do
  erb :index
end

#======= Authentication ============

get '/login' do
	erb :'partials/_login'
end

post '/login' do
	@user = User.find_by(email: params[:email])

	if @user.password == params[:password]
		session[:current_user] = @user.id
		redirect to "/"
	else
			session[:login_error] = "Invalid email/password"
			redirect to "/"
		end
end

get '/logout' do
	session[:current_user] = nil
	erb :index
end