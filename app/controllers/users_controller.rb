class UsersController < ApplicationController

  def create
      @user = User.new(user_params) # fill this out
      if @user.save
        flash[:success] = "Login success #{@user.name}"
        session[:user_id] = @user.id
        redirect_to users_path # create user, let user in and redirect to /users
      else
        flash[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
        redirect_to root_path
      end
  end

  def new
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
