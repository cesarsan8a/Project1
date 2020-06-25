class ApplicationController < ActionController::Base
before_action :spotify_credentials, :fetch_user

private
  def fetch_user
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present?
  end

  def check_for_login
    redirect_to login_path unless @current_user.present?
  end
# spotify credentials allow the user to search songs in the spotify database
  def spotify_credentials
    RSpotify.authenticate(Rails.application.secrets.spotify_client_id, Rails.application.secrets.spotify_client_secret)
  end
end
