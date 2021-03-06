class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.save # If it can save it it will save the user id into the session params
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
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

# This action aunthenticates the user with Spotify.
  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @user = User.new
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :user_info, :display_name, :password, :password_confirmation)
  end

end
