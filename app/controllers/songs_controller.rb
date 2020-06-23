class SongsController < ApplicationController
  def new
    @song = Song.new
    @song_title = params[:title]
  end

  def show_result
    @song = Song.new
    @song.spotify_song_id = params[:spotify_id]

  end

  def create

  end

  def delete
  end
end
