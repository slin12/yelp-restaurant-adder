class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: sessions_params[:username])
    if user && user.authenticate(sessions_params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You've successfully logged in. Welcome!"
      redirect_to restaurants_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.destroy
    flash[:notice] = "You've successfully logged out."
    redirect_to login_path
  end

  private
  def sessions_params
    params.permit(:username, :password)
  end
end
