class SessionController < ApplicationController
  def new
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  end

  def create
    # @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # session[:user_id] = @spotify_user.display_name
    # redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
