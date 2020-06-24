class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def show
    @playlists = Playlist.find params[:id]
  end
  
  def create
    playlist = Playlist.create playlist_params
    redirect_to playlist
  end

  private
  def playlist_params
    params.require(:playlist).permit(:title)
  end
end
