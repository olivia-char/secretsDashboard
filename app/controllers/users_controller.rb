class UsersController < ApplicationController


  def create
  	@user = User.new(newUser_params)
  	if @user.save 
      session[:user_id] = @user.id
  		redirect_to '/sessions/new'
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to '/users/new'
  	end
  end

  def edit
  end

  private
  	def newUser_params
  		params.require(:user).permit(:email, :name, :password, :password_confrimtaion)
  	end
end
