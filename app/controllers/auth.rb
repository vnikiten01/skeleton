get '/' do
  erb :welcome
end

get '/login' do
  erb :login
end

post '/login' do
	@user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
	if @user
		session[:id]= @user.id
		redirect to('/')
	else
		set_error "Username or Password Incorrect"
		redirect to('/login')
	end
end

get '/sign_up' do
	@user=User.new;
	erb :sign_up
end

post '/sign_up' do
 p @user = User.create(params[:user])
  if @user.id
  	session[:id] = @user.id
  	redirect to('/')
  else
  	set_error('Wrong Email or Password entered')
  	redirect to ('/sign_up')
  # @user = User.create()
	end
end