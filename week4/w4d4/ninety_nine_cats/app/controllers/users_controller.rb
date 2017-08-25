class UsersController < ApplicationController
  before_action :login_check, only: [:new, :create]

  def new #new user account
    render :new
  end

  def create #new use account in users table
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

  private

  def login_check
    if logged_in?
      redirect_to cats_url
    end
  end
end
