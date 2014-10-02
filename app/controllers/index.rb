get '/' do
	@articles = Article.all

  erb :index
end

post '/comment/new/:id' do
	@article = Article.find_by(id: params[:id])
	@comment = Comment.create(user_id: session[:current_user], content: params[:content], article: @article)

	if request.xhr?
		erb :"partials/_comment", locals: {comment:@comment}, :layout => false
	else
		redirect "/article/#{@article.id}" 
	end
end

get '/article/:id' do
	@article = Article.find_by(id: params[:id])
	@comments = Comment.where(article_id: params[:id])

	erb :show
end

#======= Authentication ============

get '/login' do
	erb :'partials/_login'
end

post '/login' do
	@user = User.find_by(email: params[:email])

	if @user.password == params[:password]
		session[:current_user] = @user.id
		if request.xhr?
			erb :'partials/_logout_btn', :layout => false
		else
			redirect to "/" unless request.xhr?
		end
	else
			session[:login_error] = "Invalid email/password"
			redirect to "/"
		end
end

get '/signup' do
	erb :'partials/_signup'
end

post '/signup' do
	@user = User.create(email: params[:email], password_digest: params[:password])
	session[:current_user] = @user.id
		
	if request.xhr?
		erb :'partials/_logout_btn', :layout => false
	else
		redirect to "/" unless request.xhr?
	end
end

get '/logout' do
	session[:current_user] = nil
	redirect :"/"
end