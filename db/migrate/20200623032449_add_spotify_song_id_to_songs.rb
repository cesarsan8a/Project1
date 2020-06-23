class AddSpotifySongIdToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :spotify_song_id, :string
  end
end
