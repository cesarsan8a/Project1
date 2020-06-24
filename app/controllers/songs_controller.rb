class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
    @song_title = params[:title]
    if @song_title.present?
      @spotify_search = RSpotify::Track.search(@song_title, limit: 50)
    end
  end

  def show_result
    @song = Song.new
    @playlist = Playlist.all
    @search_result = RSpotify::Track.find("#{ params[:spotify_id] }")
  end

  def show
    @songs = Song.find params[:id]
  end

  def create
    song = Song.create song_params
    playlist = Playlist.find params[:playlist_id]
    playlist.songs << song
    redirect_to song
  end

  def delete
  end

  def song_params
    params.require(:song).permit(:title, :artist, :album, :spotify_song_id, :image)
  end
end
