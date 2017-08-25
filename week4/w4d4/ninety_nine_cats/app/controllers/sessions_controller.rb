class SessionsController < ApplicationController
  before_action :login_check, only: [:new, :create]

  def new #new sign in
    render :new
  end

  def create #new session in "sessions" table
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    if @user
      login!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def destroy
    logout!
    redirect_to cats_url
  end

  def login_check
    if logged_in?
      redirect_to cats_url
    end
  end
end
