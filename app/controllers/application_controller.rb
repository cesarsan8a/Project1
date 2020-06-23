class ApplicationController < ActionController::Base
before_action :spotify_credentials

private
def fetch_user
  @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
  session[:user_id] = nil unless @current_user.present?
end

def spotify_credentials
  RSpotify.authenticate(Rails.application.secrets.spotify_client_id, Rails.application.secrets.spotify_client_secret)
end
end
