class ApplicationController < ActionController::Base
before_action :spotify_credentials

private
  def fetch_spotify_user
    user = User.find_by :id => session[:user_id] if session[:user_id].present?
    @current_user = RSpotify::User.new(user.user_info) if user.present?
  end

  def spotify_credentials
    RSpotify.authenticate(Rails.application.secrets.spotify_client_id, Rails.application.secrets.spotify_client_secret)
  end
end
