class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by :username => params[:email]
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
