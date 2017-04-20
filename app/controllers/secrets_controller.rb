class SecretsController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
  	@secrets = Secret.all 
  end


  def create
  	@users = session[:user_id]
  	@secrets = Secret.new(secret_params)
  	if @secrets.save
  		redirect_to "/users/#{@users}"
  	else
  		flash[:errors] = @secret.errors.full_messages
  		redirect_to "/users/#{@users}"
  	end
  end

  def destroy
  	@user = session[:user_id]
 	Secret.find(params[:id]).destroy
 	redirect_to "/users/#{@user}"
  end

  private
  	def secret_params
  		params.require(:secret).permit(:content).merge(user: User.find(session[:user_id])) 
  	end
end
