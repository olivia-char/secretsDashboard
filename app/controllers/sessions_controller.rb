class SessionsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @secrets = @user.secrets
  
  end

  def new
  end

  def login
  	@user = User.find_by_email(params[:email])

  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		redirect_to "/users/#{@user.id}"
  	else
  		flash[:errors] = ["Incorrect Login Information"]
  		redirect_to '/sessions/new'
  	end
  end

  def destroy
  	reset_session
  	redirect_to '/sessions/new'
  end
end
