class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create user_params
    redirect_to root_path
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def updated
    user = User.find params[:id]
    user.update user_params
    redirect_to user
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to root_path
  end

  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @user = User.new
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :user_info, :display_name)
  end

end
