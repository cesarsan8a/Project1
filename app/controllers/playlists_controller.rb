class PlaylistsController < ApplicationController
  before_action :check_for_login
  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def show
    @playlist = Playlist.find params[:id]
  end

  def create
    playlist = Playlist.create playlist_params
    redirect_to playlist
  end

  def edit
    @playlist = Playlist.find params[:id]

  end

  def update
    playlist = Playlist.find params[:id]
    playlist.update playlist_params
    redirect_to playlist
  end

  def destroy
    playlist = Playlist.find params[:id]
    playlist.destroy
    redirect_to playlists_path
  end

  private
  def playlist_params
    params.require(:playlist).permit(:title, :user_id)
  end
end
