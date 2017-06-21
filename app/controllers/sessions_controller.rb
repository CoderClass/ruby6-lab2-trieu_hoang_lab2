class SessionsController < ApplicationController

  def new
  end

  def create
   if @user = User.find_by(email: params[:session][:email])
     if @user.authenticate(params[:session][:password]) # check if password is correct
       # handle logging in
       session[:user_id] = @user.id
       flash[:success] = "You've login succesfully"
       redirect_to users_path
     else
       flash[:danger] = "invalid email or password"
       render 'new'
       # handle "invalid password"
     end
   else
     flash[:danger] = "User not found"
     render 'new'
     # handle "user not found"

   end
 end

end
