class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:user][:username],
      params[:user][:password])
    if @user
      log_in(@user)
      render :show
    else
      render json: ["Invalid credentials"], status: 401
    end
  end

  def destroy
    if logged_in?
      logout
      render json: {}
    else
      render json: ["No current_user"], status: 404
    end
  end

end
