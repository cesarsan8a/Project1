class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

  end

  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])

  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
