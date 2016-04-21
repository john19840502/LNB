class UserController < ApplicationController
   skip_before_action :verify_authenticity_token
   respond_to :html, :json

   def login_confirm
	user = params["user"]
	if User.find_username(user["username"]).authenticate(user["password"])
           render json: @user, status: :ok
    	else
  	   flash[:danger] = 'Invalid email/password'
	   render json: {user: @user.errors, status: :no_content}
	end
   end

   def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :ok
    else
      render json: {user: @user.errors, status: :no_content}
    end
   end 
   
   def logout
      @user = {}     	
      render json: '', status: :ok
   end

  private

  def user_params 
    puts '+++++++++++++++++++++++++++++++'
    puts params["user"]   
    params["user"].delete("password_confirm")
    puts params["user"]
    params.fetch(:user, {}).permit(:username, :password, :email, :phone, :address) 
  end	
	
end
